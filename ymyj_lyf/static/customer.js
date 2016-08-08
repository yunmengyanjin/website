
function go_order() {
	var stateObj = { foo: "bar" };
    history.pushState(stateObj,"title","/my-account/order");
    go();
    return false;
}
function go_cargo(){
	var stateObj = { foo: "bar" };
    history.pushState(stateObj,"title","/my-account/cargo");
    go();
    return false;
}
function go_collect(){
	var stateObj = { foo: "bar" };
    history.pushState(stateObj,"title","/my-account/collect");
    go();
    return false;
}
function go_assess(){
	var stateObj = { foo: "bar" };
    history.pushState(stateObj,"title","/my-account/assess");
    go();
    return false;
}
function go_shouhou(){
	var stateObj = { foo: "bar" };
    history.pushState(stateObj,"title","/my-account/shouhou");
    go();
    return false;
}
function go(){
    url = window.location.href.substring(8+window.location.host.length);
	switch(url){
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
		    	"</tr></table>")
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
                "<td style='padding-left: 20px'><input type='checkbox' class='checkbox' id='1' onchange='return change(this)'></td>"+
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
                "</form>")
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
                "</div>")
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
                "</table>")
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
                "</table>")
            break;
	}
}
function check(){
	if($("#0").is(":checked")){
		$(".checkbox").each(function(){
			$(this).attr("checked",true)
		})
	}
	if (!$("#0").is(":checked")){
		$(".checkbox").each(function(){
			$(this).attr("checked",false)
		})
	}

}

