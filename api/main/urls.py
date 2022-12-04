from django.urls import path

from . import views


app_name = 'api_main'
urlpatterns = [
    path('artists/', views.ArtistListCreateAPIView.as_view()),
    path('artists/<int:pk>/', views.ArtistRetrieveUpdateDestroyAPIView.as_view()),
    path('items/', views.ItemListCreateAPIView.as_view()),
    path('items/<int:pk>/', views.ItemRetrieveUpdateDestroyAPIView.as_view()),
]
