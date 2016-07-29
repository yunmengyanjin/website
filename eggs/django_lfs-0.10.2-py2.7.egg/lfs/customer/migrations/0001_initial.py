# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('shipping', '0001_initial'),
        ('payment', '0001_initial'),
        ('vip', '0001_initial'),
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='BankAccount',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('account_number', models.CharField(max_length=30, verbose_name='Account number', blank=True)),
                ('bank_identification_code', models.CharField(max_length=30, verbose_name='Bank identification code', blank=True)),
                ('bank_name', models.CharField(max_length=100, verbose_name='Bank name', blank=True)),
                ('depositor', models.CharField(max_length=100, verbose_name='Depositor', blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='CreditCard',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(max_length=30, verbose_name='Type', blank=True)),
                ('owner', models.CharField(max_length=100, verbose_name='Owner', blank=True)),
                ('number', models.CharField(max_length=30, verbose_name='Number', blank=True)),
                ('expiration_date_month', models.IntegerField(null=True, verbose_name='Expiration date month', blank=True)),
                ('expiration_date_year', models.IntegerField(null=True, verbose_name='Expiration date year', blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('session', models.CharField(max_length=100, blank=True)),
                ('tel', models.CharField(max_length=12, verbose_name='\u624b\u673a\u53f7\u7801', blank=True)),
                ('name', models.CharField(max_length=16, verbose_name='\u59d3\u540d', blank=True)),
                ('nickname', models.CharField(max_length=20, verbose_name='\u6635\u79f0', blank=True)),
                ('status', models.BooleanField(default=False, verbose_name='\u6fc0\u6d3b\u72b6\u6001')),
                ('activation_code', models.CharField(max_length=6, verbose_name='\u9a8c\u8bc1\u7801', blank=True)),
                ('expire_at', models.DateTimeField(null=True, verbose_name='\u53d1\u9001\u9a8c\u8bc1\u7801\u7684\u65f6\u95f4', blank=True)),
                ('mail', models.EmailField(max_length=30, verbose_name='\u90ae\u7bb1', blank=True)),
                ('invoice', models.CharField(max_length=100, verbose_name='\u53d1\u7968', blank=True)),
                ('avatar', models.ImageField(upload_to='people', null=True, verbose_name='\u5934\u50cf', blank=True)),
                ('donation', models.IntegerField(default=0, verbose_name='\u6350\u6b3e', blank=True)),
                ('experience', models.IntegerField(default=0, verbose_name='\u79ef\u5206')),
                ('sa_object_id', models.PositiveIntegerField(null=True)),
                ('dsa_object_id', models.PositiveIntegerField(null=True)),
                ('ia_object_id', models.PositiveIntegerField(null=True)),
                ('dia_object_id', models.PositiveIntegerField(null=True)),
                ('ia_content_type', models.ForeignKey(related_name='ia_content_type', to='contenttypes.ContentType', null=True)),
                ('sa_content_type', models.ForeignKey(related_name='sa_content_type', to='contenttypes.ContentType', null=True)),
                ('selected_bank_account', models.ForeignKey(related_name='selected_bank_account', verbose_name='Bank account', blank=True, to='customer.BankAccount', null=True)),
                ('selected_country', models.ForeignKey(verbose_name='Selected country', blank=True, to='core.Country', null=True)),
                ('selected_credit_card', models.ForeignKey(related_name='selected_credit_card', verbose_name='Credit card', blank=True, to='customer.CreditCard', null=True)),
                ('selected_payment_method', models.ForeignKey(related_name='selected_payment_method', verbose_name='Selected payment method', blank=True, to='payment.PaymentMethod', null=True)),
                ('selected_shipping_method', models.ForeignKey(related_name='selected_shipping_method', verbose_name='Selected shipping method', blank=True, to='shipping.ShippingMethod', null=True)),
                ('user', models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('vip', models.ForeignKey(verbose_name='\u4f1a\u5458\u7b49\u7ea7', blank=True, to='vip.Vip', null=True)),
            ],
        ),
        migrations.AddField(
            model_name='creditcard',
            name='customer',
            field=models.ForeignKey(related_name='credit_cards', verbose_name='Customer', blank=True, to='customer.Customer', null=True),
        ),
        migrations.AddField(
            model_name='bankaccount',
            name='customer',
            field=models.ForeignKey(related_name='bank_accounts', verbose_name='Customer', blank=True, to='customer.Customer', null=True),
        ),
    ]
