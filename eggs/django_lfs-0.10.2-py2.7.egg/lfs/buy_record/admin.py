
from django.contrib import admin
from .models import Buy_Record, UserOrder


class Record(admin.ModelAdmin):
    list_display = ('id', 'customer', 'product', 'number', 'buy_time', 'total_price')


class UserOrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'order_no', 'status', 'expressage', 'express_no', 'order_time')

admin.site.register(Buy_Record, Record)
admin.site.register(UserOrder, UserOrderAdmin)


# Register your models here.
