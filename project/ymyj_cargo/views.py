from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from lfs.catalog.models import Product
from django.http import HttpResponseRedirect
from django.utils import timezone

from lfs.buy_record.models import Buy_Record, UserOrder
from lfs.buy_record.constants import PayStatus

import simplejson
from decimal import Decimal
from home.models import Home


def product_detail(request):
    product_id = request.GET.get('id', '')

    if not product_id:
        try:
            pic = Home.objects.all()
        except Exception as e:
            pass
        products = Product.objects.all()
        return render(request, 'allitems.html', locals())

    product = get_object_or_404(Product, id=product_id)
    price = []
    for i in Product.objects.get(id=product_id).productstandard_set.all():
        price.append(i.price)
    price.insert(0, min(price))

    if request.method == 'POST':
        if not request.user.is_authenticated():
            return HttpResponseRedirect('/login')
        customer = request.user.customer_set.all()[0]
        number = request.POST.get('number')
        option = request.POST.get('options')
        if not option:
            no_option = True
            return render(request, 'cargo.html', locals())
        if int(number) <=0 or not number:
            number_error = True
            return render(request, "cargo.html", locals())
        if int(number) > product.stock_amount or product.stock_amount == 0:
            no_stock = True
            return render(request, "cargo.html", locals())
        pay_price = price[int(option)] * int(number)
        order = UserOrder(customer=customer, status=PayStatus.WAIT_USER_CONFIRM, order_time=timezone.now())
        order.create_order_no()
        order.save()
        buy_record = Buy_Record.objects.create(
            customer=request.user.customer_set.all()[0],
            order=order,
            product=product,
            number=int(number),
            unit_price=price[int(option)],
            total_price=pay_price,
            buy_time=timezone.now()
        )
        return HttpResponseRedirect('/pay/{0}'.format(order.order_no))

    return render(request, "cargo.html", {"product": product,
                                          "price": simplejson.dumps(price)})


@login_required
def pay(request, order_no):
    order = get_object_or_404(UserOrder, order_no=order_no)
    customer = request.user.customer_set.all()[0]

    if order.customer != customer:
        return HttpResponseRedirect('/')

    if request.method == 'POST':
        address_index = request.POST.get('address')
        if not address_index:
            no_address = True
            return render(request, 'pay.html', locals())
        address_index = int(address_index)
        address = customer.addresses.all()[address_index]
        order.address = address
        order.status = PayStatus.WAIT_PAY
        order.save()
        for buy_record in order.buy_record_set.all():
            buy_record.product.stock_amount -= buy_record.number
            buy_record.product.save()
        return HttpResponseRedirect('/pay/invoice/{0}'.format(order_no))

    return render(request, "pay.html", locals())


@login_required
def invoice(request, order_no):
    order = get_object_or_404(UserOrder, order_no=order_no)
    customer = request.user.customer_set.all()[0]

    if order.customer != customer:
        return HttpResponseRedirect('/')

    if request.method == 'POST':

        if not request.POST.get('action') == 'payed':
            return HttpResponseRedirect('/pay/invoice/{0}'.format(order_no))

        order.status = PayStatus.WAIT_CONFIRM
        order.save()
        return HttpResponseRedirect('/my-account/order/')
    return render(request, 'invoice.html', locals())
