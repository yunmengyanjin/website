# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('buy_record', '0004_buy_record_address'),
    ]

    operations = [
        migrations.AddField(
            model_name='buy_record',
            name='express_no',
            field=models.CharField(max_length=255, null=True, verbose_name='\u5feb\u9012\u53f7', blank=True),
        ),
        migrations.AddField(
            model_name='buy_record',
            name='expressage',
            field=models.CharField(max_length=255, null=True, verbose_name='\u5feb\u9012\u5546', blank=True),
        ),
        migrations.AlterField(
            model_name='buy_record',
            name='status',
            field=models.IntegerField(blank=True, null=True, verbose_name='\u8ba2\u5355\u72b6\u6001', choices=[(3, b'\xe7\xad\x89\xe5\xbe\x85\xe7\x94\xa8\xe6\x88\xb7\xe7\xa1\xae\xe8\xae\xa4'), (2, b'\xe7\xad\x89\xe5\xbe\x85\xe6\x94\xaf\xe4\xbb\x98'), (3, b'\xe7\xad\x89\xe5\xbe\x85\xe7\xae\xa1\xe7\x90\x86\xe5\x91\x98\xe7\xa1\xae\xe8\xae\xa4'), (4, b'\xe7\xae\xa1\xe7\x90\x86\xe5\x91\x98\xe5\xb7\xb2\xe7\xa1\xae\xe8\xae\xa4'), (5, b'\xe6\xad\xa3\xe5\x9c\xa8\xe9\x85\x8d\xe9\x80\x81'), (6, b'\xe5\xb7\xb2\xe7\xbb\x8f\xe6\x94\xb6\xe8\xb4\xa7')]),
        ),
    ]
