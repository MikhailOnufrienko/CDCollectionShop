from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render

from main.models import Item
from .basket import Basket


def basket_summary(request):
    basket = Basket(request)
    return render(request, 'basket/summary.html', {'basket': basket})


def basket_add(request):
    basket = Basket(request)
    if request.POST.get('action') == 'post':
        item_id = int(request.POST.get('item_id'))
        item_quantity = int(request.POST.get('item_quantity'))
        item = get_object_or_404(Item, id=item_id)
        basket.add(item=item, quantity=item_quantity)
        basket_quantity = basket.__len__()
        response = JsonResponse({'quantity': basket_quantity})
        return response


def basket_delete(request):
    basket = Basket(request)
    if request.POST.get('action') == 'post':
        item_id = int(request.POST.get('item_id'))
        basket.delete(item=item_id)
        basket_quantity = basket.__len__()
        basket_total = basket.get_total_price()
        response = JsonResponse({'quantity': basket_quantity, 'subtotal': basket_total})
        return response


def basket_update(request):
    basket = Basket(request)
    if request.POST.get('action') == 'post':
        item_id = int(request.POST.get('item_id'))
        item_quantity = int(request.POST.get('item_quantity'))
        basket.update(item=item_id, quantity=item_quantity)
        basket_quantity = basket.__len__()
        basket_total = basket.get_total_price()
        response = JsonResponse({'quantity': basket_quantity, 'subtotal': basket_total})
        return response
