$(document).ready(function(){ 
	if(window.parent.length>0){ 
        window.parent.location="${wsdc}/login.jsp"; 
    }
}); 
$("#username").blur(function(){
	if($("#username").val()==""){
		$("#fg_username").attr("class", "form-group has-error has-feedback");
		$("#alert_username").css('display','block'); 
	}else{
		$("#fg_username").attr("class", "form-group has-success has-feedback");
		$("#alert_username").css('display','none'); 
	}
});
$("#password").blur(function(){
	if($("#password").val()==""){
		$("#fg_password").attr("class", "form-group has-error has-feedback");
		$("#alert_password").css('display','block'); 
	}else{
		$("#fg_password").attr("class", "form-group has-success has-feedback");
		$("#alert_password").css('display','none'); 
	}
});
$("#checkLogin").click(function(){
	if($("#username").val()==""||$("#password").val()==""){
		return false;
	}
	$('#login').submit();
});