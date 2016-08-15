# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0003_auto_20160814_1524'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProductImage',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('image', models.ImageField(upload_to=b'', null=True, verbose_name='\u5546\u54c1\u56fe\u7247', blank=True)),
                ('order', models.IntegerField(null=True, verbose_name='\u987a\u5e8f', blank=True)),
                ('product', models.ForeignKey(verbose_name='\u4ea7\u54c1', to='catalog.Product')),
            ],
        ),
    ]
