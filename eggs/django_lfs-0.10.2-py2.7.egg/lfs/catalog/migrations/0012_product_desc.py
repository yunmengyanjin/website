# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0011_auto_20161118_2243'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='desc',
            field=models.CharField(max_length=255, null=True, verbose_name='\u5546\u54c1\u4ecb\u7ecd', blank=True),
        ),
    ]
