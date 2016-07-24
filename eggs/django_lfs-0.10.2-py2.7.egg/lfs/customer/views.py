# python imports
# coding=utf-8
from __future__ import unicode_literals
import datetime

from urlparse import urlparse
from PIL import Image
import os

# django imports
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.shortcuts import get_object_or_404
from django.shortcuts import render_to_response, render
from django.template import RequestContext
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse, HttpResponseRedirect
from django.utils.translation import ugettext_lazy as _


# lfs imports
import lfs
from lfs.addresses.utils import AddressManagement
import utils as customer_utils
from .models import Customer
from lfs.customer.forms import EmailForm, CustomerAuthenticationForm
from .forms import User_image
from lfs.customer.forms import RegisterForm
from lfs.customer.utils import create_unique_username
from lfs.order.models import Order
from lfs.addresses.forms import User_Address
from lfs.addresses.models import Address
from lfs_project.settings import MEDIA_ROOT


def login(request, template_name="lfs/customer/login.html"):
    """Custom view to login or register/login a user.

    The reason to use a custom login method are:

      * validate checkout type
      * integration of register and login form

    It uses Django's standard AuthenticationForm, though.
    """
    # shop = lfs.core.utils.get_default_shop(request)

    # If only anonymous checkout is allowed this view doesn't exists :)
    # if shop.checkout_type == CHECKOUT_TYPE_ANON:
    #     raise Http404()

    login_form = CustomerAuthenticationForm()
    login_form.fields["username"].label = u'用户名'
    register_form = RegisterForm()

    if request.POST.get("action") == "login":
        login_form = CustomerAuthenticationForm(data=request.POST)
        login_form.fields["username"].label = _(u"E-Mail")

        if login_form.is_valid():
            redirect_to = request.POST.get("next")
            # Light security check -- make sure redirect_to isn't garbage.
            if not redirect_to or '//' in redirect_to or ' ' in redirect_to:
                redirect_to = reverse("lfs_shop_view")

            from django.contrib.auth import login
            login(request, login_form.get_user())

            return lfs.core.utils.set_message_cookie(
                redirect_to, msg=_(u"You have been logged in."))
    if request.POST.get("action") == "register":
        register_form = RegisterForm(data=request.POST)
        if register_form.is_valid():
            username = register_form.data.get("username")
            tel = register_form.data.get("tel")
            password = register_form.data.get("password_1")
            # Create user
            user = User.objects.create_user(
                username=create_unique_username(username), password=password)

            # Create customer
            customer = customer_utils.get_or_create_customer(request)
            customer.user = user
            Customer.objects.filter()

            # Notify
            # 在此处增加邮箱验证 或者手机验证

            # Log in user
            from django.contrib.auth import authenticate
            user = authenticate(username=username, password=password)

            from django.contrib.auth import login
            login(request, user)

            redirect_to = request.POST.get("next")
            Customer.objects.filter(user=user).update(tel=tel, nickname=username)
            if not redirect_to or '//' in redirect_to or ' ' in redirect_to:
                redirect_to = reverse("lfs_shop_view")

            return lfs.core.utils.set_message_cookie(
                redirect_to, msg=_(u"You have been registered and logged in."))

    # Get next_url
    next_url = request.REQUEST.get("next")
    if next_url is None:
        next_url = request.META.get("HTTP_REFERER")
    if next_url is None:
        next_url = reverse("lfs_shop_view")

    # Get just the path of the url. See django.contrib.auth.views.login for more
    next_url = urlparse(next_url)
    next_url = next_url[2]

    try:
        login_form_errors = login_form.errors["__all__"]
    except KeyError:
        login_form_errors = None

    return render_to_response(template_name, RequestContext(request, {
        "login_form": login_form,
        "login_form_errors": login_form_errors,
        "register_form": register_form,
        "next_url": next_url,
    }))


def register(request):
    register_form = RegisterForm()
    if request.POST.get('action') == "register":
        register_form = RegisterForm(data=request.POST)
        if register_form.is_valid():
            username = register_form.data.get("username")
            tel = register_form.data.get("tel")
            password = register_form.data.get("password_1")
            # Create user
            user = User.objects.create_user(
                username=create_unique_username(username), password=password)
            # Create customer
            customer = customer_utils.get_or_create_customer(request)
            customer.user = user
            Customer.objects.filter()
            # Notify
            # 在此处增加邮箱验证 或者手机验证
            # Log in user
            from django.contrib.auth import authenticate
            user = authenticate(username=username, password=password)
            from django.contrib.auth import login
            login(request, user)
            redirect_to = request.POST.get("next")
            Customer.objects.filter(user=user).update(tel=tel, nickname=username)
            if not redirect_to or '//' in redirect_to or ' ' in redirect_to:
                redirect_to = reverse("lfs_shop_view")
            return lfs.core.utils.set_message_cookie(
                redirect_to, msg=_(u"You have been registered and logged in."))
    next_url = request.REQUEST.get("next")
    if next_url is None:
        next_url = request.META.get("HTTP_REFERER")
    if next_url is None:
        next_url = reverse("lfs_shop_view")

    # Get just the path of the url. See django.contrib.auth.views.login for more
    next_url = urlparse(next_url)
    next_url = next_url[2]

    return render_to_response('ymyj/register.html', RequestContext(request, {
        'form': register_form,
        "next_url": next_url,
    }))


def logout(request):
    """Custom method to logout a user.

    The reason to use a custom logout method is just to provide a login and a
    logoutmethod on one place.
    """
    from django.contrib.auth import logout
    logout(request)

    return lfs.core.utils.set_message_cookie(reverse("lfs_shop_view"),
                                             msg=_(u"You have been logged out."))


@login_required
def orders(request, template_name="lfs/customer/orders.html"):
    """Displays the orders of the current user
    """
    orders = Order.objects.filter(user=request.user)

    if request.method == "GET":
        date_filter = request.session.get("my-orders-date-filter")
    else:
        date_filter = request.POST.get("date-filter")
        if date_filter:
            request.session["my-orders-date-filter"] = date_filter
        else:
            try:
                del request.session["my-orders-date-filter"]
            except KeyError:
                pass
    try:
        date_filter = int(date_filter)
    except (ValueError, TypeError):
        date_filter = None
    else:
        now = datetime.datetime.now()
        start = now - datetime.timedelta(days=date_filter * 30)
        orders = orders.filter(created__gte=start)

    options = []
    for value in [1, 3, 6, 12]:
        selected = True if value == date_filter else False
        options.append({
            "value": value,
            "selected": selected,
        })

    return render_to_response(template_name, RequestContext(request, {
        "orders": orders,
        "options": options,
        "date_filter": date_filter,
        "current": "orders"
    }))


@login_required
def order(request, id, template_name="lfs/customer/order.html"):
    """
    """
    orders = Order.objects.filter(user=request.user)
    order = get_object_or_404(Order, pk=id, user=request.user)

    return render_to_response(template_name, RequestContext(request, {
        "current_order": order,
        "orders": orders,
        "current": "orders"
    }))


@login_required
def account(request, template_name="lfs/customer/account.html"):
    """Displays the main screen of the current user's account.
    """
    user = request.user
    user_photo = Customer.objects.get(user=user).people_image
    user_photo = "/media/%s" % user_photo

    if request.method == 'POST':
        if 'image' in request.FILES:
            image = request.FILES['image']
            people_image = Customer.objects.get(user=user)
            people_image.people_image = image
            people_image.save()
            return HttpResponse("修改头像成功")
        else:
            return HttpResponse("请提交头像")

    else:
        return render_to_response(template_name, RequestContext(request, {
            "user": user,
            "current": "welcome",
            "user_photo": user_photo,
            "form": User_image,
        }))


@login_required
def addresses(request, template_name="lfs/customer/addresses.html"):
    """
    Provides a form to edit addresses in my account.
    """
    address_form = User_Address()
    user = request.user
    if not user:
        return HttpResponseRedirect(reverse("lfs_login"))

    customer = Customer.objects.get(user=user)
    if request.method == 'POST':
        address_form = User_Address(data=request.POST)
        if address_form.is_valid():
            name = address_form.cleaned_data['name']
            address_detail = address_form.cleaned_data['address_detail']
            tel = address_form.cleaned_data['tel']
            phone = address_form.cleaned_data['phone']
            zip_code = address_form.cleaned_data['zip_code']
            Address.objects.create(
                customer=customer,
                name=name,
                address_detail=address_detail,
                tel=tel,
                phone=phone,
                zip_code=zip_code
            )
            return HttpResponse('添加地址成功')
    return render(request,template_name,{
        'form':address_form
    })



@login_required
def email(request, template_name="lfs/customer/email.html"):
    """Saves the email address from the data form.
    """
    if request.method == "POST":
        email_form = EmailForm(initial={"email": request.user.email}, data=request.POST)
        if email_form.is_valid():
            request.user.username = email_form.cleaned_data.get("email")[:30]
            request.user.email = email_form.cleaned_data.get("email")
            request.user.save()
            return lfs.core.utils.set_message_cookie(reverse("lfs_my_email"),
                                                     msg=_(u"Your e-mail has been changed."))
    else:
        email_form = EmailForm(initial={"email": request.user.email})

    return render_to_response(template_name, RequestContext(request, {
        "email_form": email_form,
        "current": "email"
    }))


@login_required
def password(request, template_name="lfs/customer/password.html"):
    """Changes the password of current user.
    """
    if request.method == "POST":
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            form.save()
            return lfs.core.utils.set_message_cookie(reverse("lfs_my_password"),
                                                     msg=_(u"Your password has been changed."))
    else:
        form = PasswordChangeForm(request.user)

    return render_to_response(template_name, RequestContext(request, {
        "form": form,
        "current": "password"
    }))


def pic(request):
    if request.method == 'GET':
        return HttpResponseForbidden()
    else:
        if request.POST['action'] == "first":
            image = request.FILES['image']
            user = request.user
            path = MEDIA_ROOT+"/people/"+user.username
            if image.size > 4096000:
                return JsonResponse("1")
            else:
                if not os.path.exists(path):
                    os.mkdir(path)
                with open(path + "/pic_old.jpg", 'wb+') as destination:
                    for chunk in image.chunks():
                        destination.write(chunk)
                src = "/media/people/" + user.username + "/pic_old.jpg"
                return JsonResponse(src, safe=False)

        if request.POST['action'] == "second":
            x1 = float(request.POST['x1'])
            x2 = float(request.POST['x2'])
            y1 = float(request.POST['y1'])
            y2 = float(request.POST['y2'])
            radio = float(request.POST['radio'])
            user = request.user
            img = Image.open(MEDIA_ROOT+"/people/"+user.username+"/pic_old.jpg")
            region = (x1*radio, y1*radio, x2*radio, y2*radio)
            crop_img = img.crop(region)
            crop_img.save(MEDIA_ROOT+"/people/"+user.username+"/pic.jpg")

            Customer.objects.filter(user=user).update(people_image="/people/"+user.username+"/pic.jpg")

            src = "/media/people/"+user.username+"/pic.jpg"
            os.remove(MEDIA_ROOT+"/people/"+user.username+"/pic_old.jpg")

            return JsonResponse(src, safe=False)


