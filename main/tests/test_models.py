from django.test import TestCase

from main.models import Artist, Item, ItemStyle, ItemType, Label


class TestArtistModel(TestCase):
    def setUp(self) -> None:
        self.data = Artist.objects.create(name='Metallica', slug='metallica')

    def test_artist_model_entry(self):
        """
        Tests Artist model default name as a string representation.
        :return: None
        """
        data = self.data
        self.assertEqual(str(data), 'Metallica')


class TestItemTypeModel(TestCase):
    def setUp(self) -> None:
        self.data = ItemType.objects.create(format='CD')

    def test_itemtype_model_etry(self):
        """
        Tests ItemType model default name as a string representation.
        :return: None
        """
        data = self.data
        self.assertEqual(str(data), 'CD')


class TestLabelModel(TestCase):
    def setUp(self) -> None:
        self.data = Label.objects.create(name='Atlantic')

    def test_label_model_etry(self):
        """
        Tests Label model default name as a string representation.
        :return: None
        """
        data = self.data
        self.assertEqual(str(data), 'Atlantic')


class TestItemStyleModel(TestCase):
    def setUp(self) -> None:
        self.data = ItemStyle.objects.create(name='rock')

    def test_itemstyle_model_etry(self):
        """
        Tests ItemStyle model default name as a string representation.
        :return: None
        """
        data = self.data
        self.assertEqual(str(data), 'rock')


class TestItemModel(TestCase):
    def setUp(self) -> None:
        self.artist = Artist.objects.create(name='Metallica', slug='metallica')
        self.style = ItemStyle.objects.create(name=ItemStyle.Styles.METAL)
        self.item_type = ItemType.objects.create(format=ItemType.Types.CD)
        self.label = Label.objects.create(name='Roadrunner')
        self.item = Item.objects.create(album='Ride The Lightning', item_type=self.item_type,
                                        slug='ride-the-lightning', label=self.label, year='1984',
                                        price=79.90, in_stock=True,)
        self.item.artists.add(self.artist)
        self.item.styles.add(self.style)

    def test_item_model_etry(self):
        """
        Tests Item model default name as a string representation.
        :return: None
        """
        data = self.item
        self.assertEqual(str(data), 'Ride The Lightning')

    def test_item_labels_entry(self):
        """
        Tests get_labels method of Item model.
        Test passes if method returns two labels (if any licensed_by label exists)
        or if method returns single label (if no licensed_by label exists).
        :return:
        """
        data = self.item.get_labels()
        self.assertEqual(str(data), 'Roadrunner')
        self.lic_label = Label.objects.create(name='Universal Russia')
        self.item.licensed_by = self.lic_label
        data = self.item.get_labels()
        self.assertEqual(str(data), 'Roadrunner/Universal Russia')
