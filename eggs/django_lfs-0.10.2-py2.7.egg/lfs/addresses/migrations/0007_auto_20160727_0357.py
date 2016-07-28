# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0006_remove_baseaddress_phone_1'),
    ]

    operations = [
        migrations.AlterField(
            model_name='baseaddress',
            name='tel',
            field=models.CharField(max_length=13, null=True, verbose_name='\u624b\u673a\u53f7\u7801', blank=True),
        ),
    ]
