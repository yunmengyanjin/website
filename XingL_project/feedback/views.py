import json
from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
try:
    from projects.models import feedbackModel
    from ratelimit.decorators import ratelimit
except Exception:
    sys.stderr.write("You need to install django-ratelimit,such as pip install django-ratelimit")
    sys.exit(1)
paraInfoName = "FBInfo"
paraTypeName = "type"
errResult = "Illegal Action"
JsonKey = "Done"
@login_required
@ratelimit(key='ip', rate='30/h')
def view(request):
    jsonresult = False
    if request.method == "POST":
        try:
            fb = feedbackModel()
            fb.username = request.user.get_username()
            fb.fbInfo = request.POST[paraInfoName]
            fb.infoType = request.POST[paraTypeName]
            fb.save()
            jsonresult = True
        except (KeyError,ValueError,TypeError) as e:
            pass
    return HttpResponse(json.dumps(returnJSON(jsonresult)), content_type='application/json')

def returnJSON(result):
    """It's used to be json map"""
    jsonmap = {}
    jsonmap[JsonKey] = result
    return jsonmap
