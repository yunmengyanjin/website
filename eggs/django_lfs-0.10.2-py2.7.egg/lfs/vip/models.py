# coding=utf-8
from __future__ import unicode_literals

from django.db import models


class Vip(models.Model):
    name = models.CharField(u'会员等级名称', blank=True, null=True, max_length=20)
    discount = models.DecimalField(u'折扣', blank=True, null=True, max_digits=3, decimal_places=2)
    experience = models.IntegerField(u'积分',blank=True, null=True, default=0)

    class Meta:
        verbose_name = 'Vip'
        verbose_name_plural = 'Vip'

# Create your models here.
