# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Vip',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=20, null=True, verbose_name='\u4f1a\u5458\u7b49\u7ea7\u540d\u79f0', blank=True)),
                ('discount', models.DecimalField(null=True, verbose_name='\u6298\u6263', max_digits=3, decimal_places=2, blank=True)),
                ('experience', models.IntegerField(default=0, null=True, verbose_name='\u79ef\u5206', blank=True)),
            ],
            options={
                'verbose_name': 'Vip',
            },
        ),
    ]
