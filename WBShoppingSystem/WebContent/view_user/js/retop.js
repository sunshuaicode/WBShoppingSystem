$(document).ready(function(){
	$('<a href="#" class="retop">返回顶部</a>').appendTo('body').hide().click(function(){
		$(document).scrollTop(0);
		$(this).hide();
		return false
	});
	var $retop = $('.retop');
	function backTopLeft(){
		var btLeft = $(window).width() / 2 + 395;
		if (btLeft >= 0){
			$retop.css({ 'left': $(".wrapper").offset().left+$(".wrapper").width()+15 })
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