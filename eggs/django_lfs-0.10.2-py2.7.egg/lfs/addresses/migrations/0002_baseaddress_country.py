# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0001_initial'),
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='baseaddress',
            name='country',
            field=models.ForeignKey(verbose_name='Country', blank=True, to='core.Country', null=True),
        ),
    ]
