<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<c:set var="wsdc" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
<meta content="IE=edge,Chrome=1" http-equiv="X-UA-Compatible" />

<!-- Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title></title>
 <link href="${wsdc}/resources/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${wsdc}/resources/js/themes1/metro/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${wsdc}/resources/js/themes1/icon.css" />
    <link rel="stylesheet" href="${wsdc}/resources/styles/jquery/jquery.ajax-combobox.css"></link>
    <link rel="stylesheet" href="${wsdc}/resources/styles/zxdc/fyb.css""></link>
        <link rel="stylesheet" href="${wsdc}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css"></link>
    <script type="text/javascript" src="${wsdc}/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${wsdc}/resources/js/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="${wsdc}/resources/js/locale/easyui-lang-zh_CN.js"></script>
<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/jquery/jquery.ajax-combobox.min.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/jquery/ajaxfileupload.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/ztree/js/jquery.ztree.all-3.5.js"></SCRIPT>

<!-- easyui扩展 -->
<script type="text/javascript" src="${wsdc}/resources/js/jquery.edatagrid.js"></script>

<!-- [扩展JS] -->
<script type="text/javascript" src="${wsdc}/resources/js/extJs.js" charset="utf-8"></script>



</head>
<body style="background-color:white;">
	<tiles:insertAttribute name="body" />
</body>
</html>


