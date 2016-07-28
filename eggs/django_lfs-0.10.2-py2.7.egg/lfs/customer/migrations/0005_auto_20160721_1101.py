# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0004_auto_20160721_0956'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='activation',
            field=models.BooleanField(default=False, verbose_name='\u6fc0\u6d3b\u72b6\u6001'),
        ),
        migrations.AlterField(
            model_name='customer',
            name='code',
            field=models.CharField(max_length=6, verbose_name='\u9a8c\u8bc1\u7801', blank=True),
        ),
        migrations.AlterField(
            model_name='customer',
            name='code_time',
            field=models.DateTimeField(null=True, verbose_name='\u53d1\u9001\u9a8c\u8bc1\u7801\u7684\u65f6\u95f4', blank=True),
        ),
        migrations.AlterField(
            model_name='customer',
            name='invoice',
            field=models.CharField(max_length=100, verbose_name='\u53d1\u7968', blank=True),
        ),
        migrations.AlterField(
            model_name='customer',
            name='mail',
            field=models.CharField(max_length=30, verbose_name='\u90ae\u7bb1', blank=True),
        ),
        migrations.AlterField(
            model_name='customer',
            name='people_image',
            field=models.ImageField(upload_to='images', null=True, verbose_name='\u5934\u50cf', blank=True),
        ),
        migrations.AlterField(
            model_name='customer',
            name='vip',
            field=models.CharField(max_length=1, verbose_name='\u4f1a\u5458\u7b49\u7ea7', choices=[('1', '\u9ec4\u91d1VIP'), ('2', '\u767d\u91d1VIP'), ('3', '\u94bb\u77f3VIP')]),
        ),
    ]
