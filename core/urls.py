# -*- encoding: utf-8 -*-

from django.contrib import admin
from django.urls import path, include  # add this


from django.conf import settings
from django.conf.urls.static import static
if settings.DEBUG:
        urlpatterns = static(settings.MEDIA_URL,
                              document_root=settings.MEDIA_ROOT)


urlpatterns = [
    path('admin/', admin.site.urls),          # Django admin route
    # path("app/", include("app.urls")),
    path("", include("property.urls")),
    path("", include("authentication.urls")), # Auth routes - login / register
    path("", include("app.urls"))             # UI Kits Html files
]
    