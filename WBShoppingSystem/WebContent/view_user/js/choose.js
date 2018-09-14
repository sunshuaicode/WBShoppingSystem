// 复制连接
(function(){
	scrollLazy('pc_open_share',function(){
	var js = document.createElement("script");
	document.body.insertBefore(js,document.body.firstChild);
});
function scrollLazy($,C){
	var D=false;
	if(typeof document.getElementById($)!="object"||typeof C!="function")
		return;
	if(A().sTop+A().cHeight+200>=_($)){
		C();
		return
	}
	if(window.attachEvent)window.attachEvent("onscroll",B);
	else window.addEventListener("scroll",B,false);
function B(){
	if(A().sTop+A().cHeight+200>=_($)&&!D){C();
	D=true
	}
}
function A(){
	return{
		cHeight:(/CSS1Compat/.test(document.compatMode)?document.documentElement.clientHeight:document.body.clientHeight),
		sTop:(/CSS1Compat/.test(document.compatMode)&&(document.documentElement.scrollTop==0)?document.body.scrollTop:document.documentElement.scrollTop)
		}
	}function _($){
		var A=document.getElementById($),_=0;
		while(A){
			_+=A.offsetTop;A=A.offsetParent
		}
	return _
	}
}
})();
function copyText(text) {
	try {
		window.clipboardData.setData("Text", text);
		alert("页面链接复制成功，你可以粘贴到飞信、QQ或MSN发送给好友");
	} catch(e) {
		alert('您的浏览器不支持剪贴板复制\n请按Ctrl+C复制浏览器地址链接');
	}
}

/** ------------- choose -------------------- **/
$(function(){   
	$(".goods_choose").mouseover(function(){$(this).attr("id","goods_choose_hover")}).mouseout(function(){$(this).attr("id","")});
	$(".q_bg").mouseover(function(){$(this).attr("id","q_bg_hover")}).mouseout(function(){$(this).attr("id","")});
	$(".hot_cate .hot_list").eq(0).jdMarquee({width:(screen.width>=1200)?760:760,height:285,delay:15,auto:true});
	$("#tab").tab({tabId:"#tabtag",tabTag:"li",conId:"#tabcon",conTag:"div.info",auto:false,act:"mouseover"});
});
/* reduce_add */
var setAmount={
	min:1,
	max:999,
	reg:function(x){
		return new RegExp("^[1-9]\\d*$").test(x);
	},
	amount:function(obj,mode){
		var x=$(obj).val();
		if (this.reg(x)){
			if (mode){
				x++;
			}else{
				x--;
			}
		}else{
			alert("请输入正确的数量！");
			$(obj).val(1);
			$(obj).focus();
		}
		return x;						
	},
	reduce:function(obj){
		var x=this.amount(obj,false);
		if (x>=this.min){
			$(obj).val(x);
			recalc();
		}else{
			alert("商品数量最少为"+this.min);
			$(obj).val(1);
			$(obj).focus();
		}
	},
	add:function(obj){
		var x=this.amount(obj,true);
		if (x<=this.max){
			$(obj).val(x);
			recalc();
		}else{
			alert("商品数量最多为"+this.max);
			$(obj).val(999);
			$(obj).focus();
		}
	},
	modify:function(obj){
		var x=$(obj).val();
		if (x<this.min||x>this.max||!this.reg(x)){
			alert("请输入正确的数量！");
			$(obj).val(1);
			$(obj).focus();
		}
	}
}

function BuyUrl(wid)
 {
	var pcounts = $("input[id^=qty_item_]").val();
	var patrn=/^[0-9]{1,4}$/;
	if (!patrn.exec(pcounts))
	{
	  pcounts = 1;
	}
	else
	{ 
		if(pcounts<=0) 
			 pcounts = 1;
		if(pcounts>=1000)
			 pcounts = 999;
	}
 };
 
/** total_item **/
$(document).ready(function (){
	$("input[name^=qty_item_]").bind("keyup", recalc);
	recalc();
});

function recalc(){
	$("input[id^=total_item]").val()

	$("[id^=total_item]").calc(

		"qty * price",

		{
			qty: $("input[name^=qty_item_]"),
			price: $("[id^=price_item_]")
		},

		function (s){

			return "￥" + s.toFixed(2);
		},

		function ($this){
			
			var sum = $this.sum();
			$("[id^=total_item]").text(
				"￥" + sum.toFixed(2)
			);
			$("#total_price").val($("[id^=total_item]").text());
		}
	);
	
};

/** choose_size **/
$(function(){   
	$('.choose_size_m li a').click(function(){
			var thisToggle = $(this).is('.size_radioToggle') ? $(this) : $(this).prev();
			var checkBox = thisToggle.prev();
			checkBox.trigger('click');
			$('.size_radioToggle').removeClass('current');
			thisToggle.addClass('current');
			return false;
	});
});

$(".choose_size_m li a").click(function() {
	var text = $(this).html();
	$(".size_li span").html(text);
	$("#result").html("" + getSelectedValue("sample"));
});
				
function getSelectedValue(id) {
	return $("#" + id).find(".size_li span.value").html();
};