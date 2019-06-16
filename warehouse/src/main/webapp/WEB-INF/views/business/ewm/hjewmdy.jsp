<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ctx}/resources/js/qrcode.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/LodopFuncs.js"></script>
<style>
	.table1 {
		width:231px;
		height:147px;
		border:1px solid ;
		margin-top:17px;
	}
	.pmtr {
		width:100%;
		height:10px;
	}
	.pmtd {
		font-size:10px;
		width:100%;
	}
	.ewmtd {
		width:40%;
		height:100px;
	}
	.ewmtr {
		display:block;
		margin-top:10px;
	}
	.qttd {
		font-size:8px;
		width:60%;
		height:60;
	}
</style>
<script type="text/javascript">
	var ewmData = [];//二维码数据
	var showData = [];//显示数据
	/*初始化数据*/
	function loadData() {
		<c:forEach items="${ewmList}" var="hjewm">
			ewmData.push({hj_id:'${hjewm.hj_id}',hj_ckname:'${hjewm.hj_ckname}',
				hj_hjname:'${hjewm.hj_hjname}'});
		</c:forEach>
		
		<c:forEach items="${ewmList}" var="hjewm">
			showData.push({hj_id:'${hjewm.hj_id}',hj_ckname:'${hjewm.hj_ckname}',
				hj_hjname:'${hjewm.hj_hjname}',hj_bm:'${hjewm.hj_bm}'});
		</c:forEach>
	}
	$(function() {
		loadData();
		makeEwm(ewmData,showData);
	})
	
	/*生成二维码*/
	function makeEwm(ewmData) {
		var html = "";
		for(var i=0;i<ewmData.length;i++) {
			html+="<table class='table1'><tr height='5px'></tr>"
			+"<tr class='ewmtr'><td class='ewmtd' id=qrcode"+i+"></td>"
			+"<td class='qttd'>仓库名称:"+showData[i].hj_ckname+"<br/>货架名称:"+showData[i].hj_hjname+"</td></tr></table>";
		}
		$("#dy").append(html);
		for(var j=0;j<ewmData.length;j++) {
    		var result = ewmData[j];
    		result = JSON.stringify(result);
    		var qrcode = getqrcode("qrcode"+j);
    		qrcode.makeCode("["+result+"]");
    	}
	}
	
	/*获取qrcode*/
	function getqrcode(id) {
		var qrcode = new QRCode(document.getElementById(id), {
			width : 80,
			height :80,
			correctLevel:QRCode.CorrectLevel.H
		}); 
		return qrcode;
	}
	
	
</script>
<div id="dy"></div>
