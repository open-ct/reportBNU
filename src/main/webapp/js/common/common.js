$(document).ready(function(){
	$(".refreshJcaptchaImg").click(function(){
		var ctx=$("input[name='ctx']").val();
		$("#jcaptchaImg").attr("src",ctx+"/jcaptcha.action");
		return false;
	});
});


