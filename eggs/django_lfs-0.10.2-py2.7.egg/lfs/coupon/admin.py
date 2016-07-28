from django.contrib import admin
from .models import Coupon


class Admin_Coupon(admin.ModelAdmin):
    list_display = ('id', 'name', 'coupon_type', 'status', 'number')


admin.site.register(Coupon, Admin_Coupon)

