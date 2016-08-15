# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0002_auto_20160814_1502'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProductStandard',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('standard', models.CharField(max_length=30, null=True, verbose_name='\u5546\u54c1\u89c4\u683c', blank=True)),
                ('price', models.DecimalField(null=True, verbose_name='\u4ef7\u683c', max_digits=5, decimal_places=2, blank=True)),
            ],
            options={
                'verbose_name': '\u5546\u54c1\u89c4\u683c',
                'verbose_name_plural': '\u5546\u54c1\u89c4\u683c',
            },
        ),
        migrations.AlterField(
            model_name='product',
            name='base_price_unit',
            field=models.CharField(blank=True, max_length=30, verbose_name='Base price unit', choices=[['m', 'm'], ['qm', 'qm'], ['cm', 'cm'], ['lfm', 'lfm'], ['Package', 'Package'], ['Piece', 'Piece']]),
        ),
        migrations.AlterField(
            model_name='product',
            name='packing_unit_unit',
            field=models.CharField(blank=True, max_length=30, verbose_name='Packing unit', choices=[['m', 'm'], ['qm', 'qm'], ['cm', 'cm'], ['lfm', 'lfm'], ['Package', 'Package'], ['Piece', 'Piece']]),
        ),
        migrations.AlterField(
            model_name='product',
            name='price_unit',
            field=models.CharField(blank=True, max_length=20, verbose_name='\u4ef7\u683c\u5355\u4f4d', choices=[['m', 'm'], ['qm', 'qm'], ['cm', 'cm'], ['lfm', 'lfm'], ['Package', 'Package'], ['Piece', 'Piece']]),
        ),
        migrations.AlterField(
            model_name='product',
            name='unit',
            field=models.CharField(blank=True, max_length=20, verbose_name='Quantity field unit', choices=[['m', 'm'], ['qm', 'qm'], ['cm', 'cm'], ['lfm', 'lfm'], ['Package', 'Package'], ['Piece', 'Piece']]),
        ),
        migrations.AddField(
            model_name='productstandard',
            name='product',
            field=models.ForeignKey(verbose_name='\u4ea7\u54c1', to='catalog.Product'),
        ),
    ]
