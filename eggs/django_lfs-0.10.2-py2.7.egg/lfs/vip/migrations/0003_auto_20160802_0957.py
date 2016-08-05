# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vip', '0002_vip_customer'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='vip',
            options={'verbose_name': 'Vip', 'verbose_name_plural': 'Vip'},
        ),
        migrations.RemoveField(
            model_name='vip',
            name='customer',
        ),
        migrations.RemoveField(
            model_name='vip',
            name='experience',
        ),
        migrations.RemoveField(
            model_name='vip',
            name='name',
        ),
        migrations.AddField(
            model_name='vip',
            name='level',
            field=models.CharField(max_length=20, null=True, verbose_name='\u4f1a\u5458\u7b49\u7ea7', blank=True),
        ),
    ]
