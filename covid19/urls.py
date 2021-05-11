# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from collections import namedtuple
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name="index"),
    path('bedrequest', views.bedRequest, name="bedRequest"),
    path('donateplasma', views.donatePlasma, name="donatePlasma"),
    path('saveBedRequest', views.saveBedRequest, name="saveBedRequest"),
    path('contact', views.contactform, name="contactform"),
    path('worldwide', views.worldwide, name="worldwide"),
    path('vaccinations', views.vaccinations, name="vaccinations"),
    path('tests', views.tests, name="tests"),
    path('symptoms', views.symptoms, name="symptoms"),
    path('nearby', views.nearby, name="nearby")

]
