from django.shortcuts import render
from lfs.catalog.models import Product
from django.shortcuts import get_object_or_404


def product(request):
    product_id = request.GET['id']
    cargo = get_object_or_404(Product, id=product_id)
    return render(request, "cargo.html", {"product": cargo})
