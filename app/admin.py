from django.contrib import admin
from app.models import Property, Request

# Register your models here.

class AuthorAdmin(admin.ModelAdmin):
    # list_display = ('propertyName','streetAddress','city','state','contactNo', 'useOptions','isActive', 'isFeatured')
    # list_filter = ['useOptions','propertyType','priceOption','state']
    search_fields = ['propertyName']
    

    pass
admin.site.register(Property, AuthorAdmin)
admin.site.register(Request, AuthorAdmin)
