from order.models import Order, OrderItem
from main.models import Item, Artist


def cds_from_certain_order(order):
    """
    Get CDs from a certain order made by a certain user.
    """

    order_items = OrderItem.objects.filter(order=order)
    products = []
    for order_item in order_items:
        products.append(order_item.product)
    return products

