from django.shortcuts import render
from lfs.catalog.models import Product
from django.shortcuts import get_object_or_404
import simplejson
from decimal import Decimal

def product(request):
    product_id = request.GET['id']
    cargo = get_object_or_404(Product, id=product_id)
    price = []
    for i in Product.objects.get(id=product_id).productstandard_set.all():
        price.append(i.price)
    price.insert(0, min(price))

    return render(request, "cargo.html", {"product": cargo,
                                          "price":simplejson.dumps(price)})
