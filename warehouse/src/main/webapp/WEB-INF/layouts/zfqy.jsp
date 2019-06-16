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
<link rel="stylesheet" href="${wsdc}/resources/plugins/bootstrap/css/bootstrap.css"></link>
<link rel="stylesheet" href="${wsdc}/resources/plugins/bootstrap/css/bootstrap-datetimepicker.min.css"></link>

<link rel="stylesheet" href="${wsdc}/resources/plugins/datatables/css/dataTables.bootstrap.css"></link>
<link rel="stylesheet" href="${wsdc}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css"></link>
	<link rel="stylesheet" href="${wsdc}/resources/plugins/datetimepiker/jquery.datetimepicker.css"></link>


<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/jquery/jquery-1.11.3.min.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/jquery/validation/jquery.validate.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/jquery/validation/additional-methods.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/jquery/validation/localization/messages_zh.min.js"></SCRIPT>

<script type="text/javascript"  src="${wsdc}/resources/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"  src="${wsdc}/resources/plugins/datatables/js/dataTables.bootstrap.js"></script>


<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/bootstrap/js/bootstrap.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/bootstrap/js/bootstrap-datetimepicker.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/bootstrap/respond/respond.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/FusionCharts/fusioncharts.charts.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/FusionCharts/fusioncharts.js"></SCRIPT>

	<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/FusionCharts/fusioncharts.powercharts.js"></SCRIPT>

	<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/FusionCharts/fusioncharts.widgets.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/FusionCharts/themes/fusioncharts.theme.carbon.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/FusionCharts/themes/fusioncharts.theme.fint.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/FusionCharts/themes/fusioncharts.theme.ocean.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/FusionCharts/themes/fusioncharts.theme.zune.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/jquery/ajaxfileupload.js"></SCRIPT>


<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/ztree/js/jquery.ztree.all-3.5.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/jquery/jquery.loadTemplate-1.4.5.min.js"></SCRIPT>

<SCRIPT type="text/javascript" src="${wsdc}/resources/scripts/dept/dept.js"></SCRIPT>
	<style>
		table td {word-wrap:break-word;word-break:break-all}
	</style>
<script>
$.extend( $.fn.dataTable.defaults, {
	"info":true,
    "searching": false,
    "ordering": false,
    "stateSave": false,
    "lengthMenu": [[10, 20, 30], [10, 20, 30]],
    "dom": '<"top"l>rt<"bottom"ip><"clear">',
    "pagingType":"full_numbers",
    "language": {
	    "emptyTable":     "没有找到记录",
	    "info":           "显示从第 _START_ 条 到第 _END_ 条记录，共 _TOTAL_ 条记录",
	    "infoEmpty":      "0条数据",
	    "infoFiltered":   "",
	    "infoPostFix":    "",
	    "thousands":      ",",
	    "lengthMenu":     "每页 _MENU_ 数据",
	    "loadingRecords": "加载中，请稍后...",
	    "processing":     "处理中，请稍后...",
	    "search":         "搜索:",
	    "zeroRecords":    "未发现匹配记录",
	    "paginate": {
	        "first":      "首页",
	        "last":       "末页",
	        "next":       "下一页",
	        "previous":   "上一页"
	    }
	}
} );
	$(function(){
		$('.form_date').datetimepicker({
			language:'zh-CN',
			format:'yyyy-mm-dd',
			minView:2,
			autoclose:1
		});
		$('.form_datetime').datetimepicker({
			language:'zh-CN',
			format:'yyyy-mm-dd hh:ii:ss',
			autoclose:1
		});
		 $.validator.addMethod( 
 	            "futureDate", 
 	            function (value, element) { 
 				return new Date() > new Date(Date.parse(value.replace("-", "/"))); 
 	            }, 
 	            "<font color='red'>日期不能是未来日期!</font>" 
 	    );
		 $.validator.addMethod( 
	 	            "pastDate", 
	 	            function (value, element) { 
	 	            	value=value+" 23:59:59";
	 				return new Date() < new Date(Date.parse(value.replace("-", "/"))); 
	 	            }, 
	 	            "<font color='red'>日期不能是过去日期!</font>" 
	 	    );
		 $.validator.addMethod("mobile", function(value, element) {
			 var length = value.length;
			 var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
			 return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/.test(value)) || (tel.test(value));
			 }, "<font color='red'>电话号码格式错误!</font>");
		 
		 $.validator.addMethod(
		            "compareDate", 
		            function (value, element,param) { 
		            	 
		            var startDate = $(param).val(); 
		          
		return new Date(Date.parse(startDate.replace("-", "/"))) <= new Date(Date.parse(value.replace("-", "/"))); 
		            }, 
		            "<font color='red'>结束日期必须大于开始日期</font>" 
		    );
	});
</script>

</head>
<body style="background-color: #fff;padding-top: 5px;padding-left: 5px;font-size: 12px;">
	<tiles:insertAttribute name="body" />
</body>
</html>


