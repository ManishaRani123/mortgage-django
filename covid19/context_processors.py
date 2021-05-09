from covid19.models import DonatePlasma, RequestBed


def summaryData(request):
    appName = "COVID19 Rapid Response"
    copyRight = "© " + appName
    bedRequests = RequestBed.objects.filter(seenStatus = False)
    plasmaRequest = DonatePlasma.objects.all()
    
    return {'RecentbedRequests' : bedRequests,'RecentPlasmaRequests' : plasmaRequest, 'appName': appName, 'copyRight': copyRight }


