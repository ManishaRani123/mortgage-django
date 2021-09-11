# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django.urls import path, re_path
from app import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [

    # The home page
    path('', views.index, name="home"),

    path('listings/<slug:Slug>/',
        views.showProperty, name='showProperty'),

    path('search/<slug:PropType>/',
        views.search, name='search')


    # static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT),
    # path('hotel_images', display_hotel_images, name = 'hotel_images'),

    # Matches any html file
    # re_path(r'^.*\.*', views.pages, name='pages'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
