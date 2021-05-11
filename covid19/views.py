from core.settings import CORE_DIR, STATICFILES_DIRS
from typing import Reversible
import datetime
import os
from django.http.response import HttpResponseRedirect, JsonResponse
from covid19.models import DonatePlasma, RequestBed
from django.shortcuts import redirect, render
import json

# Contact form
from .forms import ContactForm, DonatePlasmaForm

import pandas as pd
import numpy as np
# Create your views here.
df3=pd.read_json('https://cdn.jsdelivr.net/gh/highcharts/highcharts@v7.0.0/samples/data/world-population-density.json')
confirmedGlobal=pd.read_csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv',encoding='utf-8',na_values=None)
deathGLobal=pd.read_csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv')
recoverGlobal=pd.read_csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv')


def index(request):
    # confirmedGlobal=pd.read_csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv',encoding='utf-8',keep_default_na=False, na_values="")
    # deathGLobal=pd.read_csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv')
    # recoverGlobal=pd.read_csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv')
    uniqueCountryNames=pd.unique(confirmedGlobal['Country/Region'])
    contryNames,countsVal,logVals,overallCount,dataForMapGraph,maxVal=getBarData(confirmedGlobal,uniqueCountryNames)
    dataForheatMap,dateCat=getHeatMapData(confirmedGlobal,contryNames)
    datasetForLine,axisvalues=getLinebarGroupData(confirmedGlobal,uniqueCountryNames)
    context={'dateCat':dateCat,'dataForheatMap':dataForheatMap,'maxVal':maxVal,'dataForMapGraph':dataForMapGraph,'axisvalues':axisvalues,'datasetForLine':datasetForLine,'uniqueCountryNames':uniqueCountryNames,'contryNames':contryNames,'countsVal':countsVal,'logVals':logVals,'overallCount':overallCount}
    return render(request,'covid19/worldwide.html',context)
    
# def summaryData(confirmedGlobal, deathGLobal, recoverGlobal):
#     confirmedGlobal.columns[4:-1]
#     df2=confirmedGlobal[list(confirmedGlobal.columns[1:2])+list(confirmedGlobal.columns[-4:])]
#     return df2
    

def getBarData(confirmedGlobal,uniqueCountryNames):
    df2=confirmedGlobal[list(confirmedGlobal.columns[1:2])+list([confirmedGlobal.columns[-2]])]
    df2.columns=['Country/Region','values']
    df2=df2.sort_values(by='values',ascending=False)
    contryNames=list(df2['Country/Region'].values)
    countsVal=list(df2['values'].values)
    maxVal=max(countsVal)
    overallCount=sum(countsVal)
    logVals=list(np.log(ind) if ind != 0 else 0 for ind in countsVal )
    dataForMapGraph=getDataforMap(uniqueCountryNames,df2)
    # dictVal=[]
    # for i in range(df2.shape[0]):
    #     dictVal.append(dict(df2.ix[i]))
    return (contryNames,countsVal,logVals,overallCount,dataForMapGraph,maxVal)

def getLinebarGroupData(confirmedGlobal,uniqueCountryNames):
    colNames=confirmedGlobal.columns[4:-1]
    datasetsForLine=[]
    for i in uniqueCountryNames:
        temp={}
        temp['label']=i
        temp['fill']='false'
        temp['data']=confirmedGlobal[confirmedGlobal['Country/Region']==i][colNames].sum().values.tolist()
        datasetsForLine.append(temp)
    return datasetsForLine,list(range(len(colNames)))

def getDataforMap(uniqueCOuntryName,df2):
    dataForMap=[]
    for i in uniqueCOuntryName:
        try:
            tempdf=df3[df3['name']==i]
            temp={}
            temp["code3"]=list(tempdf['code3'].values)[0]
            temp["name"]=i
            temp["value"]=df2[df2['Country/Region']==i]['values'].sum()
            temp["code"]=list(tempdf['code'].values)[0]
            dataForMap.append(temp)
        except:
            pass
    print (len(dataForMap))
    return dataForMap


def getHeatMapData(confirmedGlobal,contryNames):
    df3=confirmedGlobal[list(confirmedGlobal.columns[1:2])+list(list(confirmedGlobal.columns.values)[-6:-1])]
    dataForheatMap=[]
    for i in contryNames:
        try:
            tempdf=df3[df3['Country/Region']==i]
            temp={}
            temp["name"]=i
            temp["data"]=[{'x':j,'y':k} for j,k in zip(tempdf[tempdf.columns[1:]].sum().index,tempdf[tempdf.columns[1:]].sum().values)]
            dataForheatMap.append(temp)
        except:
            pass
    dateCat=list(list(confirmedGlobal.columns.values)[-6:-1])
    return dataForheatMap,dateCat


def drillDownACountry(request):
    print (request.POST.dict())
    countryName=request.POST.get('countryName')
    confirmedGlobal=pd.read_csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv',encoding='utf-8',na_values=None)
    countryDataSpe=pd.DataFrame(confirmedGlobal[confirmedGlobal['Country/Region']==countryName][confirmedGlobal.columns[4:-1]].sum()).reset_index()
    countryDataSpe.columns=['country','values']
    countryDataSpe['lagVal']=countryDataSpe['values'].shift(1).fillna(0)
    countryDataSpe['incrementVal']=countryDataSpe['values']-countryDataSpe['lagVal']
    countryDataSpe['rollingMean']=countryDataSpe['incrementVal'].rolling(window=4).mean()
    countryDataSpe=countryDataSpe.fillna(0)
    datasetsForLine=[{'yAxisID': 'y-axis-1','label':'Daily Cumulated Data','data':countryDataSpe['values'].values.tolist(),'borderColor':'#03a9fc','backgroundColor':'#03a9fc','fill':'false'},
                    {'yAxisID': 'y-axis-2','label':'Rolling Mean 4 days','data':countryDataSpe['rollingMean'].values.tolist(),'borderColor':'#fc5203','backgroundColor':'#fc5203','fill':'false'}]
    axisvalues=countryDataSpe.index.tolist()
    uniqueCountryNames=pd.unique(confirmedGlobal['Country/Region'])
    contryNames,countsVal,logVals,overallCount,dataForMapGraph,maxVal=getBarData(confirmedGlobal,uniqueCountryNames)
    dataForheatMap,dateCat=getHeatMapData(confirmedGlobal,contryNames)
    context=context={"countryName":countryName,'axisvalues':axisvalues,'datasetsForLine':datasetsForLine,'dateCat':dateCat,'dataForheatMap':dataForheatMap,'maxVal':maxVal,'dataForMapGraph':dataForMapGraph,'uniqueCountryNames':uniqueCountryNames,'contryNames':contryNames,'countsVal':countsVal,'logVals':logVals,'overallCount':overallCount}

    return render(request,'index2.html',context)


def bedRequest(request):
    message = ""
    
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            formData=form.save(commit=False)

            formData.full_name = request.POST.get('full_name')
            formData.age = request.POST.get('age')
            formData.gender = request.POST.get('gender')
            formData.contactNo = request.POST.get('contactNo')
            formData.streetAddress = request.POST.get('streetAddress')
            formData.city = request.POST.get('city')
            formData.state = request.POST.get('state')
            formData.bedsQty = request.POST.get('bedsQty')
            formData.urgency = request.POST.get('urgency')
            formData.bedType = request.POST.get('bedType')
            formData.additionalInfo = request.POST.get('additionalInfo')
            formData.requestDate = datetime.date.today()
            
            formData.save()
            message = "Saved Successfully"
        else:
            form = ContactForm()
            message = "Cannot Save. Please try again"
    form = ContactForm()
    allRequests = RequestBed.objects.all()
    return render(request, 'covid19/bedrequest.html', {'bedRequests': allRequests, 'RequestForm': form, 'message': message})
    

def saveBedRequest(request):
    allRequests = RequestBed.objects.all()
    RequestForm = ContactForm()
    message = str(allRequests.count()) + " Bed Requests"
    context = {'bedRequests': allRequests, 'totalRequest': message, 'RequestForm': RequestForm}
    return render(request, 'covid19/bedrequest.html', context)

# def requestBedNow(request):
#     form = ContactForm()
#     return render(request, 'covid19/contactform.html', {'form': form})


# Donate Plasma for COVID19
def donatePlasma(request):
    message = ""
    
    if request.method == 'POST':
        form = DonatePlasmaForm(request.POST)
        if form.is_valid():
            formData=form.save(commit=False)
            
            formData.save()
            message = "Saved Successfully"
        else:
            form = ContactForm()
            message = "Cannot Save. Please try again"
    form = DonatePlasmaForm()
    allRequests = DonatePlasma.objects.all()
    return render(request, 'covid19/donateplasma.html', {'bedRequests': allRequests, 'RequestForm': form, 'message': message})
    
# COntact Form
def contactform(request):
    message = ""
    if request.method == 'POST':
        form = ContactForm(request.POST)
        message = form;
        if form.is_valid():

            formData=form.save(commit=False)

            formData.full_name = request.POST.get('full_name')
            formData.age = request.POST.get('age')
            formData.gender = request.POST.get('gender')
            
            formData.save()
            message = "Saved Successfully"
            # return HttpResponseRedirect(Reversible(contact_details, args=(new_contact.pk,)))
    else:
        form = ContactForm()
        message = "Cannot Save. Please try again"
        
    return render(request, 'covid19/contactform.html', {'form': form, 'message': message})


def worldwide(request):
    return render(request,'covid19/worldwide.html')

def vaccinations(request):
    return render(request,'covid19/vaccinations.html')

def tests(request):
    return render(request,'covid19/tests.html')

def symptoms(request):
    return render(request,'covid19/symptoms.html')

def hospitals(request):
    return render(request,'covid19/nearby.html')


def nearby(request):
    csv_path = os.path.join(CORE_DIR, 'core/static/data/private-hospitals-list.csv')
    header_list = ["FacilityName", "ApplicantProprietor", "Fac Add", "Fac Add SUB", "Pcode", "Telephone"]
    hospitals = pd.read_csv(csv_path)
    selectedHospitals = hospitals.to_html()


    json_records = hospitals.to_json(orient ='records')
    data = []
    data = json.loads(json_records)
   

    

    # message = "CSV Path "
    return render(request, 'covid19/nearby.html', {'Hospitals': selectedHospitals,'d': data})