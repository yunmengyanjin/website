# coding=utf-8
from django.shortcuts import render
from .models import Home


def home(request):
    try:
        pic_1 = Home.objects.all()[0]
        pic_2 = Home.objects.all()[1]
        pic_3 = Home.objects.all()[2]
    except Exception as e:
        pass

    return render(request, 'index.html')

# 返回三个图片路径和指向的地址

# Create your views here.
