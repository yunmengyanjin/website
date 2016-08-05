# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0010_remove_customer_point'),
    ]

    operations = [
        migrations.AddField(
            model_name='customer',
            name='expreience',
            field=models.IntegerField(default=0, verbose_name='\u79ef\u5206', blank=True),
        ),
    ]
