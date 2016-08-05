# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Home',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('pic', models.ImageField(upload_to='index', null=True, verbose_name='\u56fe\u7247', blank=True)),
                ('url', models.CharField(max_length=30, null=True, verbose_name='\u5730\u5740', blank=True)),
            ],
            options={
                'verbose_name': '\u4e3b\u9875',
                'verbose_name_plural': '\u4e3b\u9875',
            },
        ),
    ]
