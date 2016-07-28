# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0001_initial'),
        ('order', '0001_initial'),
        ('marketing', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderratingmail',
            name='order',
            field=models.ForeignKey(verbose_name='Order', to='order.Order'),
        ),
        migrations.AddField(
            model_name='featuredproduct',
            name='product',
            field=models.ForeignKey(verbose_name='Product', to='catalog.Product'),
        ),
    ]
