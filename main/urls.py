from django.urls import path

from .views import (artist_detail, index,
                    item_detail)

app_name = 'main'
urlpatterns = [
    path('artist/<int:pk>/<slug:artist_slug>/', artist_detail, name='artist_detail'),
    path('item/<int:pk>/<slug:item_slug>/', item_detail, name='item_detail'),
    path('', index, name='index'),
]
