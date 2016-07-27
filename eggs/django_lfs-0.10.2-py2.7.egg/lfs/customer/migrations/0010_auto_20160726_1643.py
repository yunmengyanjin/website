# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vip', '0001_initial'),
        ('customer', '0009_auto_20160726_1639'),
    ]

    operations = [
        migrations.RenameField(
            model_name='customer',
            old_name='code',
            new_name='activation_code',
        ),
        migrations.RenameField(
            model_name='customer',
            old_name='people_image',
            new_name='avatar',
        ),
        migrations.RenameField(
            model_name='customer',
            old_name='point',
            new_name='experience',
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
        migrations.AddField(
            model_name='customer',
            name='vip',
            field=models.ForeignKey(verbose_name='\u4f1a\u5458\u7b49\u7ea7', blank=True, to='vip.Vip', null=True),
        ),
    ]
