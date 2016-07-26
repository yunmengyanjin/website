from django.contrib import admin
from .models import Coupon


class Admin_Coupon(admin.ModelAdmin):
    list_display = ('id', 'name', 'type', 'status', 'number')


admin.site.register(Coupon, Admin_Coupon)

