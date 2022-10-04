from django.core.paginator import Paginator

from .models import Artist, Item


def cdcoll_objects(request):
    item_list = Item.objects.all()
    paginator = Paginator(item_list, 10)
    page_number = request.GET.get('page')
    page = paginator.get_page(page_number)
    return {
        'artist_list': Artist.objects.all(),
        'page': page,
        'paginator': paginator
    }
