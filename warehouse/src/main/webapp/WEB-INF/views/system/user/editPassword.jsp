<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/includes.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用户修改密码</title>
		<%@ include file="/WEB-INF/views/common/common.jsp" %>
		
	</head>

<body>
	<form:form id="formValidate" commandName="userInfoForm" action="${wsdc}/user/savePassword.do" method="post" enctype="multipart/form-data"  >
	<table id="queryTable" class="table table-condensed">
		<tr>
			<th>输入旧密码</th>
			<td>
				<input type="hidden" id="user_id" name="user_id" value="${user_id}"/>
				<input type="password" id="passWord" name="passWord" class="form-control input-sm" />
			</td>
		</tr>
		<tr>
			<th>输入新密码</th>
			<td>
				<input type="password" id="newPassWord" name="newPassWord" class="form-control input-sm" />
			</td>
		</tr>
		<tr>
			<th>确认新密码</th>
			<td>
				<input type="password" id="confirmPassWord" name="confirmPassWord" class="form-control input-sm" />
			</td>
		</tr>
		<tr>
			<td colspan="2" id="tools">
				<input type="button" class="btn btn-primary btn-xs" value="保存" onclick="formSubmit();">
			</td>
		</tr>
	</table>
	</form:form>
	
	<script type="text/javascript">
			//点击保存按钮，提交表单，然后关闭遮罩
		function formSubmit(){
			if (obj.form()) {
				$.ajax({
					type:"POST",
					url:"${wsdc}/user/checkPassWord.do",
					data:{
						user_id:$("#user_id").val(),
						passWord:$("#passWord").val()
					},
					success:function(data){
						if(data=='true'){
							if($("#newPassWord").val()==$("#confirmPassWord").val()){
								document.getElementById("formValidate").submit();
								window.top.document.getElementById('butclose').click();
							}else{
								alert("两次新密码输入不一致，请重输！")
							}
						}else{
							alert("密码输入错误，请重输！");
						}
					}
				});
			}
		}
			
			var obj = $("#formValidate").validate({	
				rules: {
					passWord:{
						required: true
					},
					newPassWord: {
						required: true	
					},
					confirmPassWord: {
						required: true
					}
				},
				messages: {
					passWord: {
						required: "请输入旧密码"
					},
					newPassWord: {
						required: "请输入新密码"
					},
					confirmPassWord: {
						required: "请输入确认新密码"
					}
				}
			});
 	</script>
</body>
</html>
