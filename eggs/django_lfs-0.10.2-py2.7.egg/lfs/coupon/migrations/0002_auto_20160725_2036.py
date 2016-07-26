# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('coupon', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='coupon',
            name='customer',
            field=models.ManyToManyField(to='customer.Customer', verbose_name='\u4f18\u60e0\u5238', blank=True),
        ),
    ]
