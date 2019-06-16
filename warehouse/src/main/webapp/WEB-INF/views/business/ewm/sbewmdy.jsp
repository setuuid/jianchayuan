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
		margin-top:-7px;
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
		<c:forEach items="${ewmList}" var="sbewm">
			ewmData.push({sb_id:'${sbewm.sb_id}',sb_name:'${sbewm.sb_name}',
				sb_fl:'${sbewm.sb_fl}',sb_xh:'${sbewm.sb_xh}'});
		</c:forEach>
		<c:forEach items="${ewmList}" var="sbewm">
			showData.push({sb_id:'${sbewm.sb_id}',sb_name:'${sbewm.sb_name}',
				sb_fl:'${sbewm.sb_fl}',sb_xh:'${sbewm.sb_xh}',sb_sccs:'${sbewm.sb_sccs}',
				sb_yws:'${sbewm.sb_yws}',sb_yxq:'${sbewm.sb_yxq}',sb_wbdh:'${sbewm.sb_wbdh}'});
		</c:forEach>
	}
	$(function() {
		loadData();
		makeEwm(ewmData,showData);
	})
	
	/*生成二维码*/
	function makeEwm(ewmData,showData) {
		var html = "";
		for(var i=0;i<ewmData.length;i++) {
			html+="<table class='table1'><tr height='5px'></tr><tr class='pmtr'><td class='pmtd' align='center'>品名:"+ewmData[i].sb_name+"-"+ewmData[i].sb_xh+"</td></tr>"
			+"<tr class='ewmtr'><td class='ewmtd' id=qrcode"+i+"></td>"
			+"<td class='qttd'>维保厂商:"+showData[i].sb_yws+"<br/>维保电话:"+showData[i].sb_wbdh+"<br/>维保日期:"+showData[i].sb_yxq+"</td></tr></table>";
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
