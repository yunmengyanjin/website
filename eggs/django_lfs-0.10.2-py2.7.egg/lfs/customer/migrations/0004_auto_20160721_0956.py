# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0003_auto_20160721_0745'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customer',
            name='register_date',
        ),
        migrations.AddField(
            model_name='customer',
            name='code_time',
            field=models.DateTimeField(null=True, blank=True),
        ),
    ]
