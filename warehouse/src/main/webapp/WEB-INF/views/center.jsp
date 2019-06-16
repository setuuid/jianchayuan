<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="wsdc" value="${pageContext.request.contextPath}" />
<security:authentication property="principal.username" var="username"/>
<!DOCTYPE html>
<html>
<head>
<meta content="IE=8" http-equiv="X-UA-Compatible" />
<style>
ul,li,img{margin:0 auto;}
li{ list-style:none;}
ul{ padding:0px;}
*{ font-size:12px; font-family:"宋体"}
a{texe-decoration:none;color:#784100;}

body{ width:auto; background-color:#e7f3ff;}

.xuanzhuan .monolith {
	background: url(${wsdc}/images/welcome/diqiu.png) center center;
padding-left:230px;padding-top:150px; background-repeat:no-repeat; width:352px; height:350px; }
.content_right{padding-left:200px; }

.a {
	background-image: url(${wsdc}/images/welcome/9601111.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
	width: 200px;
	height: 80px;
}

a.a:hover {
	cursor:pointer;
	background-image: url(${wsdc}/images/welcome/960111.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;

	background-repeat: no-repeat;
}

.a1 {
	background-image: url(${wsdc}/images/welcome/jwpy1.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;

	background-repeat: no-repeat;
}

a.a1:hover {
	cursor:pointer;
	background-image: url(${wsdc}/images/welcome/jwpy.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;

	background-repeat: no-repeat;
}

.a2 {
	background-image: url(${wsdc}/images/welcome/zhyy1.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

a.a2:hover {
	cursor:pointer;
	background-image: url(${wsdc}/images/welcome/zhyy.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

.a3 {
	background-image: url(${wsdc}/images/welcome/spdc1.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

a.a3:hover {
	cursor:pointer;
	background-image: url(${wsdc}/images/welcome/spdc.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

.a4 {
	background-image: url(${wsdc}/images/welcome/wxdw1.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

a.a4:hover {
	cursor:pointer;
	background-image: url(${wsdc}/images/welcome/wxdw.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

.a5 {
	background-image: url(${wsdc}/images/welcome/zfyw1.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

a.a5:hover {
	cursor:pointer;
	background-image: url(${wsdc}/images/welcome/zfyw.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

.a6 {
	background-image: url(${wsdc}/images/welcome/yydc1.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

a.a6:hover {
    cursor:pointer;
	background-image: url(${wsdc}/images/welcome/yydc.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

.a7 {
	background-image: url(${wsdc}/images/welcome/ksh1.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

a.a7:hover {
    cursor:pointer;
	background-image: url(${wsdc}/images/welcome/ksh.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}
.a8 {
	background-image: url(${wsdc}/images/welcome/qy.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

a.a8:hover {
	cursor:pointer;
	background-image: url(${wsdc}/images/welcome/qy1.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}
.a9 {
	background-image: url(${wsdc}/images/welcome/jf.png);
	width: 250px;
	height: 80px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}

a.a9:hover {
	cursor:pointer;
	background-image: url(${wsdc}/images/welcome/jf1.png);
	width: 160px;
	height: 60px;
	background-position: center;
	padding: 30px;
	background-repeat: no-repeat;
}
.box{ width:1915px; position:relative;height:800px}

.img img{ position:absolute;bottom:0;left:0}
.bj{ background:url(${wsdc}/images/welcome/bj.png) left center no-repeat; height:874px;}
.logo1{ background:url(${wsdc}/images/welcome/logo.png) right center no-repeat; height:540px;  }
</style>
<link href="${wsdc}/resources/styles/welcome/lanrenzhijia.css"
	rel="stylesheet" />
<script src="${wsdc}/resources/scripts/jquery/jquery.js"></script>
<script src="${wsdc}/resources/scripts/welcome/lanrenzhijia.js"></script>
<c:if test="${empty dq}">
<script type="text/javascript">
$(document).ready(function() {
	$('.xuanzhuan').roundabout({
		minZ : 100,
		maxZ : 200,
		minOpacity : 1,
		minScale : 0.6,
		childSelector : '.mover',
		tilt : -4,
		autoplay : true, //自动旋转
		autoplayDuration : 1000, //旋转速度 建议1000
		autoplayPauseOnHover : true
	//鼠标悬停 自动旋转静止
	});
});

</script>
</c:if>

<meta charset="utf-8">
<title>首页</title>
</head>

<body>
<!-- 	<img alt="" src="${wsdc}/images/welcome/logo.png"
		style="position: fixed; left: 10px;" width="400px;">
	<img alt="" src="${wsdc}/images/welcome/jc.png"
		style="position: fixed; right: -10px; bottom: 0px"> -->
		
	<div class="box">	
	<div class="bj">
    <div class="img"><img src="${wsdc}/images/welcome/jc.png"></div>
    
    <div >
		<div class="content_right">
		<c:if test="${empty dq}">
			<ul class="xuanzhuan" id="nav-list-example">
				<li class="monolith"></li>
				<a class="mover a"  onclick="openParentMenu('08','${url.isAccess960111() == true ? url.url96011 : "NoPermission"}');"></a>
				<a class="mover a1" onclick="openParentMenu('05','${url.isAccessJWPY() == true ? url.urljwpy : "NoPermission"}');"></a>
				<a class="mover a2" onclick="openParentMenu('06','${url.isAccessZHYW() == true ? url.urlzhyw : "NoPermission"}');"></a>
				<a class="mover a3" onclick="openParentMenu('01','${url.isAccessSPDC() == true ? url.urlspdc : "NoPermission"}');"></a>
				<a class="mover a4" onclick="openParentMenu('04','${url.isAccessWXDC() == true ? url.urlwxdc : "NoPermission"}');"></a>
				<a class="mover a5" onclick="openParentMenu('03','${url.isAccessZFYW() == true ? url.urlzfyw : "NoPermission"}');"></a>
				<a class="mover a6" onclick="openParentMenu('02','${url.isAccessYYDC() == true ? url.urlyydc : "NoPermission"}');"></a>
				<a class="mover a7" onclick="openParentMenu('07','${url.isAccessKSH() == true ? url.urlksh : "NoPermission"}');"></a>
				<a class="mover a8" onclick="openParentMenu('10','${url.isAccessZFQY() == true ? url.urlzfqy : "NoPermission"}');"></a>
				<a class="mover a9" onclick="openParentMenu('09','${url.isAccessJFW() == true ? url.urljfw : "NoPermission"}');"></a>
			</ul>
			</c:if>
		</div>
		</div>
</div>
</div>
</body>
</html>
<script>

	
	//根据浏览器的大小而变�?
	$(window).load(function() {
		if(window.screen.height == 768){
			window.scrollTo(400,100);
		}
		//alert(document.body.scrollWidth);
		//alert(window.screen.width);
	});
	function openParentMenu(menu_id,url) {
		if(url == "NoPermission"){
			alert("您没有权限，如有需要请联系管理员！");
			return ;
		}

		if (menu_id == '03') {
			window.open("${wsdc}/jsp/newindex?menu_id="+menu_id,"_blank")


		} else if(menu_id=='05'){
			window.open("${wsdc}/jsp/newindex?menu_id="+menu_id,"_blank")

		}
		else if(menu_id=='06'){
			window.open("${wsdc}/jsp/newindex?menu_id="+menu_id,"_blank")

		}
		else if(menu_id=='04'){
			/* window.open("http://10.88.7.203/pgis/idcardLogin.action?loginType=ducha&idCard=${uc}","_blank") */
			window.open("http://10.88.24.231:7000/PPIS/templates/autoLogin.html?username=${username}&password=1111&type=3","_blank")

		}
		else if(menu_id=='07'){
			new ActiveXObject("Wscript.Shell").run("C:\\jwt\\jwt.exe");

		}
		else if(menu_id=='10'){
			window.open("${wsdc}/jsp/newindex?menu_id="+menu_id,"_blank")

		}
		else if(menu_id=='02'){
			window.open("http://10.88.24.231:7000/PPIS/templates/autoLogin.html?username=${username}&password=1111&type=2","_blank")

		}
		else if(menu_id=='01'){
			window.open("http://10.88.24.231:7000/PPIS/templates/autoLogin.html?username=${username}&password=1111&type=1","_blank")

		}else if(menu_id=='09'){
			window.open("http://10.88.153.152/login!platformLogin.action?username=ducha&password=827CCB0EEA8A706C4C34A16891F84E7B&type=0","_blank")

		}
		else {
			window.open("${wsdc}/jsp/newindex?menu_id="+menu_id,"_blank")
		
		}
	}
</script>
