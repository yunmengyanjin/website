# coding=utf-8
from __future__ import unicode_literals

from django.db import models


# Create your models here.
class Vip(models.Model):
    level = models.CharField(u'会员等级', blank=True, null=True, max_length=20)
    discount = models.DecimalField(u'折扣', blank=True, null=True, max_digits=3, decimal_places=2)

    class Meta:
        verbose_name = 'Vip'
        verbose_name_plural = 'Vip'
