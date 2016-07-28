# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
import lfs.core.fields.thumbs


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0002_set_null_to_address_fields'),
    ]

    operations = [
        migrations.AddField(
            model_name='customer',
            name='activation',
            field=models.BooleanField(default=True, verbose_name='\u6fc0\u6d3b\u72b6\u6001'),
        ),
        migrations.AddField(
            model_name='customer',
            name='code',
            field=models.CharField(max_length=6, blank=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='donation',
            field=models.IntegerField(default=0, verbose_name='\u6350\u6b3e', blank=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='invoice',
            field=models.CharField(max_length=100, blank=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='mail',
            field=models.CharField(max_length=30, blank=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='name',
            field=models.CharField(max_length=16, verbose_name='\u59d3\u540d', blank=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='nickname',
            field=models.CharField(max_length=20, verbose_name='\u6635\u79f0', blank=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='people_image',
            field=lfs.core.fields.thumbs.ImageWithThumbsField(upload_to='images', null=True, verbose_name='\u5934\u50cf', blank=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='point',
            field=models.IntegerField(default=0, verbose_name='\u79ef\u5206'),
        ),
        migrations.AddField(
            model_name='customer',
            name='register_date',
            field=models.DateField(default=datetime.datetime(2016, 7, 21, 7, 45, 58, 138134), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='customer',
            name='tel',
            field=models.CharField(max_length=12, verbose_name='\u624b\u673a\u53f7\u7801', blank=True),
        ),
        migrations.AddField(
            model_name='customer',
            name='vip',
            field=models.CharField(max_length=30, blank=True),
        ),
    ]
