# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0001_initial'),
        ('addresses', '0003_baseaddress_customer'),
    ]

    operations = [
        migrations.AddField(
            model_name='baseaddress',
            name='order',
            field=models.ForeignKey(related_name='addresses', verbose_name='Order', blank=True, to='order.Order', null=True),
        ),
    ]
