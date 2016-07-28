# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0006_auto_20160721_1913'),
    ]

    operations = [
        migrations.AddField(
            model_name='customer',
            name='discount',
            field=models.DecimalField(default=1, verbose_name='\u6298\u6263', max_digits=3, decimal_places=2),
        ),
    ]
