# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0010_auto_20161118_2240'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='stock_amount',
            field=models.IntegerField(default=0, verbose_name='\u5e93\u5b58'),
        ),
    ]
