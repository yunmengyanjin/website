# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('cart', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='cartitempropertyvalue',
            name='property',
            field=models.ForeignKey(verbose_name='Property', to='catalog.Property'),
        ),
        migrations.AddField(
            model_name='cartitempropertyvalue',
            name='property_group',
            field=models.ForeignKey(verbose_name='Property group', blank=True, to='catalog.PropertyGroup', null=True),
        ),
        migrations.AddField(
            model_name='cartitem',
            name='cart',
            field=models.ForeignKey(verbose_name='Cart', to='cart.Cart'),
        ),
        migrations.AddField(
            model_name='cartitem',
            name='product',
            field=models.ForeignKey(verbose_name='Product', to='catalog.Product'),
        ),
        migrations.AddField(
            model_name='cart',
            name='user',
            field=models.ForeignKey(verbose_name='User', blank=True, to=settings.AUTH_USER_MODEL, null=True),
        ),
    ]
