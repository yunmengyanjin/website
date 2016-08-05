# coding=utf-8

from django import forms
from django.contrib.auth.models import User
from lfs.customer.models import Customer
import re


class Login(forms.Form):
    username = forms.CharField(label='用户名', required=True, max_length=16, widget=forms.TextInput({
        'placeholder': '用户名或者手机号码',
        'class': 'user',
    }))
    password = forms.CharField(label='密码', required=True, max_length=16, widget=forms.PasswordInput({
        'placeholder': '密码',
        'class': 'password gap',
    }))


class RegisterForm(forms.Form):
    """Form to register a customer.
    """
    username = forms.CharField(max_length=75, required=True, widget=forms.TextInput({
        'class': 'user',
        'placeholder': '请输入您的用户名'
    }))

    password_1 = forms.CharField(widget=forms.PasswordInput({
        'placeholder': '请输入您的密码',
        'class': 'password gap',
    }), max_length=20)
    password_2 = forms.CharField(widget=forms.PasswordInput({
        'placeholder': '请重复您的密码',
        'class': 'password gap',
    }), max_length=20)

    def clean_password_2(self):
        """Validates that password 1 and password 2 are the same.
        """
        p1 = self.cleaned_data.get('password_1')
        p2 = self.cleaned_data.get('password_2')

        if not (p1 and p2 and p1 == p2):
            raise forms.ValidationError(u'两次输入密码不相符')

        return p2

    def clean_username(self):
        """Validates that the entered e-mail is unique.
        """
        username = self.cleaned_data.get('username')

        if username and User.objects.filter(username=username).exists():
            raise forms.ValidationError(
                u'该用户名已占用')
        if not re.findall(r'[A-Za-z]', username):
            raise forms.ValidationError(
                u'用户名中必须包含一个字母'
            )
        return username

    def clean_tel(self):
        tel = self.cleaned_data.get('tel')
        if tel and Customer.objects.filter(tel=tel).exists():
            raise forms.ValidationError(
                u'该手机号已经注册账号'
            )
        return tel
