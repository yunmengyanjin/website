# coding=utf-8
from django.shortcuts import render
from .models import Home


def home(request):
    try:
        pic = Home.objects.all()
    except Exception as e:
        pass

    return render(request, 'index.html', {"pic": pic})


def party(request):
    return render(request, 'partyBuilding.html', locals())

# 返回三个图片路径和指向的地址

# Create your views here.
