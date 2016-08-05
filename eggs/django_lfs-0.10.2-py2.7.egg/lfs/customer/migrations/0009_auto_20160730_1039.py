# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0008_auto_20160723_1024'),
    ]

    operations = [
        migrations.RenameField(
            model_name='customer',
            old_name='people_image',
            new_name='avatar',
        ),
        migrations.RenameField(
            model_name='customer',
            old_name='code_time',
            new_name='expire_at',
        ),
        migrations.RenameField(
            model_name='customer',
            old_name='activation',
            new_name='status',
        ),
        migrations.RemoveField(
            model_name='customer',
            name='discount',
        ),
        migrations.RemoveField(
            model_name='customer',
            name='vip',
        ),
    ]
