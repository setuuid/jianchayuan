<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="wsdc" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>

<head>
	<title>天津市公安局网上督察系统</title>
	<meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

    <!-- Bootstrap -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

	<link rel="stylesheet" href="${wsdc}/resources/styles/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="${wsdc}/resources/styles/bootstrap/index.css">
</head>
<body style="background-color: #CCCCCC">
	<div class="ui-layout-north">
		<div class="navbar navbar-default" >
			<div class="container-fluid">
		    	<div class="navbar-header">
		    		<img class="img-rounded" alt="Brand" src="${wsdc}/resources/images/wsdc.png" >
			    </div>
				<ul class="nav navbar-nav navbar-right" style="margin-right: 100px;">
					<li>
						<a href="#"> 
							<jsp:useBean id="now" class="java.util.Date" /> 
				    		<fmt:formatDate value="${now}" type="date" dateStyle="full"/>  
				    	</a>
				    </li>
					<%-- <li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> <security:authentication property="principal.department.department_name"/></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <security:authentication property="principal.userInfo.realname"/></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> <security:authentication property="principal.userInfo.last_login_ip"/></a></li> --%>
		        	<li class="dropdown">
		          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" onmouseover="myLayout.allowOverflow('north')">
		          			<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 系统 <span class="caret"></span>
		          		</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="${wsdc}/jsp/newindex?menu_id=09" target="_blank" onclick="openMenu('09','')"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 系统管理</a></li>
							<li class="divider"></li>
							<li><a href="${wsdc}/user/editPassword.do" target="_blank"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 修改个人密码</a></li>
							<li class="divider"></li>
							<li class="divider"></li>
							<li><a onClick="top.location.replace('${wsdc}/resources/j_spring_security_logout')"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出系统</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div> 
	</div>

	<div id="center" class="ui-layout-center">
		<%-- <iframe onload="iFrameHeight()" id="mainFrame" name="mainFrame" src="${wsdc}/jsp/welcome.do" width="100%" frameborder="0" scrolling="no"></iframe> --%>
	<iframe id="mainFrame" name="mainFrame" src="${wsdc}/jsp/center" width="100%" height="100%"  frameborder="0" scrolling="yes" ></iframe>
	</div>

	<div class="ui-layout-south" id="collapseExample">
		<div class="navbar-inverse" >
	  		<div class="container">
	    		<div class="row">
	    			<div class="col-md-3">
	    				<ul class="nav navbar-nav">
							<li><a target="mainFrame" onclick="closeWest();"><img src="${wsdc}/resources/images/welcome/Windows-8-Logo.png" alt="..." class="" height="5%" width="10%" > 返回首页</a></li>
						</ul>
	    			</div>
					<div class="col-md-6">
						<p class="text-center" style="color: #fff;margin-top: 5px;">Copyright©2015 天津市公安局 All Rights Reserved</p>
						<p class="text-center" style="color: #fff;margin-top: 5px;">技术支持：天津市康恒信息科技有限公司</p>
					</div>
					<div class="col-md-3"></div>
				</div>
	  		</div>
		</div>
	</div>
	<script src="${wsdc}/resources/scripts/jquery-1.10.1.js" type="text/javascript"></script>
	<script src="${wsdc}/resources/scripts/bootstrap.min.js" type="text/javascript" ></script>
	<script src="${wsdc}/resources/scripts/jquery.layout-latest.js" type="text/javascript" ></script>	
	<script src="${wsdc}/resources/scripts/jquery.ui.all.js" type="text/javascript"></script>
	<script src="${wsdc}/resources/scripts/index.js" type="text/javascript"></script>
	<script src="${wsdc}/resources/scripts/respond.js" type="text/javascript" ></script>
	<script src="${wsdc}/resources/scripts/html5shiv.js" type="text/javascript" ></script>
	<script src="${wsdc}/resources/scripts/json2.js" type="text/javascript" ></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var myLayout =$("body").layout(
					{south_closable:false, north__closable:false,west__closable:false});
		});

		function closeWest(){
			
			window.open("/web","_self");
		}
		function openMenu(menu_id,url){
			if(menu_id=='03'||menu_id=='09'||menu_id=='05'||menu_id=='10'){
			
				$.ajax({
			        type: "POST",
			        url:"${wsdc}/jsp/menu.do?menu_id="+menu_id,
			        async: false,
			        success: function(data) {
			        	//alert(data);
			        	var json = eval("("+data+")");
			        	//alert(json);
			        	var html = '';
						for(var o in json){  
							html += '<li><a href="#' + json[o].cname+ '" class="menu-first" data-toggle="collapse"><span class="' + json[o].icon + '"></span> &nbsp;&nbsp;' +  json[o].cname+'</a>'+
									'<ul id="'+json[o].cname+'" class="nav nav-list collapse menu-second">';
							var jsons = json[o].items;
							for(var oo in jsons){ 
								if(jsons[00].allURL=="Y"){
									html+='<li><a href="'+jsons[oo].url+'" target="mainFrame"><span class="glyphicon glyphicon-chevron-right"></span>&nbsp;'+jsons[oo].cname+'</a></li>';
								}else{
									html+='<li><a href="${wsdc}'+jsons[oo].url+'" target="mainFrame"><span class="glyphicon glyphicon-chevron-right"></span>&nbsp;'+jsons[oo].cname+'</a></li>';
								}
									} 
							html += '</ul></li>';
						} 
						$("#menu").html("");
						$("#menu").append(html);
						
			        }
			    }); 
				myLayout.toggle('west');
				}else{
					window.open(url,"_blank");
			}
			
		}
	</script>
</body>
</html>
