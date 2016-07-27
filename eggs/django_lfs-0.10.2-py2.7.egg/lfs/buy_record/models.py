# coding=utf-8
from __future__ import unicode_literals
from lfs.customer.models import Customer
from lfs.catalog.models import Product
from django.db import models


class Buy_Record(models.Model):
    customer = models.ForeignKey(Customer, verbose_name="用户", blank=True, null=True)
    product = models.ForeignKey(Product, verbose_name="产品", blank=True, null=True)
    number = models.IntegerField(u'数量', blank=True, null=True)

    class Meta:
        verbose_name = "购买记录"
        verbose_name_plural = '购买记录'

