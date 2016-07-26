# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0008_auto_20160723_1024'),
        ('coupon', '0002_auto_20160725_2036'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='coupon',
            options={'verbose_name': '\u4f18\u60e0\u5238', 'verbose_name_plural': '\u4f18\u60e0\u5238'},
        ),
        migrations.AddField(
            model_name='coupon',
            name='out_date',
            field=models.DateField(null=True, verbose_name='\u8fc7\u671f\u65e5\u671f', blank=True),
        ),
        migrations.AddField(
            model_name='coupon',
            name='status',
            field=models.IntegerField(null=True, verbose_name='\u72b6\u6001', blank=True),
        ),
        migrations.RemoveField(
            model_name='coupon',
            name='customer',
        ),
        migrations.AddField(
            model_name='coupon',
            name='customer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, verbose_name='\u7528\u6237', blank=True, to='customer.Customer', null=True),
        ),
        migrations.AlterField(
            model_name='coupon',
            name='limit',
            field=models.IntegerField(null=True, verbose_name='\u9650\u5236\u6761\u4ef6', blank=True),
        ),
        migrations.AlterField(
            model_name='coupon',
            name='number',
            field=models.IntegerField(null=True, verbose_name='\u9762\u989d', blank=True),
        ),
    ]
