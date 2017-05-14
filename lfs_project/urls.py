from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin
admin.autodiscover()

handler500 = 'lfs.core.views.server_error'

urlpatterns = patterns("",
                       (r'', include('lfs.core.urls')),
                       (r'^manage/', include('lfs.manage.urls')),
                       (r'^admin/', include(admin.site.urls)),
                       (r'^paypal/ipn/', include('paypal.standard.ipn.urls')),
                       (r'^reviews/', include('reviews.urls')),
                       )

urlpatterns += patterns('',
                        (r'^media/(?P<path>.*)$',
                         'django.views.static.serve',
                         {'document_root': settings.MEDIA_ROOT}),
                        )

urlpatterns += patterns("ymyj_customer.views",
                        url(r'^login$', "user_login", name="lfs_login"),
                        url(r'^register$', "register", name='register'),
                        url(r'^my-account/order/$', "order", name="order"),
                        url(r'^my-account/address/$', "address", name="address"),
                        )
urlpatterns += patterns("ymyj_cargo.views",
                        url(r'^product/$', "product_detail", name="product"),
                        url(r'^pay/(?P<order_no>[\d]+)/$', "pay", name="pay"),
                        url(r'^pay/invoice/(?P<order_no>[\d]+)/$', 'invoice', name='invoice')
                        )

urlpatterns += patterns("home.views",
                        url(r'^partybuilding/$', 'party', name='party')
                        )
