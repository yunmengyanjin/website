# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0008_auto_20160723_1024'),
    ]

    operations = [
        migrations.CreateModel(
            name='Coupon',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u540d\u79f0')),
                ('type', models.CharField(max_length=1, verbose_name='\u7c7b\u578b', choices=[('1', '\u6298\u6263'), ('2', '\u76f4\u51cf')])),
                ('number', models.IntegerField(verbose_name='\u9762\u989d')),
                ('limit', models.IntegerField(verbose_name='\u9650\u5236\u6761\u4ef6')),
                ('customer', models.ManyToManyField(to='customer.Customer', null=True, verbose_name='\u4f18\u60e0\u5238', blank=True)),
            ],
        ),
    ]
