from lfs.customer.models import Customer


def avatar(request):
    try:
        user = request.user
        customer = request.user.customer_set.all()[0]
        src = Customer.objects.get(user=user).avatar
        src = "/media/%s" % src
        return {"avatar": src,
                "customer": customer
                }
    except Exception as e:
        return {"avatar": None}

