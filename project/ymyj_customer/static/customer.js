
function go_url(str) {
	var stateObj = { foo: "bar" };
    history.pushState(stateObj,"title","/my-account/"+str);
    go();
    return false
}
function go(){
	switch(window.location.href.substring(window.location.host.length+8)){
		case "my-account/order":
		    $(".main").html("<p class='title'>我的订单</p>"+
		    	"<table cellspacing='0'>"+
		    	"<tr class='first'>"+
		    	"<th class='cargo'>宝贝</th>"+
		    	"<th>单价(元)</th>"+
		    	"<th>数量</th>"+
		    	"<th class='money'>实付款(元)</th>"+
		    	"<th>交易状态</th>"+
		    	"<th>交易操作</th>"+
		    	"</tr>"+
		    	"<tr class='space'></tr>"+
		    	"<tr class='order'>"+
		    	"<td class='date' colspan='3'>日期:2016.5.14 订单号 12353521321563</td>"+
		    	"<td class='watch' colspan='2'><a href=‘#’>查看详细</a></td>"+
		    	"<td><a href='#'>申请售后</a></td>"+
		    	"</tr>"+
		    	"<tr class='detail'>"+
		    	"<td><img src=''>商品文字介绍</td>"+
		    	"<td>58</td><td>2</td>"+
		    	"<td class='money'>126<br>(含10元运费)</td>"+
		    	"<td>买家已付款</td><td><div class='queren'><a href='#' >确认收货</a></div></td>"+
		    	"</tr></table>");
            break;
        case "my-account/cargo":
            $(".main").html("<p class='title'>我的购物车</p>"+
            	"<div class='jiesuan'><a href='#'>立即结算</a></div>"+
                "<p class='total_price'> 已选商品(不含运费)¥68.00</p>"+
                "<form method='post'>"+
                "<table cellspacing='0'>"+
                "<tr class='first' >"+
                "<th style='padding-left: 20px'>"+
                    "<input type='checkbox' id='0' onclick='return check()'>全选"+
                "</th>"+
                "<th class='cargo'>"+
                    "商品信息"+
                "</th>"+
                "<th>"+
                    "单价(元)"+
                "</th>"+
                "<th>"+
                    "数量"+
                "</th>"+
                "<th>"+
                    "金额(元)"+
                "</th>"+
                "<th style='text-align: center'>"+
                    "操作"+
                "</th>"+
                "</tr>"+
                "<tr class='space'></tr>"+
                "<tr class='detail' id='1'>"+
                "<td style='padding-left: 20px'><input type='checkbox' class='checkbox' id='1'></td>"+
                "<td>"+
                " <img src=''>商品文字介绍"+
                "</td>"+
                "<td>58</td>"+
                "<td>2</td>"+
                "<td>116</td>"+
                "<td style='text-align: center;'><a class='operate' href='#'>移入收藏</a><br>"+
                "<a class='operate' href='#'>移入购物车</a></td>"+
                "</tr>"+
                "</table>"+
                "</form>");
            break;
        case "my-account/collect":
            $(".main").html("<p class='title'>我的收藏</p>"+
                "<div class='collect'>"+
                "<div class='collect_cargo'>"+
                "<img src='none'>"+
                "<div class='pic_1'><a href='#'>加入购物车</a></div>"+
                "<div class='pic_2'><a href='#'>移除收藏</a></div>"+
                "<p>商品的详细信息</p>"+
                "</div>"+
                "</div>");
            break;
        case "my-account/assess":
            $(".main").html("<p class='title'>我的评价</p>"+
            	"<table class='assess' cellspacing='0'>"+
                "<tr>"+
                "<th class='pingjia'><p class='pingjia'>评价</p></th>"+
                "<th class='detail'><p class='detail'>商品详细</p></th>"+
                "<th class='operate'><p class='operate'>操作</p></th>"+
                "</tr>"+
                "<tr class='space'><tr>"+
                "<tr class='my_assess'>"+
                "<td>"+
                "还可以巴拉巴拉巴拉巴拉巴拉吧"+
                "</td>"+
                "<td>"+
                "<img src='none'><p>商品的介绍</p>"+
                "</td>"+
                "<td>"+
                "<div class=''><a href='#'>修改评价</a></div>"+
                "</td>"+
                "</tr>"+
                "</table>");
            break;
        case "my-account/shouhou":
            $(".main").html("<p class='title'>售后服务</p>"+
                "<table class='shouhou' cellspacing='0'>"+
                "<tr class='first'>"+
                "<td colspan='5'>日期:2016.5.14   订单号 1895723432432</td>"+
                "<td>已经退款</td>"+
                "</tr>"+
                "<tr class='second'>"+
                "<td width='400px'>"+
                    "<img src='none'>"+
                    "<p class='introduce'>商品介绍</p>"+
                    "<p class='standard'>商品规格</p>"+
                "</td>"+
                "<td>58</td>"+
                "<td>2</td>"+
                "<td class='price'>126<br>(含10元运费)</td>"+
                "<td>物流信息</td>"+
                "<td width='80px'><div><a href='#'>查看</a></div></td>"+
                "</tr>"+
                "</table>");
            break;
        case "my-account/address":
            $(".main").html('<div class="address"'+
        '<p class="title">收货地址</p>'+
        '<div class="add">'+
            '<p class="title">新增地址</p>'+
            '<form method="post">'+
               '<p><label id="detail_address" for="detail_address">详细地址</label>'+
               '<textarea type="text" name="detai_address" id="detail_address"></textarea></p>'+
               '<p><label for="name">收货人姓名</label>'+
                '<input type="text" name="name" id="name">'+
                '</p>'+
                '<p><label for="tel">联系电话</label>'+
                    '<input type="text" name="tel" id="tel">'+
                '</p>'+
                '<p><label for="zip_code">邮编</label>'+
                    '<input type="text" name="zip_code" id="zip_code">'+
                '</p>'+
                '<p>'+
                    '<input type="checkbox" name="default" id="default"><label id="default" for="default">此为默认地址'+
                '</label></p>'+
                '<button>保存</button>'+
            '</form>'+
        '</div>'+
            '<div class="manage_address">'+
                '<p class="title">管理地址</p>'+
                '<table cellspacing="0">'+
                    '<tr>'+
                        '<th>收货人</th>'+
                        '<th>详细地址</th>'+
                        '<th>邮编</th>'+
                        '<th>手机</th>'+
                        '<th>操作</th>'+
                    '</tr>'+
                    '<tr>'+
                        '<td>谁谁谁</td>'+
                        '<td>上海 上海市 松江区 松江大学城</td>'+
                        '<td>201620</td>'+
                        '<td>123213213213</td>'+
                        '<td><a href="#">修改</a>|<a href="#">删除</a></td>'+
                    '</tr>'+
                '</table>'+
            '</div></div>');
            break;
        case "my-account":
            $(".main").html('<div class="change_password">'+
            '<form method="post">'+
                '<p><label for="original_password">原密码</label>'+
                '<input id="original_password" type="text"></p>'+
                '<p><label for="new_password">请输入新密码</label>'+
                '<input id="new_password" type="text"></p>'+
                '<p><label for="password_2">请再次输入密码确认</label>'+
                '<input id="password_2" type="text"></p>'+
            '</form>'+
            '<button type="button">确认修改</button>'+
        '</div>');
            break;

	}
}
function check(){
	$(".checkbox").prop("checked",$("#0").prop("checked"));}

$("body").on("click",".checkbox",function(){
    if($(this).prop("checked")){
        $("tr#"+$(this).attr("id")).css("background-color","#ff7266")
    }
    else{
        $("tr#"+$(this).attr("id")).css("background-color","#eeeeee")
    }
});
window.onpopstate = function (e) {go();

};

