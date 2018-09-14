/* carousel */
(function($){
	$.fn.carousel=function(option,callback)
	{if(typeof option=="function")
	 {callback=option;option={}};
	  var s=$.extend({
		  deriction:"up",
		  speed:10,
		  auto:false,
		  width:null,
		  height:null,
		  step:1,
		  control:false,
		  _front:null,_back:null,_stop:null,_continue:null,
		  wrapstyle:"",
		  stay:5000,
		  delay:20,
		  dom:"div>ul>li".split(">"),
		  mainTimer:null,subTimer:null,
		  tag:false,convert:false,
		  btn:null,disabled:"disabled",
		  pos:{ojbect:null,clone:null}},
		  option||{});
	  var object=this.find(s.dom[1]);
	  var subObject=this.find(s.dom[2]);
	  var clone;if(s.deriction=="up"||s.deriction=="down"){
		  var height=object.eq(0).outerHeight();
		  var step=s.step*subObject.eq(0).outerHeight();
		  object.css({width:s.width+"px",overflow:"hidden"}
		  )};
		  if(s.deriction=="left"||s.deriction=="right"){
			  var width=subObject.length*subObject.eq(0).outerWidth();
			  object.css({width:width+"px",overflow:"hidden"});
			  var step=s.step*subObject.eq(0).outerWidth()};
			  var init=function(){
				  var wrap="<div style='position:relative;overflow:hidden;z-index:1;width:"+s.width+"px;height:"+s.height+"px;"+s.wrapstyle+"'></div>";
				  object.css({position:"absolute",left:0,top:0}).wrap(wrap);
				  s.pos.object=0;clone=object.clone();object.after(clone);
				  switch(s.deriction){
				  default:
					  case"up":object.css({marginLeft:0,marginTop:0});
				        clone.css({marginLeft:0,marginTop:height+"px"});
				        s.pos.clone=height;
				        break;
				  case"down":
					    object.css({marginLeft:0,marginTop:0});
					    clone.css({marginLeft:0,marginTop:-height+"px"});
					    s.pos.clone=-height;break;
				  case"left":
					    object.css({marginTop:0,marginLeft:0});
					    clone.css({marginTop:0,marginLeft:width+"px"});
					    s.pos.clone=width;break;case"right":object.css({marginTop:0,marginLeft:0});clone.css({marginTop:0,marginLeft:-width+"px"});s.pos.clone=-width;break};if(s.auto){initMainTimer();object.hover(function(){clear(s.mainTimer)},function(){initMainTimer()});clone.hover(function(){clear(s.mainTimer)},function(){initMainTimer()})};if(callback){callback()};if(s.control){initControls()}};var initMainTimer=function(delay){clear(s.mainTimer);s.stay=delay?delay:s.stay;s.mainTimer=setInterval(function(){initSubTimer()},s.stay)};var initSubTimer=function(){clear(s.subTimer);s.subTimer=setInterval(function(){roll()},s.delay)};var clear=function(timer){if(timer!=null){clearInterval(timer)}};var disControl=function(A){if(A){$(s._front).unbind("click");$(s._back).unbind("click");$(s._stop).unbind("click");$(s._continue).unbind("click")}else{initControls()}};var initControls=function(){if(s._front!=null){$(s._front).click(function(){$(s._front).addClass(s.disabled);disControl(true);clear(s.mainTimer);s.convert=true;s.btn="front";initSubTimer();if(!s.auto){s.tag=true};convert()})};if(s._back!=null){$(s._back).click(function(){$(s._back).addClass(s.disabled);disControl(true);clear(s.mainTimer);s.convert=true;s.btn="back";initSubTimer();if(!s.auto){s.tag=true};convert()})};if(s._stop!=null){$(s._stop).click(function(){clear(s.mainTimer)})};if(s._continue!=null){$(s._continue).click(function(){initMainTimer()})}};var convert=function(){if(s.tag&&s.convert){s.convert=false;if(s.btn=="front"){if(s.deriction=="down"){s.deriction="up"};if(s.deriction=="right"){s.deriction="left"}};if(s.btn=="back"){if(s.deriction=="up"){s.deriction="down"};if(s.deriction=="left"){s.deriction="right"}};if(s.auto){initMainTimer()}else{initMainTimer(4*s.delay)}}};var setPos=function(y1,y2,x){if(x){clear(s.subTimer);s.pos.object=y1;s.pos.clone=y2;s.tag=true}else{s.tag=false};if(s.tag){if(s.convert){convert()}else{if(!s.auto){clear(s.mainTimer)}}};if(s.deriction=="up"||s.deriction=="down"){object.css({marginTop:y1+"px"});clone.css({marginTop:y2+"px"})};if(s.deriction=="left"||s.deriction=="right"){object.css({marginLeft:y1+"px"});clone.css({marginLeft:y2+"px"})}};var roll=function(){var y_object=(s.deriction=="up"||s.deriction=="down")?parseInt(object.get(0).style.marginTop):parseInt(object.get(0).style.marginLeft);var y_clone=(s.deriction=="up"||s.deriction=="down")?parseInt(clone.get(0).style.marginTop):parseInt(clone.get(0).style.marginLeft);var y_add=Math.max(Math.abs(y_object-s.pos.object),Math.abs(y_clone-s.pos.clone));var y_ceil=Math.ceil((step-y_add)/s.speed);switch(s.deriction){case"up":if(y_add==step){setPos(y_object,y_clone,true);$(s._front).removeClass(s.disabled);disControl(false)}else{if(y_object<=-height){y_object=y_clone+height;s.pos.object=y_object};if(y_clone<=-height){y_clone=y_object+height;s.pos.clone=y_clone};setPos((y_object-y_ceil),(y_clone-y_ceil))};break;case"down":if(y_add==step){setPos(y_object,y_clone,true);$(s._back).removeClass(s.disabled);disControl(false)}else{if(y_object>=height){y_object=y_clone-height;s.pos.object=y_object};if(y_clone>=height){y_clone=y_object-height;s.pos.clone=y_clone};setPos((y_object+y_ceil),(y_clone+y_ceil))};break;case"left":if(y_add==step){setPos(y_object,y_clone,true);$(s._front).removeClass(s.disabled);disControl(false)}else{if(y_object<=-width){y_object=y_clone+width;s.pos.object=y_object};if(y_clone<=-width){y_clone=y_object+width;s.pos.clone=y_clone};setPos((y_object-y_ceil),(y_clone-y_ceil))};break;case"right":if(y_add==step){setPos(y_object,y_clone,true);$(s._back).removeClass(s.disabled);disControl(false)}else{if(y_object>=width){y_object=y_clone-width;s.pos.object=y_object};if(y_clone>=width){y_clone=y_object-width;s.pos.clone=y_clone};setPos((y_object+y_ceil),(y_clone+y_ceil))};break}};if(s.deriction=="up"||s.deriction=="down"){if(height>=s.height&&height>=s.step){init()}};if(s.deriction=="left"||s.deriction=="right"){if(width>=s.width&&width>=s.step){init()}}}})(jQuery);

$(document).ready(function() {
	
	//产品选择信息
	$(".goods_choose").mouseover(function(){
		$(this).attr("id","goods_choose_hover");
		}).mouseout(function(){
		$(this).attr("id","");
	});
	$("#color_color li img").bind("click", function() {
        if ($(this).parent().parent().attr("id") != "onlickImg") {
            $("#color_color li").removeAttr("id");
            $(this).parent().parent().attr("id", "onlickImg");
            $("#goods_color1").text($(this).attr("alt"));
            $("#goods_color2").text($(this).attr("alt"));
        }
//        alert($(this).attr("alt"));
    })
	//问答信息
	$(".q_bg").mouseover(function(){
		$(this).attr("id","q_bg_hover")
		}).mouseout(function(){
		$(this).attr("id","")
	});
	
	//热卖推荐
	$(".hot_list").carousel({
		width:760,
		height:285,
		delay:15,
		auto:true,
		_front:".hot-next",
		_back:".hot-prev"
	});
	
	// 放大镜小图上下滚动 
    $("#imageMenu").carousel({
		width:72,
		height:400,
		delay:10,
		speed:3,
		control:true,
		_front:".smallImgDown",
		_back:".smallImgUp"
	});
	
	// 商品促销 
    $(".send_pro").carousel({
		deriction:"left",					 
		width:660,
		height:115,
		delay:10,
		control:true,
		_front:".prev",
		_back:".next"
	});
	
	//放大镜视窗
	$("#bigView").decorateIframe();
	
    //点击到中图
    var midChangeHandler = null;
    $("#imageMenu li img").bind("click", function() {

        if ($(this).attr("id") != "onlickImg") {
            midChange($(this).attr("src").replace("small", "mid"));
            $("#imageMenu li").removeAttr("id");
            $(this).parent().attr("id", "onlickImg");
        }
    }).bind("mouseover", function() {
        if ($(this).attr("id") != "onlickImg") {
            window.clearTimeout(midChangeHandler);
            midChange($(this).attr("src").replace("small", "mid"));
            $(this).css({ "border": "1px solid #990000" });
        }
    }).bind("mouseout", function() {
        if ($(this).attr("id") != "onlickImg") {
            $(this).removeAttr("style");
            midChangeHandler = window.setTimeout(function() { midChange($("#onlickImg img").attr("src").replace("small", "mid")); }, 1000);

        }
    });

    function midChange(src) {
        $("#midimg").attr("src", src).load(function() { changeViewImg(); });
    }
	
    //大视窗看图
    function mouseover(e) {
        if ($("#winSelector").css("display") == "none") {
            $("#winSelector,#bigView").show();
        }

        $("#winSelector").css(fixedPosition(e));
        e.stopPropagation();
    }


    function mouseOut(e) {
        if ($("#winSelector").css("display") != "none") {
            $("#winSelector,#bigView").hide();
        }
        e.stopPropagation();
    }


    $("#midimg").mouseover(mouseover); //中图事件
    $("#midimg,#winSelector").mousemove(mouseover).mouseout(mouseOut); //选择器事件

    var $divWidth = $("#winSelector").width(); //选择器宽度
    var $divHeight = $("#winSelector").height(); //选择器高度
    var $imgWidth = $("#midimg").width(); //中图宽度
    var $imgHeight = $("#midimg").height(); //中图高度
    var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度

    function changeViewImg() {
        $("#bigView img").attr("src", $("#midimg").attr("src").replace("mid", "big"));
    }
    changeViewImg();

    $("#bigView").scrollLeft(0).scrollTop(0);
    function fixedPosition(e) {
        if (e == null) {
            return;
        }
        var $imgLeft = $("#midimg").offset().left; //中图左边距
        var $imgTop = $("#midimg").offset().top; //中图上边距
        X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
        Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
        X = X < 0 ? 0 : X;
        Y = Y < 0 ? 0 : Y;
        X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
        Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

        if ($viewImgWidth == null) {
            $viewImgWidth = $("#bigView img").outerWidth();
            $viewImgHeight = $("#bigView img").height();
            if ($viewImgWidth < 200 || $viewImgHeight < 200) {
                $viewImgWidth = $viewImgHeight = 800;
            }
            $height = $divHeight * $viewImgHeight / $imgHeight;
            $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);
            $("#bigView").height($height);
        }

        var scrollX = X * $viewImgWidth / $imgWidth;
        var scrollY = Y * $viewImgHeight / $imgHeight;
        $("#bigView img").css({ "left": scrollX * -1, "top": scrollY * -1 });


        //用户视窗高度
        var viewH = document.documentElement.clientHeight == 0 ? document.body.clientHeight : document.documentElement.clientHeight;
        var top = ((viewH - $height) / 2) + $(document).scrollTop();
        top = top < 235 ? 235 : top;
        if ($(window).width() > $(document.body).width()) {
            //left = left - (($(window).width() - $(document.body).width()) / 2);
        }
        $("#bigView").css({ "top": top, "left": $(".preview").offset().left+$(".preview").width()+15 });

        return { left: X, top: Y };
    }
	// 放大镜结束 (以上)
	
	// 尺寸提示框
	var Lis = $('#tip_size ul li');	
	var popBoxs = $('#tip_size .size_box');
	var i = 0;
	var timer;
	Lis.hover(function(){
		if(timer!='undefined') clearInterval(timer);
		i = Lis.index($(this)[0]);
		popBoxs.hide();
		$(popBoxs[i]).show();
	}, function(){
		timer = setInterval(function(){
			$(popBoxs[i]).hide();
		}, 100);
	});
	popBoxs.hover(function(){
		clearInterval(timer);
	}, function(){
		timer = setInterval(function(){
			$(popBoxs[i]).hide();
		}, 100);
	});
	
	// ajax 选项卡
    $(".pay-btn li").each(function(i){
        $(this).click(function(){
            get_data(i);
            $(".pay-btn li").removeClass("current");
			$(this).addClass("current");
        })
    });
    //初始化
    $(".pay-con .items").ajaxSend(function(request, settings){
       $(this).html("<div align=\"center\"><img src=\"images/loading.gif\" /></div>");
     });
     get_data(0);
	//Ajax数据读取
	function get_data(id)
	{
		var goodsId = $("#goodsId").text();
		$.ajax({
			type:"get",
			url:"pay.jsp?goodsId="+goodsId,
			dataType:"jsp",
			data:"id="+id,
			success:function(msg){
				$(".pay-con .items").ajaxSuccess(function(request, settings){
				   $(this).html(msg);
				 });
			}
		})
	}
	
});

//tab plugins 插件
$(document).ready(function(){
						   
	//商品详细内容选项卡
	$('#box-info .tab li').click(function(){
		TabSelect("#box-info .tab li", "#box-info .tabcon .items", "current", $(this))
	});
	$('#box-info .tab li').eq(0).trigger("click");

	function TabSelect(tab,con,addClass,obj){
		var $_self = obj;
		var $_nav = $(tab);
		$_nav.removeClass(addClass),
		$_self.addClass(addClass);
		var $_index = $_nav.index($_self);
		var $_con = $(con);
		$_con.hide(),
		$_con.eq($_index).show();
	}
	
});
// 分享代码
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

var shareid="fenxiang";
(function(){var a={
	url:function(){
		return encodeURIComponent(window.location.href)
	},title:function(){
		return encodeURIComponent(window.document.title)
	},content:function(b){
		if(b){
			return encodeURIComponent($("#"+b).html())
		}else{
			return""
		}
	},setid:function(){
		if(typeof(shareid)=="undefined"){
			return null
		}else{
			return shareid
		}
	},kaixin:function(){
		window.open("http://www.kaixin001.com/repaste/share.php?rtitle="+this.title()+"&rurl="+this.url()+"&rcontent="+this.content(this.setid()))
	},renren:function(){
		window.open("http://share.renren.com/share/buttonshare.do?link="+this.url()+"&title="+this.title())
	},sinaminiblog:function(){
		window.open("http://v.t.sina.com.cn/share/share.php?url="+this.url()+"&title="+this.title()+"&content=utf-8&source=&sourceUrl=&pic=")
	},baidusoucang:function(){
		window.open("http://cang.baidu.com/do/add?it="+this.title()+"&iu="+this.url()+"&dc="+this.content(this.setid())+"&fr=ien#nw=1")
	},taojianghu:function(){window.open("http://share.jianghu.taobao.com/share/addShare.htm?title="+this.title()+"&url="+this.url()+"&content="+this.content(this.setid()))
	},wangyi:function(){window.open("http://t.163.com/article/user/checkLogin.do?source=%E7%BD%91%E6%98%93%E6%96%B0%E9%97%BB%20%20%20&link="+this.url()+"&info="+this.content(this.setid()))
	},qqzone:function(){window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+ encodeURIComponent(location.href)+ '&title='+encodeURIComponent(document.title))
	},douban:function(){window.open("http://www.douban.com/recommend/?url="+this.url()+"&title="+this.title()+"&v=1")
	}};
	window.share=a
})();

$(function(){
	$(".renren").click(function(){
		share.renren();
	});
	$(".xinlang").click(function(){
		share.sinaminiblog();
	});
	$(".douban").click(function(){
		share.douban();
	});
	$(".kaixin").click(function(){
		share.kaixin();
	});
	$(".taojianghu").click(function(){
		share.taojianghu();
	});
	$(".wangyi").click(function(){
		share.wangyi();
	});
	$(".qqzone").click(function(){
		share.qqzone();
	});
	$(".baidusoucang").click(function(){
		share.baidusoucang();
	});
	$(".qqweibo").click(function(){
		share.qqweibo();
	});
});
function postToWb(){
	var _t = encodeURI(document.title);
	var _url = encodeURI(document.location);
	var _appkey = encodeURI("appkey");
	var _u = 'http://v.t.qq.com/share/share.php?title='+_t+'&url='+_url+'&appkey='+_appkey;
	window.open( _u );
}
/** jQuery Calculation Plug-in**/
(function($){var defaults = {reNumbers: /(-|-\$)?(\d+(,\d{3})*(\.\d{1,})?|\.\d{1,})/g, cleanseNumber: function (v){return v.replace(/[^0-9.\-]/g, "");}, useFieldPlugin: (!!$.fn.getValue), onParseError: null, onParseClear: null};$.Calculation = {version: "0.4.07",setDefaults: function(options){$.extend(defaults, options);}};$.fn.parseNumber = function(options){var aValues = [];options = $.extend(options, defaults);this.each(function (){var $el = $(this),sMethod = ($el.is(":input") ? (defaults.useFieldPlugin ? "getValue" : "val") : "text"),v = $.trim($el[sMethod]()).match(defaults.reNumbers, "");if( v == null ){v = 0; if( jQuery.isFunction(options.onParseError) ) options.onParseError.apply($el, [sMethod]);$.data($el[0], "calcParseError", true);} else {v = options.cleanseNumber.apply(this, [v[0]]);if( $.data($el[0], "calcParseError") && jQuery.isFunction(options.onParseClear) ){options.onParseClear.apply($el, [sMethod]);$.data($el[0], "calcParseError", false);} }aValues.push(parseFloat(v, 10));});return aValues;};$.fn.calc = function(expr, vars, cbFormat, cbDone){var $this = this, exprValue = "", precision = 0, $el, parsedVars = {}, tmp, sMethod, _, bIsError = false;for( var k in vars ){expr = expr.replace( (new RegExp("(" + k + ")", "g")), "_.$1");if( !!vars[k] && !!vars[k].jquery ){parsedVars[k] = vars[k].parseNumber();} else {parsedVars[k] = vars[k];}}this.each(function (i, el){var p, len;$el = $(this);sMethod = ($el.is(":input") ? (defaults.useFieldPlugin ? "setValue" : "val") : "text");_ = {};for( var k in parsedVars ){if( typeof parsedVars[k] == "number" ){_[k] = parsedVars[k];} else if( typeof parsedVars[k] == "string" ){_[k] = parseFloat(parsedVars[k], 10);} else if( !!parsedVars[k] && (parsedVars[k] instanceof Array) ) {tmp = (parsedVars[k].length == $this.length) ? i : 0;_[k] = parsedVars[k][tmp];}if( isNaN(_[k]) ) _[k] = 0;p = _[k].toString().match(/\.\d+$/gi);len = (p) ? p[0].length-1 : 0;if( len > precision ) precision = len; }try {exprValue = eval( expr );if( precision ) exprValue = Number(exprValue.toFixed(Math.max(precision, 4)));if( jQuery.isFunction(cbFormat) ){var tmp = cbFormat.apply(this, [exprValue]);if( !!tmp ) exprValue = tmp;}} catch(e){exprValue = e;bIsError = true;}$el[sMethod](exprValue.toString());});if( jQuery.isFunction(cbDone) ) cbDone.apply(this, [this]);return this;};$.each(["sum", "avg", "min", "max"], function (i, method){$.fn[method] = function (bind, selector){if( arguments.length == 0 )return math[method](this.parseNumber());var bSelOpt = selector && (selector.constructor == Object) && !(selector instanceof jQuery);var opt = bind && bind.constructor == Object ? bind : {bind: bind || "keyup", selector: (!bSelOpt) ? selector : null, oncalc: null};if( bSelOpt ) opt = jQuery.extend(opt, selector);if( !!opt.selector ) opt.selector = $(opt.selector);var self = this, sMethod, doCalc = function (){var value = math[method](self.parseNumber(opt));if( !!opt.selector ){sMethod = (opt.selector.is(":input") ? (defaults.useFieldPlugin ? "setValue" : "val") : "text");opt.selector[sMethod](value.toString());}if( jQuery.isFunction(opt.oncalc) ) opt.oncalc.apply(self, [value, opt]);};doCalc();return self.bind(opt.bind, doCalc);}});var math = {sum: function (a){var total = 0, precision = 0;$.each(a, function (i, v){var p = v.toString().match(/\.\d+$/gi), len = (p) ? p[0].length-1 : 0;if( len > precision ) precision = len; total += v;});if( precision ) total = Number(total.toFixed(precision));return total;},avg: function (a){return math.sum(a)/a.length;},min: function (a){return Math.min.apply(Math, a);},max: function (a){return Math.max.apply(Math, a);}};})(jQuery);
/** ------------- choose -------------------- **/
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
	
	//产品价格统计
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
	
	//产品积分统计
	$("[id^=total_points]").calc(

		"(qty * price)/10*2",

		{
			qty: $("input[name^=qty_item_]"),
			price: $("[id^=price_item_]")
		},

		function (s){
			return "" + s.toFixed(0);
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
	$(".size_li strong").html(text);
	$("#result").html("" + getSelectedValue("sample"));
});
				
function getSelectedValue(id) {
	return $("#" + id).find(".size_li span.value").html();
};

// star choose
jQuery.fn.rater	= function(options) {
		
	// 默认参数
	var settings = {
		enabled	: true,
		url		: '',
		method	: 'post',
		min		: 1,
		max		: 5,
		step	: 1,
		value	: null,
		after_click	: null,
		before_ajax	: null,
		after_ajax	: null,
		title_format	: null,
		info_format	: null,
		image	: 'images/comment/stars.jpg',
		imageAll :'images/comment/stars-all.gif',
		defaultTips :true,
		clickTips :true,
		width	: 24,
		height	: 24
	}; 
	
	// 自定义参数
	if(options) {  
		jQuery.extend(settings, options); 
	}
	
	//外容器
	var container	= jQuery(this);
	
	// 主容器
	var content	= jQuery('<ul class="rater-star"></ul>');
	content.css('background-image' , 'url(' + settings.image + ')');
	content.css('height' , settings.height);
	content.css('width' , (settings.width*settings.step) * (settings.max-settings.min+settings.step)/settings.step);
	//显示结果区域
	var result= jQuery('<div class="rater-star-result"></div>');
	container.after(result); 
	//显示点击提示
	var clickTips= jQuery('<div class="rater-click-tips"><span>点击星星就可以评分了</span></div>');
		if(!settings.clickTips){
			clickTips.hide();	
		}
	container.after(clickTips); 
	//默认手形提示
	var tipsItem= jQuery('<li class="rater-star-item-tips"></li>');
	tipsItem.css('width' , (settings.width*settings.step) * (settings.max-settings.min+settings.step)/settings.step);
	tipsItem.css('z-index' , settings.max / settings.step + 2);
		if(!settings.defaultTips){	//隐藏默认的提示
			tipsItem.hide();
		}
	content.append(tipsItem);
	// 当前选中的
	var item	= jQuery('<li class="rater-star-item-current"></li>');
	item.css('background-image' , 'url(' + settings.image + ')');
	item.css('height' , settings.height);
	item.css('width' , 0);
	item.css('z-index' , settings.max / settings.step + 1);
	if (settings.value) {
		item.css('width' , ((settings.value-settings.min)/settings.step+1)*settings.step*settings.width);
	};
	content.append(item);

	
	// 星星
	for (var value=settings.min ; value<=settings.max ; value+=settings.step) {
		item	= jQuery('<li class="rater-star-item"><div class="popinfo"></div></li>');
		if (typeof settings.info_format == 'function') {
			//item.attr('title' , settings.title_format(value));
			item.find(".popinfo").html(settings.info_format(value));
			item.find(".popinfo").css("left",(value-1)*settings.width)
		}
		else {
			item.attr('title' , value);
		}
		item.css('height' , settings.height);
		item.css('width' , (value-settings.min+settings.step)*settings.width);
		item.css('z-index' , (settings.max - value) / settings.step + 1);
		item.css('background-image' , 'url(' + settings.image + ')');
		
		if (!settings.enabled) {	// 若是不能更改，则隐藏
			item.hide();
		}
		
		content.append(item);
	}
	
	content.mouseover(function(){
		if (settings.enabled) {
			jQuery(this).find('.rater-star-item-current').hide();
		}
	}).mouseout(function(){
			jQuery(this).find('.rater-star-item-current').show();
	})
	// 添加鼠标悬停/点击事件
	var shappyWidth=(settings.max-2)*settings.width;
	var happyWidth=(settings.max-1)*settings.width;
	var fullWidth=settings.max*settings.width;
	content.find('.rater-star-item').mouseover(function() {
		jQuery(this).prevAll('.rater-star-item-tips').hide();
		jQuery(this).attr('class' , 'rater-star-item-hover');
		jQuery(this).find(".popinfo").show();
		
		//当3分时用笑脸表示
		if(parseInt(jQuery(this).css("width"))==shappyWidth){
			jQuery(this).addClass('rater-star-happy');
		}
		//当4分时用笑脸表示
		if(parseInt(jQuery(this).css("width"))==happyWidth){
			jQuery(this).addClass('rater-star-happy');
		}
		//当5分时用笑脸表示
		if(parseInt(jQuery(this).css("width"))==fullWidth){
			jQuery(this).removeClass('rater-star-item-hover');
			jQuery(this).css('background-image' , 'url(' + settings.imageAll + ')');
			jQuery(this).css({cursor:'pointer',position:'absolute',left:'0',top:'0'});
		}
	}).mouseout(function() {
		var outObj=jQuery(this);
		outObj.css('background-image' , 'url(' + settings.image + ')');
		outObj.attr('class' , 'rater-star-item');
		outObj.find(".popinfo").hide();
		outObj.removeClass('rater-star-happy');
		jQuery(this).prevAll('.rater-star-item-tips').show();
		//var startTip=function () {
		//outObj.prevAll('.rater-star-item-tips').show();
		//};
		//startTip();
	}).click(function() {
		//jQuery(this).prevAll('.rater-star-item-tips').css('display','none');
		jQuery(this).parents(".rater-star").find(".rater-star-item-tips").remove();
		jQuery(this).parents(".goods-comm-stars").find(".rater-click-tips").remove();
		jQuery(this).prevAll('.rater-star-item-current').css('width' , jQuery(this).width());
		   if(parseInt(jQuery(this).prevAll('.rater-star-item-current').css("width"))==happyWidth||parseInt(jQuery(this).prevAll('.rater-star-item-current').css("width"))==shappyWidth){	
			jQuery(this).prevAll('.rater-star-item-current').addClass('rater-star-happy');
			}
		else{
			jQuery(this).prevAll('.rater-star-item-current').removeClass('rater-star-happy');
			}
			if(parseInt(jQuery(this).prevAll('.rater-star-item-current').css("width"))==fullWidth){	
			jQuery(this).prevAll('.rater-star-item-current').addClass('rater-star-full');
			}
		else{
			jQuery(this).prevAll('.rater-star-item-current').removeClass('rater-star-full');
			}
		var star_count		= (settings.max - settings.min) + settings.step;
		var current_number	= jQuery(this).prevAll('.rater-star-item').size()+1;
		var current_value	= settings.min + (current_number - 1) * settings.step;
		
		//显示当前分值
		if (typeof settings.title_format == 'function') {
			jQuery(this).parents().nextAll('.rater-star-result').html(current_value+'分&nbsp;'+settings.title_format(current_value));
		}
		//jQuery(this).parents().next('.rater-star-result').html(current_value);
		//jQuery(this).unbind('mouseout',startTip)
	})
	
	jQuery(this).html(content);
	
}

// 星星打分
$(function(){
	var options	= {
	max	: 5,
	title_format	: function(value) {
		var title = '';
		switch (value) {
			case 1 : 
				title	= '很不满意';
				break;
			case 2 : 
				title	= '不满意';
				break;
			case 3 : 
				title	= '一般';
				break;
			case 4 : 
				title	= '满意';
				break;
			case 5 : 
				title	= '非常满意';
				break;
			default :
				title = value;
				break;
		}
		return title;
	},
	info_format	: function(value) {
		var info = '';
		switch (value) {
			case 1 : 
				info	= '<div class="info-box">1分&nbsp;很不满意<div>商品样式和质量都非常差，太令人失望了！</div></div>';
				break;
			case 2 : 
				info	= '<div class="info-box">2分&nbsp;不满意<div>商品样式和质量不好，不能满足要求。</div></div>';
				break;
			case 3 : 
				info	= '<div class="info-box">3分&nbsp;一般<div>商品样式和质量感觉一般。</div></div>';
				break;
			case 4 : 
				info	= '<div class="info-box">4分&nbsp;满意<div>商品样式和质量都比较满意，符合我的期望。</div></div>';
				break;
			case 5 : 
				info	= '<div class="info-box">5分&nbsp;非常满意<div>我很喜欢！商品样式和质量都很满意，太棒了！</div></div>';
				break;
			default :
				info = value;
				break;
		}
			return info;
		}
	}
	$('#rate-comm-1').rater(options);
});