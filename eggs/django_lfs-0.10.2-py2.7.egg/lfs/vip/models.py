# coding=utf-8
from __future__ import unicode_literals

from django.db import models
from lfs.customer.models import Customer


# Create your models here.
class Vip(models.Model):
    customer = models.ForeignKey(Customer, blank=True, null=True, db_index=True)
    name = models.CharField(u'会员等级名称', blank=True, null=True, max_length=20)
    discount = models.DecimalField(u'折扣', blank=True, null=True, max_digits=3, decimal_places=2)
    experience = models.IntegerField(u'积分', blank=True, null=True, default=0)

    class Meta:
        verbose_name = 'Vip'
