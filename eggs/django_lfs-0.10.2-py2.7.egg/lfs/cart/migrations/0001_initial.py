# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('session', models.CharField(max_length=100, verbose_name='Session', blank=True)),
                ('creation_date', models.DateTimeField(auto_now_add=True, verbose_name='Creation date')),
                ('modification_date', models.DateTimeField(auto_now=True, verbose_name='Modification date')),
            ],
        ),
        migrations.CreateModel(
            name='CartItem',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('amount', models.FloatField(null=True, verbose_name='Quantity', blank=True)),
                ('creation_date', models.DateTimeField(auto_now_add=True, verbose_name='Creation date')),
                ('modification_date', models.DateTimeField(auto_now=True, verbose_name='Modification date')),
            ],
            options={
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='CartItemPropertyValue',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('value', models.CharField(max_length=100, verbose_name=b'Value', blank=True)),
                ('cart_item', models.ForeignKey(related_name='properties', verbose_name='Cart item', to='cart.CartItem')),
            ],
        ),
    ]
