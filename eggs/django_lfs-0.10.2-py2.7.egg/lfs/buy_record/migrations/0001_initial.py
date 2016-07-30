# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0008_auto_20160723_1024'),
        ('catalog', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Buy_Record',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('number', models.IntegerField(null=True, verbose_name='\u6570\u91cf', blank=True)),
                ('buy_time', models.DateTimeField(null=True, verbose_name='\u8d2d\u4e70\u65f6\u95f4', blank=True)),
                ('unit_price', models.DecimalField(null=True, verbose_name='\u5355\u4ef7', max_digits=10, decimal_places=2, blank=True)),
                ('total_price', models.DecimalField(null=True, verbose_name='\u603b\u4ef7', max_digits=10, decimal_places=2, blank=True)),
                ('customer', models.ForeignKey(verbose_name='\u7528\u6237', blank=True, to='customer.Customer', null=True)),
                ('product', models.ForeignKey(verbose_name='\u4ea7\u54c1', blank=True, to='catalog.Product', null=True)),
            ],
            options={
                'verbose_name': '\u8d2d\u4e70\u8bb0\u5f55',
                'verbose_name_plural': '\u8d2d\u4e70\u8bb0\u5f55',
            },
        ),
    ]
