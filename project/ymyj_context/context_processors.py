from lfs.customer.models import Customer


def avatar(request):
    print request.user
    try:
        user = request.user
        src = Customer.objects.get(user=user).avatar
        src = "/media/%s" % src
        return {"avatar": src}
    except TypeError:
        return {"avatar": None}
