# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0005_auto_20160814_1557'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='productimage',
            options={'ordering': ['order'], 'verbose_name': '\u5546\u54c1\u56fe\u7247', 'verbose_name_plural': '\u5546\u54c1\u56fe\u7247'},
        ),
        migrations.AlterField(
            model_name='productimage',
            name='image',
            field=models.ImageField(upload_to=b'product', width_field=400, height_field=400, blank=True, null=True, verbose_name='\u5546\u54c1\u56fe\u7247'),
        ),
    ]
