# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0007_customer_discount'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='people_image',
            field=models.ImageField(upload_to='people', null=True, verbose_name='\u5934\u50cf', blank=True),
        ),
    ]
