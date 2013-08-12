$(function(){
	$("#ma_type_button").on("click", function(evt){
		if($(this).hasClass("formHidden")){
			$("#ma_teen_reg_form").show();
			$("#ma_teacher_reg_form").hide();

			$(this).html("Click Here for Teacher");
			$(this).removeClass("passwordHidden");
		}
		else{
			$("#ma_teen_reg_form").hide();
			$("#ma_teacher_reg_form").show();

			$(this).html("Click Here for Madrich/a");
			$(this).addClass("formHidden");
		}
	})
	return false;
})