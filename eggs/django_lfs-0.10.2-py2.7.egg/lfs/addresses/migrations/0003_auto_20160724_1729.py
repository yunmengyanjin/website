# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0002_auto_20160724_1716'),
    ]

    operations = [
        migrations.RenameField(
            model_name='baseaddress',
            old_name='address_1',
            new_name='address_detail',
        ),
    ]
