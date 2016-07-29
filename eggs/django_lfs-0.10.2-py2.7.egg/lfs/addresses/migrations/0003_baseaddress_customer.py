# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0002_baseaddress_country'),
        ('customer', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='baseaddress',
            name='customer',
            field=models.ForeignKey(related_name='addresses', on_delete=django.db.models.deletion.SET_NULL, verbose_name='Customer', blank=True, to='customer.Customer', null=True),
        ),
    ]
