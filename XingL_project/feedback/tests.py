#!usr/bin/env python
import json
from django.test import TestCase
from django.test import Client
from projects.models import feedbackModel

userNameSize = 50
fbInfoSize = 300
infoTypeSize = 2
paraInfoName = "FBInfo"
paraTypeName = "type"
JsonKey = "Done"
InfoTypeMap = {"Complaint":"1","Proposal":"2","BUGFeedBack":"3"}
urlpattern = "/feedback/"
infoValue = "This is a test for the normal request."
class FeedBackClientTestCase(TestCase):
    c = Client()
    def testForParameters(self):
        """Test for feedback value of parameter"""
        for key,_ in InfoTypeMap.items():
            typeValue = key
            response = self.c.post(urlpattern,{paraInfoName:infoValue,paraTypeName:typeValue})
            self.assertEqual(response.json()[JsonKey],True)
        testInfoType = "test"
        response = self.c.post(urlpattern,{paraInfoName:infoValue,paraTypeName:testInfoType})
        self.assertEqual(response.json()[JsonKey],False)

    def testForParameterType(self):
        """Test for feedback key of parameter"""
        flag = False
        for key,_ in InfoTypeMap.items():
            typeValue = key
            response = self.c.post(urlpattern,{"test1":infoValue,"test2":typeValue})
            flag = flag or response.json()[JsonKey]
        self.assertEqual(flag,False)

    def testForMissingParameters(self):
        """Test for feedback views when the request missing parameter"""
        response = self.c.post(urlpattern,{paraInfoName:infoValue})
        self.assertEqual(response.json()[JsonKey],False)
        for key,_ in InfoTypeMap.items():
            typeValue = key
            response = self.c.post(urlpattern,{paraTypeName:typeValue})
            self.assertEqual(response.json()[JsonKey],False)

    def testForGetMethod(self):
        """Test for 'get' request to feedback"""
        response = self.c.get(urlpattern)
        self.assertEqual(response.json()[JsonKey],False)
        for key,_ in InfoTypeMap.items():
            typeValue = key
            response = self.c.get(urlpattern,{paraInfoName:infoValue,paraTypeName:typeValue})
            self.assertEqual(response.json()[JsonKey],False)

    def testForNoParameters(self):
        """Test for request with no parameters"""
        response = self.c.post(urlpattern)
        self.assertEqual(response.json()[JsonKey],False)

    def testForLongParameters(self):
        """Test for request with the parameter that longer than we require"""
        flag = True
        info = "x"
        for key,_ in InfoTypeMap.items():
            response = self.c.post(urlpattern,{paraTypeName:key,paraInfoName:info * (fbInfoSize - 1)})
            flag = flag and response.json()[JsonKey]
        self.assertEqual(flag,True)

        for key,_ in InfoTypeMap.items():
            response = self.c.post(urlpattern,{paraTypeName:key,paraInfoName:info * (fbInfoSize + 1)})
            self.assertEqual(response.json()[JsonKey],False)

    def testForEmptyParameters(self):
        """Test for request with correct parameter type and empty parameter value"""
        flag = False
        for key,_ in InfoTypeMap.items():
            response = self.c.post(urlpattern,{paraTypeName:"",paraInfoName:""})
            flag = flag or response.json()[JsonKey]
        self.assertEqual(flag,False)

class FeedbackDatabaseTestCase(TestCase):
    def testForLongParameters(self):
        flag = False
        try:
            fb = feedbackModel()
            fb.username = "longer" * userNameSize
            fb.fbInfo = "longer" * fbInfoSize
            fb.infoType = "BUGFeedBack"
            fb.save()
        except (ValueError,TypeError):
            flag = True
        self.assertEqual(flag,True)

        flag = False
        try:
            fb = feedbackModel()
            fb.fbInfo = "longer" * fbInfoSize
            fb.username = "longer" * userNameSize
            fb.infoType = "BUGFeedBack"
            fb.save()
        except (ValueError,TypeError):
            flag = True
        self.assertEqual(flag,True)

    def testForWrongTypeValue(self):
        flag = False
        try:
            fb = feedbackModel()
            fb.username = ""
            fb.fbInfo = "This is a test message"
            fb.infoType = "BUGFeedBacks"
            fb.save()
        except (ValueError,TypeError):
            flag = True
        self.assertEqual(flag,True)

        flag = False
        try:
            fb = feedbackModel()
            fb.username = "test"
            fb.fbInfo = "This is a test message"
            fb.infoType = "bugfeedback"
            fb.save()
        except (ValueError,TypeError):
            flag = True
        self.assertEqual(flag,True)

    def testForEmptyParameters(self):
        flag = False
        try:
            fb = feedbackModel()
            fb.username = ""
            fb.fbInfo = "This is a test message"
            fb.infoType = "BUGFeedBack"
            fb.save()
        except (ValueError,TypeError):
            flag = True
        self.assertEqual(flag,True)

        flag = False
        try:
            fb1 = feedbackModel()
            fb1.username = "testforname"
            fb1.fbInfo = ""
            fb1.infoType = "BUGFeedBack"
            fb1.save()
        except (ValueError,TypeError):
            flag = True
        self.assertEqual(flag,True)

        flag = False
        try:
            fb2 = feedbackModel()
            fb2.username = "testforname"
            fb2.fbInfo = "This is a test message"
            fb2.infoType = ""
            fb2.save()
        except (ValueError,TypeError):
            flag = True
        self.assertEqual(flag,True)
