from django.contrib import admin
from app.models import Customers, Orders, Property, Booking

# Register your models here.

class AuthorAdmin(admin.ModelAdmin):
    # list_display = ('propertyName','streetAddress','city','state','contactNo', 'useOptions','isActive', 'isFeatured')
    # list_filter = ['useOptions','propertyType','priceOption','state']
    # search_fields = ['propertyName']

    pass
admin.site.register(Property, AuthorAdmin)
admin.site.register(Booking, AuthorAdmin)
# admin.site.register(Customers, AuthorAdmin)
# admin.site.register(Orders, AuthorAdmin)
