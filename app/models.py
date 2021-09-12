# -*- encoding: utf-8 -*-
# Create your models here.
from collections import defaultdict
from django.db import models
from django.contrib.auth.models import User

class Customers(models.Model):
    customerid = models.AutoField(primary_key=True)
    fname = models.CharField(max_length=50, blank=True, null=True)
    lname = models.CharField(max_length=50, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    telephone = models.CharField(max_length=10, blank=True, null=True)
    streetadd = models.CharField(max_length=50, blank=True, null=True)
    city = models.CharField(max_length=50, blank=True, null=True)
    country = models.CharField(max_length=50, blank=True, null=True)
    zip = models.CharField(max_length=5, blank=True, null=True)
    profileImage = models.ImageField(upload_to='images/', default="user.jpg")
    coverImage = models.ImageField(upload_to='images/', default="cover.jpg")
    slug = models.SlugField(max_length=255, editable=True, verbose_name='Slug / URL')
    description = models.TextField(blank=True, null=True, verbose_name="Description")
    userid = models.ForeignKey(User, models.DO_NOTHING, db_column='id', blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'customers'

class Orders(models.Model):
    orderid = models.AutoField(primary_key=True)
    total = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    entrydate = models.DateTimeField(blank=True, null=True)
    shipped = models.CharField(max_length=1, blank=True, null=True)
    # customerid = models.ForeignKey(Customers, models.DO_NOTHING, db_column='customerid', blank=True, null=True)
    customer = models.ForeignKey(Customers, models.DO_NOTHING, db_column='customerid', blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'orders'



# Create your models here.
class Property(models.Model):

    Property_Type = [
        ('Flat', 'Flat'),
        ('Apartment', 'Apartment'),
        ('Home', 'Home'),
        ('OfficeSpace', 'Office Space'),
        ('Showrooms-Bulky-Goods','Showrooms/Bulky Goods'),
        ('Commercial-Building', 'Commercial Building')
    ]

    Use_Options = [
        ('Rent', 'Rent'),
        ('Share', 'Share'),
        ('Buy','Buy'),
        ('Sell','Sell'),
        ('Lease', 'Lease'),
        ('Business-Purpose','Business Purpose'),
        ('General','General')
    ]

    Aus_States = [
        ('AU-NSW', 'New South Wales'),
        ('AU-QLD', 'Queensland'),
        ('AU-SA', 'South Australia'),
        ('AU-TAS', 'Tasmania'),
        ('AU-VIC', 'Victoria'),
        ('AU-WA', 'Western Australia')
    ]

    id = models.AutoField(primary_key=True)
    propertyName = models.CharField(max_length=200, verbose_name='Property Name')
    propertyType = models.CharField(choices=Property_Type, default='Flat', max_length=30, verbose_name='Property Type')
    propertyImage = models.ImageField(upload_to='images/', default="image.jpg")
    slug = models.SlugField(max_length=255, editable=True, verbose_name='Slug / URL')
    email = models.CharField(max_length=128, verbose_name='Email', null=True)
    contactNo = models.CharField(max_length=25, verbose_name='Contact No')
    streetAddress = models.CharField(max_length=200, verbose_name='Street Address')
    city = models.CharField(max_length=200, verbose_name='City')
    state = models.CharField( choices=Aus_States, default='', max_length=150, verbose_name='State')
    price = models.IntegerField(verbose_name='Price')
    priceOption = models.CharField(max_length=200, verbose_name="Pricing Model")
    useOptions = models.CharField(choices=Use_Options,default='Not Urgent', max_length=40, verbose_name='Use Options') 
    additionalInfo = models.TextField(verbose_name='Additional Information', blank=True, null=True)
    landAreaApprox = models.IntegerField(verbose_name= "Land Area Approx (sqm)")
    floorAreaApprox = models.IntegerField(verbose_name= "Floor Area Approx (sqm)")
    noOfBedrooms =models.IntegerField(verbose_name='No of BedRoom')
    noOfKitchen =models.IntegerField(verbose_name='No of Kitchen')
    noOfHall =models.IntegerField(verbose_name='No of Hall')
    noOfBathrooms = models.IntegerField(verbose_name='No of Bathroom')
    parking = models.IntegerField(verbose_name='No of Parking')
    amenities = models.TextField(blank=True, null=True, verbose_name="Features & Amenities")
    description = models.TextField(blank=True, null=True, verbose_name="Description")
    addedOn = models.DateTimeField(auto_now_add=True, blank=True, verbose_name="Added Date")
    isActive = models.BooleanField(default=True, verbose_name="Is Active")
    isFeatured = models.BooleanField(default=True, verbose_name="Is Featured")


class Request(models.Model):
    Urgency_Options = [
        ('Urgent', 'Urgent'),
        ('Moderate', 'Moderate'),
        ('Not Urgent', 'Not Urgent')
    ]
    Action_Status = [
        ('Request Received', 'Request Received'),
        ('Waiting', 'Waiting'),
        ('Under Approval', 'Under Approval'),
        ('Cancelled', 'Cancelled'),
        ('Approved', 'Approved'),
        ('Unspecified', 'Unspecified')
    ]
    id = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models., verbose_name='User')
    full_name = models.CharField(max_length=200, verbose_name='Full Name')
    age = models.IntegerField()
    email = models.CharField(max_length=128, verbose_name='Email', null=True)
    contactNo = models.CharField(max_length=30, verbose_name='Contact No')
    urgency = models.CharField(choices=Urgency_Options,default='Not Urgent', max_length=40, verbose_name='Urgency') 
    additionalInfo = models.TextField(verbose_name='Additional Information', blank=True, null=True)
    requestOn = models.DateTimeField(auto_now_add=True, blank=True, verbose_name="Request Date")
    seenStatus = models.BooleanField(default=False, verbose_name='Seen Status')
    action_status = models.CharField(choices=Action_Status,default='Receive', blank=True, max_length=200, verbose_name='Plasma Donate')