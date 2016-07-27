# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('coupon', '0004_auto_20160726_0908'),
    ]

    operations = [
        migrations.AlterField(
            model_name='coupon',
            name='name',
            field=models.CharField(max_length=100, null=True, verbose_name='\u540d\u79f0', blank=True),
        ),
        migrations.AlterField(
            model_name='coupon',
            name='type',
            field=models.CharField(blank=True, max_length=1, null=True, verbose_name='\u7c7b\u578b', choices=[('1', '\u6298\u6263'), ('2', '\u76f4\u51cf')]),
        ),
    ]
