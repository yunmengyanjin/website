# coding=utf-8
from __future__ import unicode_literals

from django.db import models
from lfs.customer.models import Customer
from .constants import coupon_type as kind


class Coupon(models.Model):
    customer = models.ForeignKey(Customer, verbose_name='用户', blank=True, null=True, on_delete=models.SET_NULL)
    name = models.CharField(u'名称', max_length=100, blank=True, null=True)
    coupon_type = models.CharField(u'类型', max_length=1, choices=kind, blank=True, null=True)
    number = models.DecimalField(u'面额', blank=True, null=True, decimal_places=2, max_digits=5)
    limit = models.IntegerField(u'限制条件', blank=True, null=True)
    expire_at = models.DateField(u'过期日期', blank=True, null=True)
    status = models.IntegerField(u'状态', blank=True, null=True)

    class Meta:
        verbose_name = '优惠券'
        verbose_name_plural = '优惠券'

# Create your models here.
