$.fn.Sonny=function(option,callback){
	if(typeof option=="function"){callback=option;option={};};
	var s=$.extend({delay:50,index:0},option||{});
	var _this=this;
	var timer=null;
	$.each(this,function(n){
		$(this).bind("mouseover",function(){
			if(timer!=null)clearTimeout(timer);
			var obj=$(this);
			timer=setTimeout(function(){
				_this.eq(s.index).removeClass(s.current);
				s.index=n;
				_this.eq(s.index).addClass(s.current);
				if (callback){callback(obj);}
			},s.delay);

		})
	})
}
			
$(".rank .tabcon").eq(0).find("li").Sonny({current:"current"},function(object){
	object.find("img").each(function(){
		var src2=$(this).attr("src2");
		$(this).attr("src",src2);
		$(this).removeAttr("src2");
	})
});