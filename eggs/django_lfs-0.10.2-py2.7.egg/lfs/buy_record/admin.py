
from django.contrib import admin
from .models import Buy_Record


class Record(admin.ModelAdmin):
    list_display = ('id', 'customer', 'product', 'number', 'buy_time', 'total_price')

admin.site.register(Buy_Record, Record)


# Register your models here.
