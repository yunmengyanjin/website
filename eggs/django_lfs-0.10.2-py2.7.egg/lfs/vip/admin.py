from django.contrib import admin
from .models import Vip


class VIPAdmin(admin.ModelAdmin):
    list_display = ('customer', 'name', 'discount', 'experience')
admin.site.register(Vip, VIPAdmin)
