# coding=utf-8
from __future__ import unicode_literals

from django.db import models


class Home(models.Model):
    name = models.CharField(u'名称', blank=True, null=True, max_length=20)
    pic = models.ImageField(u'图片', upload_to="index", blank=True, null=True)
    url = models.CharField(u'地址', blank=True, null=True, max_length=30)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u'主页图片'
        verbose_name_plural = u'主页图片'

# Create your models here.
