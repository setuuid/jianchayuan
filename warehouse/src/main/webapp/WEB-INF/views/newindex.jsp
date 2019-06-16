
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="wsdc" value="${pageContext.request.contextPath}"/>
<security:authentication property="principal.user_id" var="user_id"/>
<security:authentication property="principal.username" var="username"/>
<security:authentication property="principal.department.department_id" var="deptid"/>
<security:authentication property="principal.authorities" var="authorities"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
<meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
    
    <title>天津市检察院仓库管理系统</title>
    <link href="${wsdc}/resources/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${wsdc}/resources/js/themes1/metro/easyui.css" />
  	<link rel="stylesheet" type="text/css" href="${wsdc}/resources/js/themes1/icon.css" />
  	<link rel="stylesheet" href="${wsdc}/styles/lightmvc.css" type="text/css"/>
  	<link href="${wsdc}/resources/css/default.css" rel="stylesheet" type="text/css" />
    
  	<script type="text/javascript" src="${wsdc}/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${wsdc}/resources/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${wsdc}/resources/js/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${wsdc}/resources/plugins/jquery/jquery.ajax-combobox.min.js"></script>
	<script type="text/javascript" src="${wsdc}/resources/plugins/ztree/js/jquery.ztree.all-3.5.js"></script>
	<!-- [扩展JS] -->
	<script type="text/javascript" src="${wsdc}/resources/js/extJs.js" charset="utf-8"></script>

<style>
.menu-fisrt {
	background: #ccc;
}


</style>
<script >
	/*菜单加载*/
	var index_layout;
	var index_tabs;
	var index_tabsMenu;
	var layout_west_tree;
	var layout_west_tree_url = '';
	layout_west_tree_url = '${wsdc}/jsp/selectMenu';
	
	$(function() {
		layout_west_tree = $('#layout_west_tree').tree({
			url : layout_west_tree_url,
			parentField : 'pid',
			idField : 'id',
			lines : true,
			onLoadSuccess:function(node) {
			},
			 onClick : function(node) {
				 if(node.pid == 0) {
					 preventDefault();
				 }
				if (node.attributes && node.attributes.url) {
					var url = '${wsdc}' + node.attributes.url;
					addTab({
						url : url,
						title : node.text,
						iconCls : node.iconCls
					});
				}
			} 
		});
		function addTab(params) {
			console.dir(params);
			window.open(params.url,"mainFrame");
		}
	});
	function logout(){
		window.location.replace('${wsdc}/resources/j_spring_security_logout')
	}
</script>
</head>

<body class="easyui-layout">
	
	<div region="north"  split="true" border="false" style="overflow: hidden; background:url(../images/login/header.jpg);height: 65px;">
    </div>
    <div region="west" split="true" title="资源菜单"  style="width:190px;font-size:16px;" id="west">
		<div class="well well-small" style="padding: 5px 5px 5px 5px;">
			<ul id="layout_west_tree"></ul>
		</div>
	</div>
    <div id="mainPanle" region="center"   style="background: #eee; overflow-y:hidden;" title="欢迎您，${username} &nbsp;&nbsp;<a href='javascript:logout();'>登出</a>">
       <iframe name="mainFrame" scrolling="auto" frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
    </div>
   <!--  <div region="east" id="east" data-options="region:'east',split:true,hidden:true,collapsed:true" title="East" style="width:320px;" >
		<iframe name="selectType" scrolling="auto" frameborder="0"  src='' style="width:100%;height:100%;">
			<table id="treeGrid" ></table>
		</iframe>
	</div> -->
</body>
</html>