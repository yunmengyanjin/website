# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0001_initial'),
        ('buy_record', '0001_initial'),
        ('customer', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='buy_record',
            name='customer',
            field=models.ForeignKey(verbose_name='\u7528\u6237', blank=True, to='customer.Customer', null=True),
        ),
        migrations.AddField(
            model_name='buy_record',
            name='product',
            field=models.ForeignKey(verbose_name='\u4ea7\u54c1', blank=True, to='catalog.Product', null=True),
        ),
    ]
