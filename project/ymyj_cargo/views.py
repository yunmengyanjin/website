from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from lfs.catalog.models import Product
from django.http import HttpResponseRedirect
from django.utils import timezone

from lfs.buy_record.models import Buy_Record
from lfs.buy_record.constants import PayStatus

import simplejson
from decimal import Decimal


def product_detail(request):
    product_id = request.GET['id']
    product = get_object_or_404(Product, id=product_id)
    price = []
    for i in Product.objects.get(id=product_id).productstandard_set.all():
        price.append(i.price)
    price.insert(0, min(price))

    if request.method == 'POST':
        if not request.user.is_authenticated():
            return HttpResponseRedirect('/login')
        number = request.POST.get('number')
        option = request.POST.get('options')
        pay_prince = price[int(option)] * int(number)
        order = Buy_Record.objects.create(
            customer=request.user.customer_set.all()[0],
            product=product,
            number=int(number),
            unit_price=price[int(option)],
            total_price=pay_prince,
            status=PayStatus.WAIT_USER_CONFIRM,
            buy_time=timezone.now()
        )
        order.create_order_no()
        order.save()
        return HttpResponseRedirect('/pay/{0}'.format(order.order_no))

    return render(request, "cargo.html", {"product": product,
                                          "price": simplejson.dumps(price)})


@login_required
def pay(request, order_no):
    order = get_object_or_404(Buy_Record, order_no=order_no)
    customer = request.user.customer_set.all()[0]

    if order.customer != customer:
        return HttpResponseRedirect('/')

    if request.method == 'POST':
        address_index = int(request.POST.get('address'))
        address = customer.addresses.all()[address_index]
        order.address = address
        order.status = PayStatus.WAIT_PAY
        order.save()
        return HttpResponseRedirect('/pay/invoice/{0}'.format(order_no))

    return render(request, "pay.html", locals())


@login_required
def invoice(request, order_no):
    order = get_object_or_404(Buy_Record, order_no=order_no)
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
