from django.contrib import admin
from django.urls import (include, path, re_path)
from django.conf.urls import (handler404, handler500)
from main.views import (other_pages, page_not_found, server_error)


handler404 = 'main.views.page_not_found' # noqa
handler500 = 'main.views.server_error' # noqa

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('main.urls', namespace='main')),
    path('basket/', include('basket.urls', namespace='basket')),
    path('account/', include('account.urls', namespace='account')),
    path('order/', include('order.urls', namespace='order')),
    path('payment/', include('payment.urls', namespace='payment')),
    path('api/v1/', include('api.main.urls', namespace='api_main')),
    path('api/v1/auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.authtoken')),
    path('<str:page>/', other_pages, name='other'),
    path('404/', page_not_found, name='404'),
    path('500/', server_error, name='500'),
]
