# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0003_auto_20160724_1729'),
    ]

    operations = [
        migrations.AddField(
            model_name='baseaddress',
            name='tel',
            field=models.CharField(max_length=11, null=True, verbose_name='\u624b\u673a\u53f7\u7801', blank=True),
        ),
    ]
