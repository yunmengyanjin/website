# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('coupon', '0001_initial'),
        ('customer', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='coupon',
            name='customer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, verbose_name='\u7528\u6237', blank=True, to='customer.Customer', null=True),
        ),
    ]
