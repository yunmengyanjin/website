from django.contrib import admin
from .models import Vip


class Admin_Vip(admin.ModelAdmin):
    list_display = ('id', 'name', 'discount')

admin.site.register(Vip,Admin_Vip)

# Register your models here.
