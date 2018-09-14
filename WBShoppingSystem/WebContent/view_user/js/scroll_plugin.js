 // Custom sorting plugin
  (function($) {
	$.fn.sorted = function(customOptions) {
		var options = {
			reversed: false,
			by: function(a) { return a.text(); }
		};
		$.extend(options, customOptions);
		$data = $(this);
		arr = $data.get();
		arr.sort(function(a, b) {
			var valA = options.by($(a));
			var valB = options.by($(b));
			if (options.reversed) {
				return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;				
			} else {		
				return (valA < valB) ? -1 : (valA > valB) ? 1 : 0;	
			}
		});
		return $(arr);
	};
  })(jQuery);

  // DOMContentLoaded
  $(function() {
  
	// bind radiobuttons in the form
	var $filterType = $('#filter select[name="type"]');
	var $filterSort = $('#filter select[name="sort"]');
	
	// get the first collection
	var $applications = $('#applications');
	
	// clone applications to get a second collection
	var $data = $applications.clone();

	// attempt to call Quicksand on every form change
	$filterType.add($filterSort).change(function(e) {
		if ($($filterType).val() == 'all') {
			var $filteredData = $data.find('li');
		} else {
			var $filteredData = $data.find('li[data-type=' + $($filterType).val() + ']');
		}
	
	  // if sorted by size
		if ($('#filter select[name="sort"]').val() == "size") {
			var $sortedData = $filteredData.sorted({
				by: function(v) {
					return parseFloat($(v).find('span[data-type=size]').text());
				}
			});
		} else {
		// if sorted by name
			var $sortedData = $filteredData.sorted({
				by: function(v) {
					return $(v).find('strong').text().toLowerCase();
				}
			});
		}   
		
		// finally, call quicksand
	  $applications.quicksand($sortedData, {
		duration: 800,
		easing: 'easeInOutQuad'
	  });

	});
  
  });
//subMenu cookie
jQuery.cookie = function(name, value, options) { 
    if (typeof value != 'undefined') { // name and value given, set cookie 
        options = options || {}; 
        if (value === null) { 
            value = ''; 
            options.expires = -1; 
        } 
        var expires = ''; 
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) { 
            var date; 
            if (typeof options.expires == 'number') { 
                date = new Date(); 
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000)); 
            } else { 
                date = options.expires; 
            } 
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE 
        } 
        var path = options.path ? '; path=' + options.path : ''; 
        var domain = options.domain ? '; domain=' + options.domain : ''; 
        var secure = options.secure ? '; secure' : ''; 
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join(''); 
    } else { // only name given, get cookie 
        var cookieValue = null; 
        if (document.cookie && document.cookie != '') { 
            var cookies = document.cookie.split(';'); 
            for (var i = 0; i < cookies.length; i++) { 
                var cookie = jQuery.trim(cookies[i]); 
                // Does this cookie string begin with the name we want? 
                if (cookie.substring(0, name.length + 1) == (name + '=')) { 
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1)); 
                    break; 
                } 
            } 
        } 
        return cookieValue; 
    } 
};

// subMenu
(function($){
$.fn.extend({
        submenu:function(opt,callback){
				if(this==null)return false;
                //参数初始化
				
                if(!opt) var opt={};
                var _this=$(this);
				var _This=_this.get(0);
				var submenu=this;
				/*参数定义*/
				this.oneSmOnly=opt.oneSmOnly!=null?opt.oneSmOnly:false				//单独拉开收起，如果是true的话，当前菜单只有一个展开项，默认为false
					,this.speed=opt.speed!=null?opt.speed:'300'						//数字越大，速度越慢,默认为300
					,this.expandNum=opt.expandNum!=null?opt.expandNum:1				//设置初始化时菜单展开的项，默认为第一项
					,this.savestatus=opt.savestatus!=null?opt.savestatus:true			//设置是否保存菜单展开状态，默认为保存
					,this.aHeight=24	//菜单项的默认高度
					,isFirst=true;	//是否为第一次加载(没有cookie的情况下)
				_this.addClass("submenu");//增加CSS
				if($.browser.msie && $.browser.version=="6.0"){
					//假如是ie6.0的浏览器,则为第一个菜单加上first-child类,因为ie6下不认first-child
					_this.find("div").eq(0).addClass("first-child");
				}
				if (submenu.savestatus)//如果选择了保存cookie状态，则去读菜单状态
				{
					var menuCookie=null;
					menuCookie=$.cookie("subMenu_" + encodeURIComponent(_This.id)+"_menuStatus");
					if (menuCookie!=null && menuCookie.length>0) {
							var states = menuCookie.split("");
							isFirst=false;
							_this.find("div").each(function(i){
								if (i>states.length)
									return false;
								if (states[i] == "0")
								{
									$(this).addClass("collapsed");
								}
							});
					}
				}else{
					//清空缓存
					$.cookie("subMenu_" + encodeURIComponent(_This.id)+"_menuStatus",null);
				}
				//取得一个A的高度
				_this.find("div > li").eq(0).each(function(){
					submenu.aHeight=this.offsetHeight;
					return false;
				});//取得一个链接的高度
				_this.find("div").each(function(i){	
					var div=$(this);
					if (isFirst && i!=submenu.expandNum-1)//如果是第一次打开菜单，则显示默认展开的项
					{
						div.addClass("collapsed");
					}
					//绑定事件:标题点击时
					$(div).find("h5").eq(0).mouseup(function(e){
						var ParentDiv=$(this).parent();
						if (ParentDiv.attr("class")=="collapsed" || ParentDiv.attr("class")=="first-child collapsed"){//状态为隐藏时
							collapseOthers();//隐藏其它已展开的菜单
							var menuCount=0;//子菜单的数量,这个决定父层要展开多大
							menuCount=ParentDiv.find("a").length;
							ParentDiv.animate({height: ((menuCount * submenu.aHeight)+this.offsetHeight)},submenu.speed);	
							ParentDiv.removeClass("collapsed");
						}else{
							collapseOthers(ParentDiv);
							ParentDiv.animate({height: 30},submenu.speed);
							ParentDiv.addClass("collapsed");
						}
						writeCookie();
					});
				});
				//把除展开的菜单外的其它展开的菜单合上
				collapseOthers = function(me){
					if(submenu.oneSmOnly==false)return;
					_this.find("div").not($(me)).not(".collapsed,first-child collapsed").each(function(){
							$(this).animate({height: 30},submenu.speed);
							$(this).addClass("collapsed");
					})
				};
				//记录菜单状态
				writeCookie = function(){
					//如果要保存cookie的话
					if (submenu.savestatus=="false"){
						//清空缓存
						if($.cookie("subMenu_" + encodeURIComponent(_This.id)+"_menuStatus")!=null)$.cookie("subMenu_" + encodeURIComponent(_This.id)+"_menuStatus",null);
						return;
					}
					var states = new Array();
					_this.find("div").each(function(i){	
						states.push($(this).attr("class")== "collapsed" ? 0 : 1);
					});
					var d = new Date();
					d.setTime(d.getTime() + (30 * 24 * 60 * 60 * 1000));
					$.cookie("subMenu_" + encodeURIComponent(_This.id)+"_menuStatus",states.join(""),{expires: d});
				};
				//展开所有菜单项
				this.expandAll=function(){
					_this.find("div.collapsed").each(function(){
						var menuCount=0;//子菜单的数量,这个决定父层要展开多大
						menuCount=$(this).find("a").length;
						$(this).animate({height: (menuCount*submenu.aHeight)+this.offsetHeight},submenu.speed);	
						$(this).removeClass("collapsed");
					});
				};
				//收起所有菜单项
				this.collapseAll=function(){
					_this.find("div").not(".collapsed").each(function(){
						var menuCount=0;//子菜单的数量,这个决定父层要展开多大
						menuCount=$(this).find("a").length;
						$(this).animate({height: 30},submenu.speed);	
						$(this).addClass("collapsed");
					});
				};
				return this;
        }
})
})(jQuery);

//tiao Mysubmenu
var Mysubmenu=null;
	$(function(){
		Mysubmenu=$("#my_menu").submenu({oneSmOnly:false,speed:500,expandNum:4,savestatus:true});	
	})