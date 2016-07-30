# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0010_remove_customer_point'),
        ('vip', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='vip',
            name='customer',
            field=models.ForeignKey(blank=True, to='customer.Customer', null=True),
        ),
    ]
