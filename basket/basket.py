from decimal import Decimal

from main.models import Item


class Basket:
    """
    A base basket class with some default behaviour that can be
    inherited or overridden if necessary.
    """
    def __init__(self, request):
        self.session = request.session
        basket = self.session.get('session_key')
        if 'session_key' not in request.session:
            basket = self.session['session_key'] = {}
        self.basket = basket

    def add(self, item, quantity):
        """
        Adding and updating users' basket session data.
        :param quantity:
        :param item:
        :return:
        """
        item_id = str(item.id)
        if item_id in self.basket:
            self.basket[item_id]['quantity'] = quantity
        else:
            self.basket[item_id] = {'price': str(item.price), 'quantity': quantity}
        self.save()

    def __iter__(self):
        """
        Collect the item_id in the session data to query the database
        and return items.
        :return:
        """
        item_ids = self.basket.keys()
        items = Item.objects.filter(id__in=item_ids)
        basket = self.basket.copy()
        for item in items:
            basket[str(item.id)]['item'] = item
        for thing in basket.values():
            thing['price'] = Decimal(thing['price'])
            thing['total_price'] = thing['price'] * thing['quantity']
            yield thing

    def __len__(self):
        """
        Get basket data and count quantity of items.
        :return:
        """
        return sum(thing['quantity'] for thing in self.basket.values())

    def get_total_price(self):
        return sum(Decimal(thing['price']) * thing['quantity'] for thing in self.basket.values())

    def delete(self, item):
        """
        Delete item from session data.
        :return:
        """
        item_id = str(item)
        if item_id in self.basket:
            del self.basket[item_id]
        self.save()

    def update(self, item, quantity):
        """
        Updates values in session data.
        :param item:
        :param quantity:
        :return:
        """
        item_id = str(item)
        if item_id in self.basket:
            self.basket[item_id]['quantity'] = quantity
        self.save()

    def save(self):
        """
        Saves the state of the basket in the session
        after adding or deleting items.
        :return:
        """
        self.session.modified = True
