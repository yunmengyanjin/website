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
                ('customer', models.ForeignKey(verbose_name='\u8d2d\u4e70\u8bb0\u5f55', blank=True, to='customer.Customer', null=True)),
                ('product', models.ForeignKey(verbose_name='\u4ea7\u54c1', blank=True, to='catalog.Product', null=True)),
            ],
        ),
    ]
