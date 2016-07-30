# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0009_auto_20160730_1039'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customer',
            name='point',
        ),
    ]
