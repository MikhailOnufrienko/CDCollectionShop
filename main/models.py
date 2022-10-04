from django.db import models


class Artist(models.Model):
    name = models.CharField(max_length=64, verbose_name='Исполнитель')
    country = models.CharField(max_length=32, null=True, blank=True, verbose_name='Страна')
    slug = models.SlugField(max_length=64, db_index=True, verbose_name='URL')

    class Meta:
        verbose_name = 'Исполнитель'
        verbose_name_plural = 'Исполнители'
        ordering = ['name']

    def __str__(self):
        return self.name


class ItemType(models.Model):
    class Types(models.TextChoices):
        CD = 'CD', 'CD'
        DOUBLE_CD = '2xCD', '2xCD'
        CD_DIGIPAK = 'CD Digipak', 'CD Digipak'
        DOUBLE_CD_DIGIPAK = '2xCD Digipak', '2xCD Digipak'
        DVD = 'DVD', 'DVD'
        DOUBLE_DVD = '2xDVD', '2xDVD'
        DVD_DIGIPAK = 'DVD Digipak', 'DVD Digipak'
        DOUBLE_DVD_DIGIPAK = '2xDVD Digipak', '2xDVD Digipak'
    format = models.CharField(max_length=16, choices=Types.choices, default=Types.CD, verbose_name='Формат')

    class Meta:
        verbose_name = 'Формат'
        verbose_name_plural = 'Форматы'

    def __str__(self):
        return self.format


class Label(models.Model):
    name = models.CharField(max_length=50, verbose_name='Название')

    class Meta:
        verbose_name = 'Лейбл'
        verbose_name_plural = 'Лейблы'

    def __str__(self):
        return self.name


class ItemStyle(models.Model):
    class Styles(models.TextChoices):
        ELECTRONIC = 'electronic', 'electronic'
        HIP_HOP = 'hip hop', 'hip hop'
        JAZZ = 'jazz', 'jazz'
        ROCK = 'rock', 'rock'
        METAL = 'metal', 'metal'
        REGGAE = 'reggae', 'reggae'
        LATIN = 'latin', 'latin'
        FUNK_SOUL = 'funk/soul', 'funk/soul'
        BLUES = 'blues', 'blues'
        POP = 'pop', 'pop'
        CLASSICAL = 'classical', 'classical'
        FOLK_WORLD_COUNTRY = 'folk/world/country', 'folk/world/country'
    name = models.CharField(max_length=50, choices=Styles.choices, verbose_name='Стиль')

    class Meta:
        verbose_name = 'Стиль'
        verbose_name_plural = 'Стили'

    def __str__(self):
        return self.name


class Item(models.Model):
    album = models.CharField(max_length=128, verbose_name='Альбом')
    item_type = models.ForeignKey(ItemType, related_name='items', default='CD', on_delete=models.PROTECT)
    artists = models.ManyToManyField(Artist)
    styles = models.ManyToManyField(ItemStyle)
    slug = models.SlugField(max_length=128, db_index=True, verbose_name='URL')
    label = models.ForeignKey(Label, related_name='items', verbose_name='Лейбл', on_delete=models.PROTECT)
    licensed_by = models.ForeignKey(Label, null=True, blank=True, related_name='licensed_items',
                                    on_delete=models.PROTECT)
    year = models.CharField(max_length=4, verbose_name='Год')
    license_year = models.CharField(max_length=4, null=True, blank=True)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    quantity = models.IntegerField(verbose_name='Количество', default=5)
    in_stock = models.BooleanField(default=True, verbose_name='В наличии')

    class Meta:
        verbose_name = 'Товар'
        verbose_name_plural = 'Товар'
        ordering = ['-id']

    def __str__(self):
        return self.album

    def get_labels(self):
        if self.licensed_by:
            return '%s/%s' % (self.label, self.licensed_by)
        else:
            return self.label

    def get_quantity(self):
        stock_quantity = str(self.quantity)
        return [i for i in range(1, int(stock_quantity) + 1)]
