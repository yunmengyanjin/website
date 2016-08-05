# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='home',
            options={'verbose_name': '\u4e3b\u9875\u56fe\u7247', 'verbose_name_plural': '\u4e3b\u9875\u56fe\u7247'},
        ),
        migrations.AddField(
            model_name='home',
            name='name',
            field=models.CharField(max_length=20, null=True, verbose_name='\u540d\u79f0', blank=True),
        ),
    ]
