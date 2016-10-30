# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0009_baseaddress_default'),
        ('buy_record', '0003_buy_record_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='buy_record',
            name='address',
            field=models.ForeignKey(verbose_name='u\u5730\u5740', blank=True, to='addresses.BaseAddress', null=True),
        ),
    ]
