// 搜索分类
$(function() {
	var $ui = $('#ui_element');
	
	$ui.find('.sb_input').bind('focus click',function(){
		$ui.find('.sb_down').addClass('sb_up').removeClass('sb_down').andSelf().find('.sb_dropdown').bgIframe().slideDown(300);
	});
	
	$ui.bind('mouseleave',function(){
		$ui.find('.sb_up').addClass('sb_down').removeClass('sb_up').andSelf().find('.sb_dropdown').bgIframe().slideUp(300);
	});
	
	$('.close').click(function(){
		$ui.find('.sb_up').addClass('sb_down').removeClass('sb_up').andSelf().find('.sb_dropdown').bgIframe().slideUp(300);
	});
	
	$ui.find('.sb_dropdown').find('label[for="all"]').prev().bind('click',function(){
		$(this).parent().siblings().find(':checkbox').attr('checked',this.checked).attr('disabled',this.checked);
	});
});
// 产品筛选
$(document).ready(function() {
	$('.shaixuan_0 a').click(function() {
		$(this).css('outline','none');
		$('.shaixuan_0 .current').removeClass('current');
		$(this).parent().addClass('current');
		
		var filterVal = $(this).text().toLowerCase().replace(' ','-');
				
		if(filterVal == 'all') {
			$('#item_list_0 li.hidden').fadeIn('slow').removeClass('hidden');
		} else {
			
			$('#item_list_0 li').each(function() {
				if(!$(this).hasClass(filterVal)) {
					$(this).fadeOut('normal').addClass('hidden');
				} else {
					$(this).fadeIn('slow').removeClass('hidden');
				}
			});
		}
		
		return false;
	});
	
$('.shaixuan_1 a').click(function() {$(this).css('outline','none');$('.shaixuan_1 .current').removeClass('current');$(this).parent().addClass('current');var filterVal = $(this).text().toLowerCase().replace(' ','-');if(filterVal == 'all') {$('#item_list_1 li.hidden').fadeIn('slow').removeClass('hidden');} else {$('#item_list_1 li').each(function(){if(!$(this).hasClass(filterVal)) {$(this).fadeOut('normal').addClass('hidden');}else{$(this).fadeIn('slow').removeClass('hidden');}});}return false;});
$('.shaixuan_2 a').click(function() {$(this).css('outline','none');$('.shaixuan_2 .current').removeClass('current');$(this).parent().addClass('current');var filterVal = $(this).text().toLowerCase().replace(' ','-');if(filterVal == 'all') {$('#item_list_2 li.hidden').fadeIn('slow').removeClass('hidden');} else {$('#item_list_2 li').each(function(){if(!$(this).hasClass(filterVal)) {$(this).fadeOut('normal').addClass('hidden');}else{$(this).fadeIn('slow').removeClass('hidden');}});}return false;});
$('.shaixuan_3 a').click(function() {$(this).css('outline','none');$('.shaixuan_3 .current').removeClass('current');$(this).parent().addClass('current');var filterVal = $(this).text().toLowerCase().replace(' ','-');if(filterVal == 'all') {$('#item_list_3 li.hidden').fadeIn('slow').removeClass('hidden');} else {$('#item_list_3 li').each(function(){if(!$(this).hasClass(filterVal)) {$(this).fadeOut('normal').addClass('hidden');}else{$(this).fadeIn('slow').removeClass('hidden');}});}return false;});
$('.shaixuan_4 a').click(function() {$(this).css('outline','none');$('.shaixuan_4 .current').removeClass('current');$(this).parent().addClass('current');var filterVal = $(this).text().toLowerCase().replace(' ','-');if(filterVal == 'all') {$('#item_list_4 li.hidden').fadeIn('slow').removeClass('hidden');} else {$('#item_list_4 li').each(function(){if(!$(this).hasClass(filterVal)) {$(this).fadeOut('normal').addClass('hidden');}else{$(this).fadeIn('slow').removeClass('hidden');}});}return false;});
	
});
// meun 
$(document).ready(function(){				   
	renderMenu();
});

function renderMenu(e) {
    var w=0;

	siteWidth = $(".site-nav").width();
	parentOffsetLeft = $('#floor_nav').offset().left;

	$("#floor_nav ul.floors li").each(function(i) {
		offset = $(this).offset(); 
		menu = $('#sub_' + this.id);
        $('#sub_' + this.id).css("width",w+"px")
		leftPosition = offset.left-parentOffsetLeft ;
		if(w+leftPosition > siteWidth ){ 
			leftPosition=siteWidth-w-$(this).width();
		}

		menu.css("left", leftPosition + "px");
		menu.css("left",(parseInt(menu.css("left"))-0)+"px");
		menu.css("top", "46px");

		menu.find(".sort_nav");
		menu.bgiframe(); //fix for ie6
		$(this).dropdown({ menu: menu, type: 'simple'});
	});
}

(function($){
$.fn.dropdown = function(opt){
    
    var defaults = {
        speed: 0,
        delay: 50,
        type: 'slide',
        transIn: {opacity: 'show'},
        transOut: {opacity: 'hide'}     
    };
    
    var options = $.extend(defaults, opt);
    
    var menu = $(options.menu);
    var speed = options.speed;
    var delay = options.delay;
    var type = options.type;
    var transIn = options.transIn;
    var transOut = options.transOut;
    
    var menuOver = false;
    var buttonOver = false;
    
    //find the top level menu image
    var topLevelMenuImage = $(this).find('a img')[0];
    
    //find top level anchor
    var topLevelAnchor = $(this).find('a')[0];
    
    var topNavItem = "";
   
	var topNavConfig = {    
		 sensitivity: 9, // number = sensitivity threshold (must be 1 or higher)    
		 interval: 0, // number = milliseconds for onMouseOver polling interval    
		 over: topNavOver, // function = onMouseOver callback (REQUIRED)    
		 timeout: 200, // number = milliseconds delay before onMouseOut    
		 out: topNavOut // function = onMouseOut callback (REQUIRED)    
	};
	
	var subNavConfig = {    
		 sensitivity: 99999, // number = sensitivity threshold (must be 1 or higher)    
		 interval: 0, // number = milliseconds for onMouseOver polling interval    
		 over: subNavOver, // function = onMouseOver callback (REQUIRED)
		 timeout: 200, // number = milliseconds delay before onMouseOut    
		 out: subNavOut // function = onMouseOut callback (REQUIRED)    
	};

    $(menu).hide();
    $(this).hoverIntent(topNavConfig);
	$(menu).hoverIntent(subNavConfig);

    function topNavOver(){
		$(".menu").hide();
		$(topLevelAnchor).parent().siblings("li").children("a.active").removeClass("active");
        if(menu.is(':animated')){return};
        if(parseInt(menu.css("left"))<0)
            menu.css("left","0px");
        //alert(menu.css("left"));
        switch(type)
        {
            case 'slide':
                $(menu).slideDown(speed);
                break;
            case 'fade':
                $(menu).fadeIn(speed);
                break;
            case 'simple':
                $(menu).show();
                break;
            case 'blind':
                $(menu).show("blind", { direction: "vertical" }, 200);
                break;
            case 'custom':
                $(menu).animate(transIn, speed)
        }
        buttonOver = true;
        $(topLevelAnchor).addClass("active");
    }

    function topNavOut(){
        buttonOver = false;
        setTimeout(function(){
            if(menuOver == false && buttonOver == false){
                switch(type)
                {
                    case 'slide':
                        $(menu).slideUp(speed);
                        break;
                    case 'fade':
                        $(menu).fadeOut(speed);
                        break;
                    case 'simple':
                        $(menu).hide();
                        break;
                    case 'blind':
                        $(menu).hide("blind", { direction: "vertical" }, 200);
                        break;
                    case 'custom':
                    $(menu).animate(transOut, speed)
                }
                $(topLevelAnchor).removeClass("active"); 
            }
        }, delay);
        
    }

    function subNavOver (){
        menuOver = true;
        $(topLevelAnchor).addClass("active");
   } 

    function subNavOut(){
        menuOver = false;
        setTimeout(function(){
            if(menuOver == false && buttonOver == false){
                switch(type)
                {
                case 'slide':
                    $(menu).slideUp(speed);
                    break;
                case 'fade':
                    $(menu).fadeOut(speed);
                    break;
                case 'simple':
                    $(menu).hide();
                    break;
                case 'custom':
                    $(menu).animate(transOut, speed)
                }
                $(topLevelAnchor).removeClass("active");
            }
        }, delay);
    }

}
})
(jQuery);
// jquery.plugins.bgiframe
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(b($){$.m.E=$.m.g=b(s){h($.x.10&&/6.0/.I(D.B)){s=$.w({c:\'3\',5:\'3\',8:\'3\',d:\'3\',k:M,e:\'F:i;\'},s||{});C a=b(n){f n&&n.t==r?n+\'4\':n},p=\'<o Y="g"W="0"R="-1"e="\'+s.e+\'"\'+\'Q="P:O;N:L;z-H:-1;\'+(s.k!==i?\'G:J(K=\\\'0\\\');\':\'\')+\'c:\'+(s.c==\'3\'?\'7(((l(2.9.j.A)||0)*-1)+\\\'4\\\')\':a(s.c))+\';\'+\'5:\'+(s.5==\'3\'?\'7(((l(2.9.j.y)||0)*-1)+\\\'4\\\')\':a(s.5))+\';\'+\'8:\'+(s.8==\'3\'?\'7(2.9.S+\\\'4\\\')\':a(s.8))+\';\'+\'d:\'+(s.d==\'3\'?\'7(2.9.v+\\\'4\\\')\':a(s.d))+\';\'+\'"/>\';f 2.T(b(){h($(\'> o.g\',2).U==0)2.V(q.X(p),2.u)})}f 2}})(Z);',62,63,'||this|auto|px|left||expression|width|parentNode||function|top|height|src|return|bgiframe|if|false|currentStyle|opacity|parseInt|fn||iframe|html|document|Number||constructor|firstChild|offsetHeight|extend|browser|borderLeftWidth||borderTopWidth|userAgent|var|navigator|bgIframe|javascript|filter|index|test|Alpha|Opacity|absolute|true|position|block|display|style|tabindex|offsetWidth|each|length|insertBefore|frameborder|createElement|class|jQuery|msie'.split('|'),0,{}));
// jquery.plugins.hoverintent
(function($){$.fn.hoverIntent=function(f,g){var cfg={sensitivity:7,interval:100,timeout:0};cfg=$.extend(cfg,g?{over:f,out:g}:f);var cX,cY,pX,pY;var track=function(ev){cX=ev.pageX;cY=ev.pageY;};var compare=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);if((Math.abs(pX-cX)+Math.abs(pY-cY))<cfg.sensitivity){$(ob).unbind("mousemove",track);ob.hoverIntent_s=1;return cfg.over.apply(ob,[ev]);}else{pX=cX;pY=cY;ob.hoverIntent_t=setTimeout(function(){compare(ev,ob);},cfg.interval);}};var delay=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);ob.hoverIntent_s=0;return cfg.out.apply(ob,[ev]);};var handleHover=function(e){var p=(e.type=="mouseover"?e.fromElement:e.toElement)||e.relatedTarget;while(p&&p!=this){try{p=p.parentNode;}catch(e){p=this;}}if(p==this){return false;}var ev=jQuery.extend({},e);var ob=this;if(ob.hoverIntent_t){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);}if(e.type=="mouseover"){pX=ev.pageX;pY=ev.pageY;$(ob).bind("mousemove",track);if(ob.hoverIntent_s!=1){ob.hoverIntent_t=setTimeout(function(){compare(ev,ob);},cfg.interval);}}else{$(ob).unbind("mousemove",track);if(ob.hoverIntent_s==1){ob.hoverIntent_t=setTimeout(function(){delay(ev,ob);},cfg.timeout);}}};return this.mouseover(handleHover).mouseout(handleHover);};})(jQuery);
// header my
jQuery(function(){
	
	$(".my_mesaer").each(function(i){
        $(this).hover(function(){
            $(this).find("#my_list").slideDown(300);
			$(this).addClass("hover");
        },function(){
            $(this).find("#my_list").slideUp(300);
			$(this).removeClass("hover");
        })
    });

	
	$(".cate_list li").mouseover(function(){$(this).attr("class","hover")}).mouseout(function(){$(this).attr("class","")});
});
// img hover
$(document).ready(function(){$(".p_img").each(function(i){$(this).mouseover(function(){$(this).attr("class","p_img_hover")}).mouseout(function(){$(this).attr("class","p_img")})})});
// loading img 
var lazyLoad = {
	Init : function(){
		return $("img[lazyload]");
	},
	Calculate : function(lazyloadobject){
		var windowHeight = $(window).height();
		var arrReturn = {};
		var _scrollTop;
		if(lazyloadobject.length==0){
			return null;
		}
		else{
			lazyloadobject.each(function(i){
			    _scrollTop = parseInt($(this).offset().top - windowHeight);
				if(!arrReturn.hasOwnProperty(_scrollTop)){
				    arrReturn[_scrollTop] = new Array();
				}
				arrReturn[_scrollTop].push($(this));
			});
			this.ArrLoad = arrReturn;
			return arrReturn;
		}
	},
	ArrLoad : null,
	IsLoad : function(scrolltop,objectstop){
		if(objectstop!=null&&objectstop!={}){
		    for(i in this.ArrLoad){
		        if(parseInt(i)<=scrolltop&&this.ArrLoad.hasOwnProperty(i)){
		            for(j=0;j<this.ArrLoad[i].length;j++){
		                this.ArrLoad[i][j].attr("src",this.ArrLoad[i][j].attr("lazyload")).removeAttr("lazyload");
		            }
		            delete this.ArrLoad[i];
		        }
		    }
		}
	},
	Run : function(){
		var lazyLoadObject = this.Init();
		this.Calculate(lazyLoadObject);
		arrScrollTop = this.ArrLoad;
		if(arrScrollTop==null){
			return false;
		}
		else{
			var _this = this;
			_this.IsLoad($(window).scrollTop(),arrScrollTop);
			$(window).scroll(function(){
				_this.IsLoad($(this).scrollTop(),arrScrollTop);
			});
		}
	}
};

$(function(){
	lazyLoad.Run();
});

$(window).resize(function(){
    lazyLoad.Run();
});
//bottom 下拉选单
$(document).ready(function() {	
	new $.suning.service($('#friendship_tabs a'), $('#friendship_content')).init();	
});
/**bottom list */
(function () {
	//using namespace $.suning;
	$.suning || ($.suning = {});
	
	//Extends
	$.suning.extend = function (subClass, superClass) {
		var F = function() {};
		F.prototype = superClass.prototype;
		subClass.prototype = new F();
		superClass.prototype.constructor = superClass;
		subClass.prototype.constructor = subClass;
		subClass.base = superClass.prototype;
	}
})();
//friendship
$.suning.service = function(t, d) {
	this.tabs = t;
	this.data = d.children();
	this.loc = -1;
	this.d = d;
	this.btn = $(this.data[4]);
	this.isopen = false;
	this.type = 0;
	this.delayTimer = 1;
	this.showTimer = 2;
	this.hT = 3;
};
$.suning.service.prototype = {
	init: function() {
		var that = this;
		this.data.each(function(i) {
			if (i < 4) {
				$(this).find("a").mouseover(function() {
					that.type = 1;
				});
				$(this).mouseover(function(e) {
					that.type = 1;
					clearTimeout(that.hT);
				}).mouseout(function(e) {
					that.type = 2;
					that.delay();
				});
			}
		});
		this.tabs.each(function(i) {
			$(this).mouseover(function(e) {
				clearTimeout(that.hT);
				if (that.loc != i) {
					clearTimeout(that.showTimer);
					that.showTimer = setTimeout(function() {
						that.change(i);
					}, 50);
				}
			}).mouseout(function() {
				clearTimeout(that.showTimer);
				that.hT = setTimeout(function() {
					that.close();
				},1000);
			});
		});
		this.btn.click(function(e) {
			that.close();
		});
	},
	delay: function() {
		clearTimeout(this.delayTimer);
		var ref = this;
		this.delayTimer = setTimeout(function() {
			ref.delayCall();
		}, 300);
	},
	delayCall: function() {
		if (this.type == 2) {
			this.close();
		}
	},
	close:function() {
		$(this.data[this.loc]).animate({'top': 200});
		var that = this;
		this.isopen = false;
		this.btn.animate({'top':200},function() {
			if (!that.isopen) {
				that.d.css('height', '0px');
			}
		});
		this.loc = -1;
	},
	change: function(loc) {
		this.type = 1;
		this.isopen = true;
		$(this.data[loc]).animate({'top': 130});
		if (this.loc != -1) {
			$(this.data[this.loc]).animate({'top': 200});
		} else {
			this.d.css('height', '200px');

			this.btn.animate({'top':135});
		}
		this.loc = loc;
	}
};
//scroll and more add
$(document).ready(function(){

	var offset = $('#side_lm , #sidebar').offset();
	updatePos($('#side_lm , #sidebar'), offset);
		
	$(window).scroll(function() {
		updatePos($('#side_lm , #sidebar'), offset);
	});

	function updatePos(el, offset, doAnimation) {
		if ($(window).scrollTop() + 0 > offset.top) {
			$(el).css('top', ($(window).scrollTop() - offset.top + 0) + 'px');
		} else {
			$(el).stop().css('top', '0px')
		}
	};
	
	$(".btn-slide").click(function(){
		$(".side_con").slideToggle("fast");
		$(this).toggleClass("active");
		return false;
		
	});

	$('.back-to-news').click(function(){
	   $('#news_t').ScrollTo(800);
	   if(document.getElementById('donate').style.display == "none"){$('#donate').slideDown(500);$('#toggleBtnDonate').html('收起↑')};
	   return false;
	   });
	
	$('.back-to-fashion').click(function(){
	   $('#fashion_t_t').ScrollTo(800);return false;});

	$('.back-to-women').click(function(){
		$('#women_t').ScrollTo(800)
		if(document.getElementById('overview').style.display == "none"){$('#overview').slideDown(500);$('#toggleBtnOverview').html('收起↑')};
		return false;
		});

$('.back-to-man').click(function(){
		 $('#man_t').ScrollTo(800);
		 if(document.getElementById('examples').style.display == "none"){$('#examples').slideDown(500);$('#toggleBtnExample').html('收起↑')};
		 return false;
		 });

$('.back-to-kids').click(function(){
	   $('#kids_t').ScrollTo(800);
	   if(document.getElementById('qa').style.display == "none"){$('#qa').slideDown(500);$('#toggleBtnQa').html('收起↑')};
	   return false;
	   });

$('.back-to-shoe').click(function(){
		$('#shoe_t').ScrollTo(800);
		if(document.getElementById('support').style.display == "none"){$('#support').slideDown(500);$('#toggleBtnSupport').html('收起↑')};
		return false;
		});

$('.back-to-top').click(function(){$('#pageTop').ScrollTo(800);return false});

$(".toggleBtn").toggle(function(){
	if(document.getElementById(this.rel).style.display == "none"){$("#" + this.rel).slideDown(500);this.innerHTML = "收起↑";return};
	this.innerHTML = "展开↓";
	
    $("#" + this.rel).slideUp(500);
  },function(){
	 if(document.getElementById(this.rel).style.display == "block"){$("#" + this.rel).slideUp(500); this.innerHTML = "展开↓";return};
	 this.innerHTML = "收起↑";
    $("#" + this.rel).slideDown(500);
  });

	}
);
//ScrollTo
jQuery.getPos = function (e){var l = 0;var t  = 0;var w = jQuery.intval(jQuery.css(e,'width'));var h = jQuery.intval(jQuery.css(e,'height'));var wb = e.offsetWidth;var hb = e.offsetHeight;while (e.offsetParent){l += e.offsetLeft + (e.currentStyle?jQuery.intval(e.currentStyle.borderLeftWidth):0);t += e.offsetTop  + (e.currentStyle?jQuery.intval(e.currentStyle.borderTopWidth):0);e = e.offsetParent;}l += e.offsetLeft + (e.currentStyle?jQuery.intval(e.currentStyle.borderLeftWidth):0);t  += e.offsetTop  + (e.currentStyle?jQuery.intval(e.currentStyle.borderTopWidth):0);return {x:l, y:t, w:w, h:h, wb:wb, hb:hb};};jQuery.getClient = function(e){if (e) {w = e.clientWidth;h = e.clientHeight;} else {w = (window.innerWidth) ? window.innerWidth : (document.documentElement && document.documentElement.clientWidth) ? document.documentElement.clientWidth : document.body.offsetWidth;h = (window.innerHeight) ? window.innerHeight : (document.documentElement && document.documentElement.clientHeight) ? document.documentElement.clientHeight : document.body.offsetHeight;}return {w:w,h:h};};jQuery.getScroll = function (e) {if (e) {t = e.scrollTop;l = e.scrollLeft;w = e.scrollWidth;h = e.scrollHeight;} else  {if (document.documentElement && document.documentElement.scrollTop) {t = document.documentElement.scrollTop;l = document.documentElement.scrollLeft;w = document.documentElement.scrollWidth;h = document.documentElement.scrollHeight;} else if (document.body) {t = document.body.scrollTop;l = document.body.scrollLeft;w = document.body.scrollWidth;h = document.body.scrollHeight;}}return { t: t, l: l, w: w, h: h };};jQuery.intval = function (v){v = parseInt(v);return isNaN(v) ? 0 : v;};jQuery.fn.ScrollTo = function(s) {o = jQuery.speed(s);return this.each(function(){new jQuery.fx.ScrollTo(this, o);});};jQuery.fx.ScrollTo = function (e, o){var z = this;z.o = o;z.e = e;z.p = jQuery.getPos(e);z.s = jQuery.getScroll();z.clear = function(){clearInterval(z.timer);z.timer=null};z.t=(new Date).getTime();z.step = function(){var t = (new Date).getTime();var p = (t - z.t) / z.o.duration;if (t >= z.o.duration+z.t) {z.clear();setTimeout(function(){z.scroll(z.p.y, z.p.x)},13);} else {st = ((-Math.cos(p*Math.PI)/2) + 0.5) * (z.p.y-z.s.t) + z.s.t;sl = ((-Math.cos(p*Math.PI)/2) + 0.5) * (z.p.x-z.s.l) + z.s.l;z.scroll(st, sl);}};z.scroll = function (t, l){window.scrollTo(l, t)};z.timer=setInterval(function(){z.step();},13);};