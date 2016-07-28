# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BaseAddress',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('firstname', models.CharField(max_length=50, verbose_name='Firstname')),
                ('lastname', models.CharField(max_length=50, verbose_name='Lastname')),
                ('name', models.CharField(max_length=20, null=True, verbose_name='\u59d3\u540d', blank=True)),
                ('province', models.CharField(max_length=10, null=True, verbose_name='\u7701\u4efd', blank=True)),
                ('city', models.CharField(max_length=10, null=True, verbose_name='\u57ce\u5e02', blank=True)),
                ('city_3', models.CharField(max_length=10, null=True, verbose_name='\u53bf\u533a', blank=True)),
                ('telephone', models.CharField(max_length=13, null=True, verbose_name='\u624b\u673a\u53f7\u7801', blank=True)),
                ('detail_address', models.CharField(max_length=256, null=True, verbose_name='\u8be6\u7ec6\u5730\u5740', blank=True)),
                ('zip_code', models.CharField(default='', max_length=10, verbose_name='\u90ae\u7f16')),
                ('line1', models.CharField(max_length=100, null=True, verbose_name='Line 1', blank=True)),
                ('line2', models.CharField(max_length=100, null=True, verbose_name='Line 2', blank=True)),
                ('state', models.CharField(max_length=50, null=True, verbose_name='State', blank=True)),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Created')),
                ('modified', models.DateTimeField(auto_now=True, verbose_name='Modified')),
            ],
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('baseaddress_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='addresses.BaseAddress')),
                ('company_name', models.CharField(max_length=50, null=True, verbose_name='Company name', blank=True)),
                ('phone', models.CharField(max_length=20, null=True, verbose_name='\u7535\u8bdd\u53f7\u7801', blank=True)),
                ('email', models.EmailField(max_length=254, null=True, verbose_name='E-Mail', blank=True)),
            ],
            bases=('addresses.baseaddress',),
        ),
    ]
