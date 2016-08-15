# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0006_auto_20160814_1626'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productimage',
            name='image',
            field=models.ImageField(upload_to=b'product', null=True, verbose_name='\u5546\u54c1\u56fe\u7247', blank=True),
        ),
    ]
