from django.shortcuts import get_object_or_404, render
from .models import Artist, Item


def index(request):
    return render(request, 'main/index.html')


def artist_detail(request, pk, artist_slug):
    artist = Artist.objects.get(pk=pk, slug=artist_slug)
    return render(request,
                  'main/artist_detail.html',
                  context={'artist': artist})


def item_detail(request, pk, item_slug):
    album = get_object_or_404(Item, pk=pk, slug=item_slug)
    return render(request,
                  'main/item_detail.html',
                  context={'album': album})
