from covid19.models import DonatePlasma, OtherRequest, RequestBed


def summaryData(request):
    # appName = "COVID-19 Response"
    # copyRight = "© " + appName
    bedRequests = RequestBed.objects.filter(seenStatus = False)
    plasmaRequest = DonatePlasma.objects.all()
    otherRequest = OtherRequest.objects.all()
    otherRequestOxygen = OtherRequest.objects.filter(requestType = 'Oxygen')
    otherRequestFood = OtherRequest.objects.filter(requestType = 'Food')
    otherRequestCremation = OtherRequest.objects.filter(requestType = 'Cremation')
    otherRequestQuarantineSpace = OtherRequest.objects.filter(requestType = 'Quarantine Space')
    otherRequestOther = OtherRequest.objects.filter(requestType = 'Other')
    
    return {'RecentbedRequests' : bedRequests,
            'RecentPlasmaRequests' : plasmaRequest,
            'RecentotherRequests': otherRequest,
            'otherRequestOxygen': otherRequestOxygen,
            'otherRequestFood': otherRequestFood,
            'otherRequestCremation': otherRequestCremation,
            'otherRequestQuarantineSpace': otherRequestQuarantineSpace,
            'otherRequestOther': otherRequestOther,
            # 'appName': appName,
            # 'copyRight': copyRight 
            }