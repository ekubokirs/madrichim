$(function(){
	$('.ma_paradd').click(function(){
		console.log("working")
			var html = $('.ma_par').first().clone();
	 			html.css('display','none');
	 		$(this).before(html);
	 			html.slideDown(600);
				html.find('input').val('');
			return false;
		});
})