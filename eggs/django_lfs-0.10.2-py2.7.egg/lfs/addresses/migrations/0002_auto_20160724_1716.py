# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='baseaddress',
            name='address_1',
            field=models.CharField(max_length=256, null=True, verbose_name='\u8be6\u7ec6\u5730\u5740', blank=True),
        ),
        migrations.AddField(
            model_name='baseaddress',
            name='ciry_3',
            field=models.CharField(max_length=10, null=True, verbose_name='\u53bf\u533a', blank=True),
        ),
        migrations.AddField(
            model_name='baseaddress',
            name='name',
            field=models.CharField(max_length=20, null=True, verbose_name='\u59d3\u540d', blank=True),
        ),
        migrations.AddField(
            model_name='baseaddress',
            name='province',
            field=models.CharField(max_length=10, null=True, verbose_name='\u7701\u4efd', blank=True),
        ),
        migrations.AlterField(
            model_name='baseaddress',
            name='city',
            field=models.CharField(max_length=10, null=True, verbose_name='\u57ce\u5e02', blank=True),
        ),
        migrations.AlterField(
            model_name='baseaddress',
            name='zip_code',
            field=models.CharField(default='', max_length=10, verbose_name='\u90ae\u7f16'),
        ),
    ]
