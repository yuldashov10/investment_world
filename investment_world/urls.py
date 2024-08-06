from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from investment_world.views import index

urlpatterns = [
    path("", index),
    path("admin/", admin.site.urls),
]

if settings.DEBUG:
    urlpatterns += static(
        settings.STATIC_URL,
        document_root=settings.STATIC_ROOT
    )
