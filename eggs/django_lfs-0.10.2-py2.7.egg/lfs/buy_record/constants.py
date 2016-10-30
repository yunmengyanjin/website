# coding=utf-8
class PayStatus(object):
    WAIT_USER_CONFIRM = 1
    WAIT_PAY = 2
    WAIT_CONFIRM = 3
    CONFIRMED = 4
    SENDING = 5
    RECEIPT = 6

PAYSTATUS = ((PayStatus.WAIT_CONFIRM, '等待用户确认'),
             (PayStatus.WAIT_PAY, '等待支付'),
             (PayStatus.WAIT_CONFIRM, '等待管理员确认'),
             (PayStatus.CONFIRMED, '管理员已确认'),
             (PayStatus.SENDING, '正在配送'),
             (PayStatus.RECEIPT, '已经收货'),
             )