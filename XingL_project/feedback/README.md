feedback
=============
- [Model](#Model)
- [View](#View)
- [Test](#Test)

#### Model
```
    username = models.CharField((u"Name"),max_length = userNameSize)
    fbInfo = models.CharField((u"FBInfo"),max_length = fbInfoSize)
    time = models.DateField((u"Time"),auto_now_add = True)
    infoType = models.CharField((u"infoType"),max_length = infoTypeSize)
```
    - username存储用户名,用来标识反馈信息的用户
    - fbInfo存储反馈信息的具体内容
    - time为存储信息时间
    - infoType存储反馈类型,分为三类:投诉,建议,BUG反馈.  
      InfoTypeMap = {"Complaint":"1","Proposal":"2","BUGFeedBack":"3"}
      通过map来做映射,每次实际存入数据库的是value,通过model读取的时候会返回key

#### View
    - 通过对Model实例化来判断输入数据是否符合规则.  
    - 限制数据类型为unicode or str.
    - 限制username长度为50,为空或者isspace()则失败.  
    - 限制fbInfo长度为300,为空或者isspace()则失败.  
    - 限制Form Action为post  
    - 缺少参数则失败

    - 返回JSON["Done":True] or ["Done":False],值为bool类型

#### Test
    - Client Test
        - 测试不正确的参数
        - 测试不正确的参数名称
        - 测试缺少参数
        - 测试get方法
        - 测试参数超长
        - 测试空参数
   - Model Test
        - 属性超长
        - 属性值错误
        - 属性值为空
