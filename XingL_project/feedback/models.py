from __future__ import unicode_literals
from django.db import models
userNameSize = 50
fbInfoSize = 300
infoTypeSize = 2
InfoTypeMap = {"Complaint":"1","Proposal":"2","BUGFeedBack":"3"}
class feedbackModel(models.Model):
    username = models.CharField((u"Name"),max_length = userNameSize)
    fbInfo = models.CharField((u"FBInfo"),max_length = fbInfoSize)
    time = models.DateField((u"Time"),auto_now_add = True)
    infoType = models.CharField((u"infoType"),max_length = infoTypeSize)
    class Meta():
        db_table = "ymyj_feedback"

    def __unicode__(self):
        return "%s | %s : %s || %s" % (self.username,self.fbInfo,self.infoType,self.time)

    @property
    def username(self):
        """Return the username stored in the database"""
        return self.username
    @username.setter
    def username(self,value):
        confirmValueLengthAndContent(value,userNameSize)
        self._username = value

    @property
    def fbInfo(self):
        """Return the feedback information stored in the database"""
        return self.fbInfo
    @fbInfo.setter
    def fbInfo(self,value):
        confirmValueLengthAndContent(value,fbInfoSize)
        self._fbInfo = value

    @property
    def infoType(self):
        """Return the feedback information type stored in the database"""
        for key,value in InfoTypeMap.items():
            if self.infoType == value:
                return key
        raise ValueError("This Error should never happen")
    @infoType.setter
    def infoType(self,value):
        confirmValueType(value)
        if not InfoTypeMap.has_key(value):
            raise ValueError("Illegal Information type")
        self._infoType = InfoTypeMap[value]

    @property
    def time(self):
        """Return the time of model instance"""
        return self.time
def confirmValueType(value):
    if not isinstance(value,unicode) and not isinstance(value,str):
        #You can delete isinstance(value,str) here
        raise TypeError("The value must be unicode or string type")

def confirmValueLengthAndContent(value,length):
    confirmValueType(value)
    if value.isspace() or len(value) > length or len(value) == 0:
        raise ValueError("Illegal value")
