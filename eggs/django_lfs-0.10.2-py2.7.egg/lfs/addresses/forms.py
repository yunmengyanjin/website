# django imports
# coding=utf-8
from __future__ import unicode_literals
from django import forms
import re

# lfs imports
from lfs.addresses.models import Address
from lfs.addresses import settings


class User_Address(forms.Form):
    name = forms.CharField(label=u'收货人姓名', required=True)
    detail_address = forms.CharField(label=u'详细地址', required=True)
    telephone = forms.CharField(label=u'手机号码', required=False, max_length=11, widget=forms.NumberInput)
    mobile_phone = forms.CharField(label=u'电话号码', required=False, widget=forms.NumberInput, max_length=10)
    zip_code = forms.CharField(label=u'邮政编码', required=False, max_length=10)

    def clean_phone(self):
        telephone = self.cleaned_data.get("telephone")
        mobile_phone = self.cleaned_data.get("mobile_phone")
        if telephone == "" and mobile_phone == "":
            raise forms.ValidationError(u'手机号码、电话号码必须填一项')
        if re.compile(r'^1[3578]\d{9}$').match(telephone):
            raise forms.ValidationError(u'手机号码的格式错误,请检查重新输入')
        return telephone




class AddressBaseForm(forms.ModelForm):
    """
    Base class for all address forms.

    **Attributes:**

    fields_before_postal
        List of field names which are supposed to be displayed before the postal
        form fields.

    fields_before_postal
        List of field names which are supposed to be displayed after the postal
        form fields.
    """
    fields_before_postal = None
    fields_after_postal = None

    class Meta:
        exclude = ("customer", "order", "line1", "line2", "zip_code", "city", "state", "country")

    def get_fields_before_postal(self):
        """
        Returns the fields which are supposed to be displayed before the postal
        form fields.
        """
        if self.fields_before_postal is None:
            return []

        fields = []
        for field in self.fields_before_postal:
            try:
                fields.append(self[field])
            except KeyError:
                continue
        return fields

    def get_fields_after_postal(self):
        """
        Returns the fields which are supposed to be displayed before the postal
        form fields.
        """
        fields = []
        for field in (self.fields_after_postal or self.fields):
            try:
                fields.append(self[field])
            except KeyError:
                continue
        return fields


class InvoiceAddressForm(AddressBaseForm):
    """
    Default form for LFS' invoice addresses.
    """
    fields_before_postal = ("firstname", "lastname", "company_name")
    fields_after_postal = ("phone", "email")

    class Meta(AddressBaseForm.Meta):
        model = Address

    def __init__(self, *args, **kwargs):
        super(InvoiceAddressForm, self).__init__(*args, **kwargs)
        self.fields["company_name"].required = settings.INVOICE_COMPANY_NAME_REQUIRED
        self.fields["phone"].required = settings.INVOICE_PHONE_REQUIRED
        self.fields["email"].required = settings.INVOICE_EMAIL_REQUIRED


class ShippingAddressForm(InvoiceAddressForm):
    """
    Default form for LFS' shipping addresses.
    """

    def __init__(self, *args, **kwargs):
        super(ShippingAddressForm, self).__init__(*args, **kwargs)
        self.fields["company_name"].required = settings.SHIPPING_COMPANY_NAME_REQUIRED
        self.fields["phone"].required = settings.SHIPPING_PHONE_REQUIRED
        self.fields["email"].required = settings.SHIPPING_EMAIL_REQUIRED
