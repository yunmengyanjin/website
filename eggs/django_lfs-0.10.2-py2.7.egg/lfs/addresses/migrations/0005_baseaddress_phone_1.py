# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0004_baseaddress_tel'),
    ]

    operations = [
        migrations.AddField(
            model_name='baseaddress',
            name='phone_1',
            field=models.CharField(max_length=10, null=True, verbose_name='\u7535\u8bdd\u53f7\u7801', blank=True),
        ),
    ]
