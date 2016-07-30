# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0007_auto_20160727_0357'),
    ]

    operations = [
        migrations.RenameField(
            model_name='baseaddress',
            old_name='ciry_3',
            new_name='city_3',
        ),
        migrations.RenameField(
            model_name='baseaddress',
            old_name='address_detail',
            new_name='detail_address',
        ),
        migrations.RenameField(
            model_name='baseaddress',
            old_name='tel',
            new_name='telephone',
        ),
        migrations.AlterField(
            model_name='address',
            name='phone',
            field=models.CharField(max_length=20, null=True, verbose_name='\u7535\u8bdd\u53f7\u7801', blank=True),
        ),
    ]
