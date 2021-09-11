from app.models import Property

def sharedData(request):
    appName = "Mortgage Choice Sydney"
    copyRight = "© " + appName
    featuredListings = Property.objects.filter(isFeatured = True).order_by('propertyName')
    recentListings = Property.objects.filter(isActive = True).order_by('addedOn')
    # plasmaRequest = DonatePlasma.objects.all()
    # otherRequest = OtherRequest.objects.all()
    # otherRequestOxygen = OtherRequest.objects.filter(requestType = 'Oxygen')
    # otherRequestFood = OtherRequest.objects.filter(requestType = 'Food')
    # otherRequestCremation = OtherRequest.objects.filter(requestType = 'Cremation')
    # otherRequestQuarantineSpace = OtherRequest.objects.filter(requestType = 'Quarantine Space')
    # otherRequestOther = OtherRequest.objects.filter(requestType = 'Other')
    
    return {
            'featuredListings' : featuredListings,
            'RecentListings' : recentListings,
            # 'RecentotherRequests': otherRequest,
            # 'otherRequestOxygen': otherRequestOxygen,
            # 'otherRequestFood': otherRequestFood,
            # 'otherRequestCremation': otherRequestCremation,
            # 'otherRequestQuarantineSpace': otherRequestQuarantineSpace,
            # 'otherRequestOther': otherRequestOther,
            'appName': appName,
            'copyRight': copyRight }