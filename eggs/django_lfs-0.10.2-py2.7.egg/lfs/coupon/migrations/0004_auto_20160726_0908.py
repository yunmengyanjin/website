# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('coupon', '0003_auto_20160725_2205'),
    ]

    operations = [
        migrations.AlterField(
            model_name='coupon',
            name='number',
            field=models.DecimalField(null=True, verbose_name='\u9762\u989d', max_digits=5, decimal_places=2, blank=True),
        ),
    ]
