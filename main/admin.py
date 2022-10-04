from django.contrib import admin

from .models import (Artist, Item,
                     ItemStyle, ItemType,
                     Label)


class ArtistAdmin(admin.ModelAdmin):
    list_display = ('name', 'country',)
    prepopulated_fields = {'slug': ('name',)}


class ItemAdmin(admin.ModelAdmin):
    list_display = ('album', 'get_artists', 'label', 'year', 'in_stock',)
    list_filter = ('in_stock',)
    prepopulated_fields = {'slug': ('album',)}

    def get_artists(self, object):
        return ', '.join([artist.name for artist in object.artists.all()])
    get_artists.short_description = 'Исполнитель'


admin.site.register(Artist, ArtistAdmin)
admin.site.register(Item, ItemAdmin)
admin.site.register(Label)
admin.site.register(ItemType)
admin.site.register(ItemStyle)
