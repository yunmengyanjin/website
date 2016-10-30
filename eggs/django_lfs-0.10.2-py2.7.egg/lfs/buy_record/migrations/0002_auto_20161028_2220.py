# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('buy_record', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='buy_record',
            options={'ordering': ['-order_no'], 'verbose_name': '\u8d2d\u4e70\u8bb0\u5f55', 'verbose_name_plural': '\u8d2d\u4e70\u8bb0\u5f55'},
        ),
        migrations.AddField(
            model_name='buy_record',
            name='order_no',
            field=models.CharField(null=True, max_length=255, blank=True, unique=True, verbose_name='\u8ba2\u5355\u53f7', db_index=True),
        ),
    ]
