// personal 
$(function(){
		   
	$('#personal_list dt').click(function(){
		var personal = $(this).next();
		if(personal.is(':visible')){
			personal.slideUp('fast');
			$(this).removeClass('current');
		}else{
			personal.slideDown('fast');
			$(this).addClass('current');
		}
	});
	
});