# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('buy_record', '0002_auto_20161028_2220'),
    ]

    operations = [
        migrations.AddField(
            model_name='buy_record',
            name='status',
            field=models.IntegerField(blank=True, null=True, verbose_name='\u8ba2\u5355\u72b6\u6001', choices=[(3, b'\xe7\xad\x89\xe5\xbe\x85\xe7\x94\xa8\xe6\x88\xb7\xe7\xa1\xae\xe8\xae\xa4'), (2, b'\xe7\xad\x89\xe5\xbe\x85\xe6\x94\xaf\xe4\xbb\x98'), (3, b'\xe7\xad\x89\xe5\xbe\x85\xe7\xae\xa1\xe7\x90\x86\xe5\x91\x98\xe7\xa1\xae\xe8\xae\xa4'), (4, b'\xe7\xae\xa1\xe7\x90\x86\xe5\x91\x98\xe5\xb7\xb2\xe7\xa1\xae\xe8\xae\xa4')]),
        ),
    ]
