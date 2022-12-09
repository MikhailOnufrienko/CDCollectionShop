from rest_framework import generics
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
