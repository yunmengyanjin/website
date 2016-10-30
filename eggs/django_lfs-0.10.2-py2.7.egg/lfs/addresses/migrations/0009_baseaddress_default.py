# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0008_auto_20160730_1032'),
    ]

    operations = [
        migrations.AddField(
            model_name='baseaddress',
            name='default',
            field=models.BooleanField(default=False, verbose_name='\u9ed8\u8ba4\u5730\u5740'),
        ),
    ]
