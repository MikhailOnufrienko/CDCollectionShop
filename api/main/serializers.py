from main.models import Artist, Item
from rest_framework import serializers


class ArtistsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Artist
        fields = ['name', 'country', 'slug']


class ItemsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = '__all__'
