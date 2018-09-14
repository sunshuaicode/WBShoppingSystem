// personal left meun
$("#personal_list .item_t").bind("click",function(){
	var element=$(this).parent();
	if (element.hasClass("current")){
		element.removeClass("current");
	}else{
		element.addClass("current");
	}
});