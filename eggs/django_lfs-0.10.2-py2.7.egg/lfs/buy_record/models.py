# coding=utf-8
from __future__ import unicode_literals
from lfs.customer.models import Customer
from lfs.catalog.models import Product
from django.db import models


class Buy_Record(models.Model):
    customer = models.ForeignKey(Customer, verbose_name="用户", blank=True, null=True)
    product = models.ForeignKey(Product, verbose_name="产品", blank=True, null=True)
    number = models.IntegerField(u'数量', blank=True, null=True)
    buy_time = models.DateTimeField(u'购买时间', blank=True, null=True)
    unit_price = models.DecimalField(u'单价', blank=True, null=True, max_digits=10, decimal_places=2)
    total_price = models.DecimalField(u'总价', blank=True, null=True, max_digits=10, decimal_places=2)
    

    class Meta:
        verbose_name = "购买记录"
        verbose_name_plural = '购买记录'

