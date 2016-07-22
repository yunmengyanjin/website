# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0005_auto_20160721_1101'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='mail',
            field=models.EmailField(max_length=30, verbose_name='\u90ae\u7bb1', blank=True),
        ),
    ]
