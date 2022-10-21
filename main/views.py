from django.db.models import Q
from django.shortcuts import get_object_or_404, render
from django.template.loader import get_template
from django.template import TemplateDoesNotExist
from django.http import Http404, HttpResponse
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


def search(request):
    """Return the result of search.

    The result of search is an item or items, which has/have
    an artist or an album name matching the search input.
    """
    search_results = []
    search_query = request.GET.get('search_input')
    if search_query:
        search_results = Item.objects.filter(
            Q(
                artists__name__icontains=search_query
            ) | Q(
                album__icontains=search_query
            )
        ).order_by('artists', 'album')
    search_results_unique = []
    for search_item in search_results:
        if search_item not in search_results_unique:
            search_results_unique.append(search_item)
    context = {
        'search_results': search_results_unique
    }
    return render(request, 'main/search_result.html', context)


def other_pages(request, page):
    try:
        template = get_template('misc/' + page + '.html')
    except TemplateDoesNotExist:
        raise Http404
    return HttpResponse(template.render(request=request))


def page_not_found(request, exception):
    return render(
                  request,
                  'misc/404.html',
                  {'path': request.path},
                  status=404
    )


def server_error(request):
    return render(
                  request,
                  'misc/500.html',
                  status=500
    )
