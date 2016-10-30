# django imports
from django.contrib import admin
from lfs.addresses.models import Address, BaseAddress


class AddressAdmin(admin.ModelAdmin):
    search_fields = ('name', 'customer__user__email')
    list_display = ('name', 'telephone', 'customer', 'order')


class BaseAdressAdmin(admin.ModelAdmin):
    list_display = ('name', 'telephone', 'customer')

admin.site.register(BaseAddress, BaseAdressAdmin)
admin.site.register(Address, AddressAdmin)
