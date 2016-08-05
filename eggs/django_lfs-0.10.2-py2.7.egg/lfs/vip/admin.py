from django.contrib import admin
from .models import Vip


class VIPAdmin(admin.ModelAdmin):
    list_display = ('level', 'discount')
admin.site.register(Vip, VIPAdmin)
