from django.contrib import admin
from .models import Home


class HomeAdmin(admin.ModelAdmin):
    list_display = ('name', 'url')
admin.site.register(Home, HomeAdmin)


# Register your models here.
