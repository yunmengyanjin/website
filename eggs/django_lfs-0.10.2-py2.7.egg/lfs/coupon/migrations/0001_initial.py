# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0008_auto_20160723_1024'),
    ]

    operations = [
        migrations.CreateModel(
            name='Coupon',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, null=True, verbose_name='\u540d\u79f0', blank=True)),
                ('coupon_type', models.CharField(blank=True, max_length=1, null=True, verbose_name='\u7c7b\u578b', choices=[(b'1', b'\xe6\x8a\x98\xe6\x89\xa3'), (b'2', b'\xe7\x9b\xb4\xe5\x87\x8f')])),
                ('number', models.DecimalField(null=True, verbose_name='\u9762\u989d', max_digits=5, decimal_places=2, blank=True)),
                ('limit', models.IntegerField(null=True, verbose_name='\u9650\u5236\u6761\u4ef6', blank=True)),
                ('expire_at', models.DateField(null=True, verbose_name='\u8fc7\u671f\u65e5\u671f', blank=True)),
                ('status', models.IntegerField(null=True, verbose_name='\u72b6\u6001', blank=True)),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, verbose_name='\u7528\u6237', blank=True, to='customer.Customer', null=True)),
            ],
            options={
                'verbose_name': '\u4f18\u60e0\u5238',
                'verbose_name_plural': '\u4f18\u60e0\u5238',
            },
        ),
    ]
