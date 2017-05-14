# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0002_auto_20160803_0739'),
    ]

    operations = [
        migrations.AddField(
            model_name='home',
            name='desc',
            field=models.CharField(max_length=255, null=True, verbose_name='\u63cf\u8ff0', blank=True),
        ),
    ]
