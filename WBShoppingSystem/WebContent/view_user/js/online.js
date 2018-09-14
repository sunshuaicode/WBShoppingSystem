//keywords text
$(function(){
	$("a[text='删除']").bind("click",function(){
		var choice = confirm("确定删除您的宝贝吗？");
		var carId = $(this).parent().parent().find("img").attr("title");
    	var trs = $(this).parent().parent();
		if (choice) {
			$(trs).remove();//这里的this是按钮不是tobody
			$.ajax({
				url:"SearchController",
				type: "post",
				data:"method=deleteCarGoods&carId="+carId,
				success:function(data){
					if(data=="success"){
//						window.location.reload();
					}
				},
				error:function(){
					alert("删除发生了错误！")
				}
			});
		}else{
			return;
		}
	});
	
	$("#deleteAll").bind("click",function(){
		var choice = confirm("确定清空您的购物车吗?");
		if(choice){
			alert("删除所有");
			
		}
	});
});
(function(){
	var B=["外套","针织衫","丝袜","帽子"];
	
	var R=[3,3,3,3];
	
	var x=0;
	
	for(var i=0;i<B.length;i++){
		x+=R[i]||1;
	if
		(!R[i])R.push(1)
	};
	var y=Math.ceil(Math.random()*x),z=[],m=[],n;
	
	for (var i=1;i<x+1;i++){
		z.push(i);
	};
	for (var i=0;i<B.length;i++){
		m[i]=z.slice(0,R[i]);
		
		z.splice(0,R[i]);
	};
	for(var i=0;i<m.length;i++){
		for (var j=0;j<m[i].length;j++){
			if (y==m[i][j]){
				n=i;
			}
		}
	};
	
	B=B[n];
	
	$("#birds").val(B).bind("focus",function(){
		if (this.value==B){
			this.value="";this.className="focus_text"
		}
	}).bind("blur",function(){
		if (this.value==""){
			this.value=B;this.className="blur_text"
		}
	});	
	
})();


//qq online
document.write('<div id="online" class="online">');
document.write('<div class="div_tit"></div>');
document.write('<div class="div_meun">');
document.write('<div class="t"></div>');
document.write('<div class="m">');
document.write('<div class="infobox">我们营业的时间<br />8:00-22:00</div>');
document.write('<div class="con">');
document.write('<ul>');
document.write('<li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=541374203&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:541374203:41" alt="541374203点击这里给我发消息" title="541374203点击这里给我发消息"></a></li>');
document.write('<li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=605569615&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:605569615:41" alt="605569615点击这里给我发消息" title="605569615点击这里给我发消息"></a></li>');
document.write('<li><a target="_blank" href="http://amos.im.alisoft.com/msg.aw?v=2&uid=%E6%9C%B1%E5%9B%BD%E5%BC%BA6010&site=cntaobao&s=1&charset=utf-8" ><img border="0" src="http://amos.im.alisoft.com/online.aw?v=2&uid=%E6%9C%B1%E5%9B%BD%E5%BC%BA6010&site=cntaobao&s=1&charset=utf-8" alt="朱国强6010" title="朱国强6010" /></a></li>');
document.write('<li>客服电话：<br />15901826010</li>');
document.write('</ul>');
document.write('</div>');
document.write('</div>');
document.write('<div class="b"></div>');
document.write('</div>');
document.write('</div>');

function isIE6() {
    if (navigator.appName == "Microsoft Internet Explorer") {
        var reg = /msie (\d)/ig;
        var arr = reg.exec(navigator.appVersion);
        if (arr[1] <= 6) return true;
    }
    return false;
};

$(document).ready(function() {
    $("#online").css({
        right: $(window).width() - $("#online").outerWidth(),
        top: 150
    }).hover(function() {
        $(this).removeClass("online").addClass("online_hover").css({
            right: $(window).width() - $("#online").outerWidth()
        });

    }, function() {
        $(this).removeClass("online_hover").addClass("online").css({
            right: $(window).width() - $("#online").outerWidth()
        });
    })
    $(window).bind("resize", dwonline);
    $(window).bind("scroll", dwonline);
});

function dwonline() {
    var div = $("#online");
    if (isIE6()) {
        div.css({
            right: $(window).width() - $("#online").outerWidth(),
            top: $(window).scrollTop() + 150
        })
    } else {
        div.css({
            right: $(window).width() - $("#online").outerWidth(),
            top: 150
        })
    }
};

//加入收藏
function bookmark(){
	var a="http://www.mailuke.com/";
	var b="麦路客商城-购买模型玩具，省钱又放心";
	if(document.all){
		window.external.AddFavorite(a,b)
	}else if(window.sidebar){
		window.sidebar.addPanel(b,a,"")
	}else{
		alert("对不起，您的浏览器不支持此操作!\n请您使用菜单栏或Ctrl+D收藏本站。")
	}
}