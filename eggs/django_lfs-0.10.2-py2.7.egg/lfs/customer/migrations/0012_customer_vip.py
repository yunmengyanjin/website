# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('vip', '0003_auto_20160802_0957'),
        ('customer', '0011_customer_expreience'),
    ]

    operations = [
        migrations.AddField(
            model_name='customer',
            name='vip',
            field=models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, blank=True, to='vip.Vip', null=True),
        ),
    ]
