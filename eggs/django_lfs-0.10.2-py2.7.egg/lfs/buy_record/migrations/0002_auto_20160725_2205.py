# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('buy_record', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='buy_record',
            options={'verbose_name': '\u8d2d\u4e70\u8bb0\u5f55', 'verbose_name_plural': '\u8d2d\u4e70\u8bb0\u5f55'},
        ),
        migrations.AlterField(
            model_name='buy_record',
            name='customer',
            field=models.ForeignKey(verbose_name='\u7528\u6237', blank=True, to='customer.Customer', null=True),
        ),
    ]
