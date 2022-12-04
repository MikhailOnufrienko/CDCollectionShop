from django.forms import model_to_dict
from rest_framework import generics, mixins, status, viewsets
from rest_framework.decorators import action
from rest_framework import permissions
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.views import APIView

from .permissions import IsAdminOrReadOnly
from .serializers import ArtistsSerializer, ItemsSerializer
from main.models import Artist, Item


class ArtistListCreateAPIView(generics.ListCreateAPIView,):
    queryset = Artist.objects.all()
    serializer_class = ArtistsSerializer
    permission_classes = (IsAdminOrReadOnly, )


class ArtistRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Artist.objects.all()
    serializer_class = ArtistsSerializer
    permission_classes = (IsAdminOrReadOnly, )


class ItemListCreateAPIView(generics.ListCreateAPIView,):
    queryset = Item.objects.all()
    serializer_class = ItemsSerializer
    permission_classes = (IsAdminOrReadOnly, )


class ItemRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Item.objects.all()
    serializer_class = ItemsSerializer
    permission_classes = (IsAdminOrReadOnly, )
