# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('addresses', '0009_baseaddress_default'),
        ('customer', '0013_auto_20160807_1053'),
        ('buy_record', '0005_auto_20161030_1022'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserOrder',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('order_no', models.CharField(null=True, max_length=255, blank=True, unique=True, verbose_name='\u8ba2\u5355\u53f7', db_index=True)),
                ('status', models.IntegerField(blank=True, null=True, verbose_name='\u8ba2\u5355\u72b6\u6001', choices=[(3, b'\xe7\xad\x89\xe5\xbe\x85\xe7\x94\xa8\xe6\x88\xb7\xe7\xa1\xae\xe8\xae\xa4'), (2, b'\xe7\xad\x89\xe5\xbe\x85\xe6\x94\xaf\xe4\xbb\x98'), (3, b'\xe7\xad\x89\xe5\xbe\x85\xe7\xae\xa1\xe7\x90\x86\xe5\x91\x98\xe7\xa1\xae\xe8\xae\xa4'), (4, b'\xe7\xae\xa1\xe7\x90\x86\xe5\x91\x98\xe5\xb7\xb2\xe7\xa1\xae\xe8\xae\xa4'), (5, b'\xe6\xad\xa3\xe5\x9c\xa8\xe9\x85\x8d\xe9\x80\x81'), (6, b'\xe5\xb7\xb2\xe7\xbb\x8f\xe6\x94\xb6\xe8\xb4\xa7')])),
                ('expressage', models.CharField(max_length=255, null=True, verbose_name='\u5feb\u9012\u5546', blank=True)),
                ('express_no', models.CharField(max_length=255, null=True, verbose_name='\u5feb\u9012\u53f7', blank=True)),
                ('order_time', models.DateTimeField(null=True, verbose_name='\u8ba2\u5355\u65f6\u95f4', blank=True)),
                ('address', models.ForeignKey(verbose_name='u\u5730\u5740', blank=True, to='addresses.BaseAddress', null=True)),
                ('customer', models.ForeignKey(verbose_name='\u7528\u6237', blank=True, to='customer.Customer', null=True)),
            ],
            options={
                'verbose_name': '\u7528\u6237\u8ba2\u5355',
                'verbose_name_plural': '\u7528\u6237\u8ba2\u5355',
            },
        ),
        migrations.AlterModelOptions(
            name='buy_record',
            options={'verbose_name': '\u8d2d\u4e70\u8bb0\u5f55', 'verbose_name_plural': '\u8d2d\u4e70\u8bb0\u5f55'},
        ),
        migrations.RemoveField(
            model_name='buy_record',
            name='address',
        ),
        migrations.RemoveField(
            model_name='buy_record',
            name='express_no',
        ),
        migrations.RemoveField(
            model_name='buy_record',
            name='expressage',
        ),
        migrations.RemoveField(
            model_name='buy_record',
            name='order_no',
        ),
        migrations.RemoveField(
            model_name='buy_record',
            name='status',
        ),
        migrations.AddField(
            model_name='buy_record',
            name='order',
            field=models.ForeignKey(verbose_name='\u8ba2\u5355', blank=True, to='buy_record.UserOrder', null=True),
        ),
    ]
