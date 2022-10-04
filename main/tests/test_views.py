from importlib import import_module
from django.conf import settings
from django.http import HttpRequest
from django.test import Client, TestCase
from django.urls import reverse

from main.models import Artist, Item, ItemStyle, ItemType, Label
from main.views import index


class TestViewResponse(TestCase):
    def setUp(self) -> None:
        self.c = Client()
        artist = Artist.objects.create(id=14, name='Blondie', country='USA', slug='blondie')
        item_type = ItemType.objects.create(format='CD')
        label = Label.objects.create(name='BMG')
        item_style = ItemStyle.objects.create(name='rock')
        item = Item.objects.create(id=11, album='Pollinator', item_type=item_type,
                                   slug='pollinator', label=label, licensed_by=None,
                                   year='2017', license_year=None, price=185.90, in_stock=True)
        item.artists.add(artist)
        item.styles.add(item_style)

    def test_url_allowed_hosts(self):
        """
        Test allowed hosts.
        :return:
        """
        response = self.c.get('/', HTTP_HOST='wrongaddress.com')
        self.assertEqual(response.status_code, 400)

    def test_artist_detail_url(self):
        """
        Tests artist response status.
        :return:
        """
        response = self.c.get(reverse('main:artist_detail', args=[14, 'blondie']))
        self.assertEqual(response.status_code, 200)

    def test_item_detail_url(self):
        """
        Tests item response status.
        :return:
        """
        response = self.c.get(reverse('main:item_detail', args=[11, 'pollinator']))
        self.assertEqual(response.status_code, 200)

    def test_index_html(self):
        """
        Tests views.index to return an html page.
        :return:
        """
        request = HttpRequest()
        engine = import_module(settings.SESSION_ENGINE)
        request.session = engine.SessionStore()
        response = index(request)
        html = response.content.decode('utf8')
        self.assertIn('<title>CD Collection Shop</title>', html)
        self.assertTrue(html.startswith('\n\n\n<!DOCTYPE html>\n'))
        self.assertEqual(response.status_code, 200)

    def test_404_page_not_found(self):
        """
        Tests the view returns 404 error if page not found.
        :return:
        """
        response = self.c.get('nonexistent-page/')
        self.assertEqual(response.status_code, 404)
