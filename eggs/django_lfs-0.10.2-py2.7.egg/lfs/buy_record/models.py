# coding=utf-8
from __future__ import unicode_literals
from lfs.customer.models import Customer
from lfs.catalog.models import Product
from lfs.addresses.models import BaseAddress
from django.db import models
from django.utils import timezone
from .constants import PAYSTATUS


class Buy_Record(models.Model):
    customer = models.ForeignKey(Customer, verbose_name="用户", blank=True, null=True)
    product = models.ForeignKey(Product, verbose_name="产品", blank=True, null=True)
    number = models.IntegerField(u'数量', blank=True, null=True)
    buy_time = models.DateTimeField(u'购买时间', blank=True, null=True)
    unit_price = models.DecimalField(u'单价', blank=True, null=True, max_digits=10, decimal_places=2)
    total_price = models.DecimalField(u'总价', blank=True, null=True, max_digits=10, decimal_places=2)
    order_no = models.CharField(u'订单号', blank=True, null=True, db_index=True, unique=True, max_length=255)
    status = models.IntegerField(u'订单状态', blank=True, null=True, choices=PAYSTATUS)
    address = models.ForeignKey(BaseAddress, blank=True, null=True, verbose_name='u地址')
    expressage = models.CharField(u'快递商', blank=True, null=True, max_length=255)
    express_no = models.CharField(u'快递号', blank=True, null=True, max_length=255)

    class Meta:
        verbose_name = "购买记录"
        verbose_name_plural = '购买记录'
        ordering = ['-order_no']

    def create_order_no(self):
        self.order_no = str(timezone.now().year) + str(timezone.now().month) + str(timezone.now().day) + str(
            self.customer.id) + str(timezone.now().minute)
