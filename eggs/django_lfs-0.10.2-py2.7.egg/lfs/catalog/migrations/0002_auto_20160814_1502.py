# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='name',
            field=models.CharField(max_length=80, verbose_name='\u5546\u54c1\u540d\u79f0', blank=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='price',
            field=models.FloatField(default=0.0, verbose_name='\u4ef7\u683c'),
        ),
        migrations.AlterField(
            model_name='product',
            name='price_unit',
            field=models.CharField(blank=True, max_length=20, verbose_name='\u4ef7\u683c\u5355\u4f4d', choices=[['l', 'l'], ['m', 'm'], ['qm', 'qm'], ['cm', 'cm'], ['lfm', 'lfm'], ['Package', 'Package'], ['Piece', 'Piece']]),
        ),
        migrations.AlterField(
            model_name='product',
            name='slug',
            field=models.SlugField(null=True, max_length=120, blank=True, help_text="The unique last part of the Product's URL.", unique=True, verbose_name='Slug'),
        ),
    ]
