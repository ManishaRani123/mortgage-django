# -*- encoding: utf-8 -*-

from django.db.models import query
from core.settings import ADMIN_EMAIL, CORE_DIR, DEFAULT_FROM_EMAIL, EMAIL_HOST_USER, EMAIL_USE_TLS, STATICFILES_DIRS
from typing import Reversible
import datetime
import os
from django.http.response import HttpResponseRedirect, JsonResponse
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render, get_object_or_404
import json
from django.core.mail import send_mail
import smtplib
from email.mime.multipart import MIMEMultipart
from django.core.mail import EmailMessage
from django.template import loader
from django.http import HttpResponse
from django import template



from django.contrib import messages
from django.conf import settings
from decimal import Decimal
from .models import Property
# from .forms import CartForm, CheckoutForm



# Load Models
from app.models import Property

from django.template.loader import get_template, render_to_string



def sendNotifyEmail(name, email, requestType):
    subject = 'Your request has been received : COVID19 Response'
    ctx = {
        'name': name,
        'requestType': requestType
    }
    html_content = render_to_string('covid-19/notifyEmail.html', ctx)
    
    # message = f'Hi Admin, {name} from {address} has requested some help. Please respond back'
    email_from = DEFAULT_FROM_EMAIL
    recipient_list = [email, 'itsmeasmitapandey@gmail.com']
    send_mail( subject, html_content, email_from, recipient_list, html_message=html_content, fail_silently=False )



def emailtoAdmin(name, age,gender, email, phone, address, requestFor, additionalMsg):
    subject = 'New Request received : COVID19 Response'
    ctx = {
        'name': name,
        'age': age,
        'gender': gender,
        'email': email,
        'phone': phone,
        'address': address,
        'requestFor': requestFor,
        'additionalMsg': additionalMsg
    }

    html_content = render_to_string('covid-19/emailToAdmin.html', ctx)
    
    # message = f'Hi Admin, {name} from {address} has requested some help. Please respond back'
    email_from = DEFAULT_FROM_EMAIL
    html_message = "<b>Name: </b>" + str(name) + "\n<b>Age: </b>" +  str(age) + "\n<b>Phone: </b>"+  str(phone) + "\n<b>Email: </b>" +  str(email) + "\n<b>Address: </b>" +  str(address) + "\n<b>Additional Info: </b>" +  str(additionalMsg)
    recipient_list = [ADMIN_EMAIL, 'itsmeasmitapandey@gmail.com']
    send_mail( subject, html_content, email_from, recipient_list, html_message=html_content, fail_silently=False )


def index(request):
    # context={'dateCat':dateCat,'dataForheatMap':dataForheatMap,'maxVal':maxVal,'dataForMapGraph':dataForMapGraph,'axisvalues':axisvalues,'datasetForLine':datasetForLine,'uniqueCountryNames':uniqueCountryNames,'contryNames':contryNames,'countsVal':countsVal,'logVals':logVals,'overallCount':overallCount}
    # featuredProperties = Property.objects.all()
    # context = {'featuredProperties': featuredProperties}
    return render(request,'frontend/home.html')


# SearchPage
def search(request, PropType):
    # context={'dateCat':dateCat,'dataForheatMap':dataForheatMap,'maxVal':maxVal,'dataForMapGraph':dataForMapGraph,'axisvalues':axisvalues,'datasetForLine':datasetForLine,'uniqueCountryNames':uniqueCountryNames,'contryNames':contryNames,'countsVal':countsVal,'logVals':logVals,'overallCount':overallCount}
    # query = Property(propertyType=PropType)
    # query.add(Property(useOptions=options), Property.OR)
    # query.add(Property(propertyName=s), Property.OR)
    propertyType = PropType
    searchData = Property.objects.filter(propertyType = propertyType)
    # context = {'featuredProperties': featuredProperties}
    return render(request,'frontend/search.html',{'searchData': searchData})


# Show PropertyDetailPage
def showProperty(request, Slug):
    data = Property.objects.get(slug = Slug)
    context = {'PropertyDetail': data}
    return render(request, "frontend/PropertyDetailView.html", context)


# def process_payment(request):
#     order_id = request.session.get('order_id')
#     order = get_object_or_404(Order, id=order_id)
#     host = request.get_host()

#     paypal_dict = {
#         'business': settings.PAYPAL_RECEIVER_EMAIL,
#         'amount': '%.2f' % order.total_cost().quantize(
#             Decimal('.01')),
#         'item_name': 'Order {}'.format(order.id),
#         'invoice': str(order.id),
#         'currency_code': 'USD',
#         'notify_url': 'http://{}{}'.format(host,
#                                            reverse('paypal-ipn')),
#         'return_url': 'http://{}{}'.format(host,
#                                            reverse('payment_done')),
#         'cancel_return': 'http://{}{}'.format(host,
#                                               reverse('payment_cancelled')),
#     }

#     form = PayPalPaymentsForm(initial=paypal_dict)
#     return render(request, 'ecommerce_app/process_payment.html', {'order': order, 'form': form})

# @login_required(login_url="/login/")
# def index(request):
    
#     context = {}
#     context['segment'] = 'index'

#     html_template = loader.get_template( 'index.html' )
#     return HttpResponse(html_template.render(context, request))

@login_required(login_url="/login/")
def pages(request):
    context = {}
    # All resource paths end in .html.
    # Pick out the html file name from the url. And load that template.
    try:
        
        load_template      = request.path.split('/')[-1]
        context['segment'] = load_template
        
        html_template = loader.get_template( load_template )
        return HttpResponse(html_template.render(context, request))
        
    except template.TemplateDoesNotExist:

        html_template = loader.get_template( 'page-404.html' )
        return HttpResponse(html_template.render(context, request))

    except:
    
        html_template = loader.get_template( 'page-500.html' )
        return HttpResponse(html_template.render(context, request))
