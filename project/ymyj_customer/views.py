# coding=utf-8
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import auth
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

from .forms import Login
from lfs.customer.models import Customer
from lfs.addresses.models import BaseAddress
from lfs.buy_record.models import Buy_Record, UserOrder
from lfs.buy_record.constants import PayStatus

from .forms import RegisterForm

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
            if not redirect_to or '//' in redirect_to or '' in redirect_to:
                redirect_to = reverse("lfs_shop_view")
            if re.compile(r'[A-Za-z]+').findall(username):
                user = auth.authenticate(username=username, password=password)
                if user is not None and user.is_active:
                    auth.login(request, user)
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
            return HttpResponseRedirect('/')
    if not redirect_to:
        redirect_to = request.META.get("HTTP_REFERER")
    if not redirect_to:
        redirect_to = reverse("lfs_shop_view")
    return render(request, 'register.html', {
        'form': register_form,
        'next': redirect_to
    })


@login_required
def order(request):
    customer = request.user.customer_set.all()[0]
    orders = UserOrder.objects.filter(customer=customer).exclude(status=PayStatus.WAIT_USER_CONFIRM)
    PAY_STATUS = PayStatus
    return render(request, 'my_order.html', locals())


@login_required
def address(request):
    user = request.user
    customer = request.user.customer_set.all()[0]

    if request.method == 'POST':
        province = request.POST.get('s_province')
        city = request.POST.get('s_city')
        county = request.POST.get('s_county')
        detail_address = request.POST.get('address_detail')
        name = request.POST.get('name')
        tel = request.POST.get('tel')
        zip_code = request.POST.get('zip_code')
        default = request.POST.get('default')

        if default == 'on':
            BaseAddress.objects.filter(customer=customer, default=True).update(default=False)

        BaseAddress.objects.create(
            customer=customer,
            province=province,
            city=city,
            city_3=county,
            detail_address=detail_address,
            name=name,
            telephone=tel,
            zip_code=zip_code,
            default=(default == u'on')
        )
        return HttpResponseRedirect('/my-account/address/')

    return render(request, 'address.html', locals())

# Create your views here.
