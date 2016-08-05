# coding=utf-8
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from .forms import Login
from django.contrib import auth
from lfs.customer.models import Customer
from .forms import RegisterForm
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
import re


def user_login(request):
    login_form = Login()
    redirect_to = ''
    if request.method == "POST":
        login_form = Login(data=request.POST)
        redirect_to = request.POST['next']
        if login_form.is_valid():
            username = login_form.cleaned_data['username']
            password = login_form.cleaned_data['password']
            print username
            if not redirect_to or '//' in redirect_to or '' in redirect_to:
                redirect_to = reverse("lfs_shop_view")
            if re.compile(r'[A-Za-z]+').findall(username):
                user = auth.authenticate(username=username, password=password)
                if user is not None and user.is_active:
                    auth.login(request, user)
                    print redirect_to
                    return HttpResponseRedirect(redirect_to)
                else:
                    return HttpResponse('密码错误')
            else:
                if Customer.objects.filter(tel=username).exists():
                    username = Customer.objects.get(tel=username).user.username
                    user = auth.authenticate(username=username, password=password)
                    if user is not None and user.is_active:
                        auth.login(request, user)
                        print redirect_to
                        return HttpResponseRedirect(redirect_to)
                    else:
                        return HttpResponse("用户名不存在或者密码错误")
                else:
                    return HttpResponse("用户名不存在或者密码错误")

    if not redirect_to:
        redirect_to = request.META.get("HTTP_REFERER")
    if not redirect_to:
        redirect_to = reverse("lfs_shop_view")
    return render(request, 'login.htm', {
        'form': login_form,
        'next': redirect_to,
    })


def register(request):
    register_form = RegisterForm()
    redirect_to = ''
    if request.method == "POST":
        register_form = RegisterForm(data=request.POST)
        redirect_to = request.POST['next']
        if register_form.is_valid():
            username = register_form.cleaned_data['username']
            password = register_form.cleaned_data['password_1']
            tel = request.POST['tel']
            user = User.objects.create_user(username=username, password=password)
            Customer.objects.create(user=user,
                                    tel=tel)
            user = auth.authenticate(username=username, password=password)
            auth.login(request, user)
            return HttpResponseRedirect(redirect_to)
    if not redirect_to:
        redirect_to = request.META.get("HTTP_REFERER")
    if not redirect_to:
        redirect_to = reverse("lfs_shop_view")
    return render(request, 'register.html', {
        'form': register_form,
        'next': redirect_to
    })

def customer(request):
    return render(request, 'customer.html')


# Create your views here.
