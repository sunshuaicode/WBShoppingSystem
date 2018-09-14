// navigation 
function renderMenu(e) {
    var w=0;

	siteWidth = $(".site-nav").width();
	parentOffsetLeft = $('.floor_nav').offset().left;

	$(".floor_nav ul.floors li").each(function(i) {
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
		menu.decorateIframe(); //fix for ie6
		$(this).dropdown({ menu: menu, type: 'simple'});
	});
}

(function($){
$.fn.dropdown = function(opt){
    
    var defaults = {
        speed: 0,
        delay: 50,
        type: 'simple',
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
            case 'simple':
                $(menu).show();
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
                    case 'simple':
                        $(menu).hide();
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
                case 'simple':
                    $(menu).hide();
                }
                $(topLevelAnchor).removeClass("active");
            }
        }, delay);
    }

}
})
(jQuery);
/* decorateIframe */
(function($) {
    $.fn.decorateIframe = function(options) {
        if ($.browser.msie && $.browser.version < 7) {
            var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
            $(this).each(function() {
                var $myThis = $(this);
                //创建一个IFRAME
                var divIframe = $("<iframe />");
                divIframe.attr("id", opts.iframeId);
                divIframe.css("position", "absolute");
                divIframe.css("display", "none");
                divIframe.css("display", "block");
                divIframe.css("z-index", opts.iframeZIndex);
                divIframe.css("border");
                divIframe.css("top", "0");
                divIframe.css("left", "0");
                if (opts.width == 0) {
                    divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                if (opts.height == 0) {
                    divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                divIframe.css("filter", "mask(color=#fff)");
                $myThis.append(divIframe);
            });
        }
    }
    $.fn.decorateIframe.defaults = {
        iframeId: "decorateIframe1",
        iframeZIndex: -1,
        width: 0,
        height: 0
    }
})(jQuery);
// jquery.plugins.hoverintent
(function($){$.fn.hoverIntent=function(f,g){var cfg={sensitivity:7,interval:100,timeout:0};cfg=$.extend(cfg,g?{over:f,out:g}:f);var cX,cY,pX,pY;var track=function(ev){cX=ev.pageX;cY=ev.pageY;};var compare=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);if((Math.abs(pX-cX)+Math.abs(pY-cY))<cfg.sensitivity){$(ob).unbind("mousemove",track);ob.hoverIntent_s=1;return cfg.over.apply(ob,[ev]);}else{pX=cX;pY=cY;ob.hoverIntent_t=setTimeout(function(){compare(ev,ob);},cfg.interval);}};var delay=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);ob.hoverIntent_s=0;return cfg.out.apply(ob,[ev]);};var handleHover=function(e){var p=(e.type=="mouseover"?e.fromElement:e.toElement)||e.relatedTarget;while(p&&p!=this){try{p=p.parentNode;}catch(e){p=this;}}if(p==this){return false;}var ev=jQuery.extend({},e);var ob=this;if(ob.hoverIntent_t){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);}if(e.type=="mouseover"){pX=ev.pageX;pY=ev.pageY;$(ob).bind("mousemove",track);if(ob.hoverIntent_s!=1){ob.hoverIntent_t=setTimeout(function(){compare(ev,ob);},cfg.interval);}}else{$(ob).unbind("mousemove",track);if(ob.hoverIntent_s==1){ob.hoverIntent_t=setTimeout(function(){delay(ev,ob);},cfg.timeout);}}};return this.mouseover(handleHover).mouseout(handleHover);};})(jQuery);
// lazyLoad load 
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

$(document).ready(function(){
	
	// 个人中心列表
	$('.my-mesaer').hover(function(){
		$(this).find("#my-list").show();
		$(this).addClass("hover");
	},function(){
		$(this).find("#my-list").hide();
		$(this).removeClass("hover");	
	});

	// 商品图片边框
	$(".p_img").mouseover(function(){
		$(this).attr("class","p_img_hover");
	}).mouseout(function(){
		$(this).attr("class","p_img");
	});
	
	// 导航 
	renderMenu();
	
	//返回顶部
	$('<a href="#" class="retop">返回顶部</a>').appendTo('body').hide().click(function(){
		$(document).scrollTop(0);
		$(this).hide();
		return false
	});
	var $retop = $('.retop');
	function backTopLeft(){
		var btLeft = $(window).width() / 2 + 395;
		if (btLeft >= 0){
			$retop.css({ 'left': $(".container").offset().left+$(".container").width()+15 })
		}else{
			$retop.css({ 'right': btLeft }) 
		}
	}
	backTopLeft();
	$(window).resize(backTopLeft);
	$(window).scroll(function(){
		if ($(document).scrollTop() === 0){
			$retop.hide()
		}else{
			$retop.show()
		}
		if ($.browser.msie && $.browser.version == 6.0 && $(document).scrollTop() !== 0){
			$retop.css({ 'opacity': 1 })
		} 
	});
	
});