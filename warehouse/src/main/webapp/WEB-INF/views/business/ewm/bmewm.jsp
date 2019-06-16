<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ctx}/resources/js/qrcode.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/LodopFuncs.js"></script>
<html>
	<head>
		<script type="text/javascript">
	var treeGrid;
	$(function() {
		treeGrid = $('#treeGrid').treegrid({
			url : '${ctx}/department/treeGrids.do',
			idField : 'id',
			treeField : 'name',
			iconCls : 'icon-ok',
			animate : true,
			collapsible: true,
			fitColumns : true,
			pagination : true, //分页属性
			rownumbers : true,
			pageNumber : 1,
			autoRowHeight : true,
			singleSelect : false,
			queryParams : {
				draw : 1,
				department_name : '',
				type : "0",
				
			},
			method : "post",
			onLoadSuccess: function () {
				 delete $(this).treegrid('options').queryParams['id'];  
			},
			onBeforeLoad : function(row,param) {
				if(row) {
					param.id = row.id;
					$('#treeGrid').treegrid('options').url = "${ctx}/department/selectChilds.do"
				} else {
					param.id = '0';
					$('#treeGrid').treegrid('options').url = "${ctx}/department/treeGrids.do"
				}
				
			},
			frozenColumns : [ [ {
				title : '',
				field : '',
				width : 150,
				checkbox:true
			},{
				title : '部门名称',
				field : 'name',
				width : 150
			} ] ],
			columns : [ [ {
				field : 'id',
				title : 'id',
				width : 100,
				hidden: true
			},{
				field : 'department_code',
				title : '部门编号',
				width : 150,
			}, {
				field : 'department_order',
				title : '排序',
				width : 150,
			},{
				field : 'pid',
				title : '父级',
				width : 100,
				hidden: true
			},{
				field : 'action',
				title : '操作',
				width : 80,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_DEP_ADD"><a class="easyui-linkbutton" href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a></security:authorize>', row.id);
					str += '&nbsp;&nbsp; &nbsp;&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_DEP_DELETE"><a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a></security:authorize>', row.id);
					return str;
				}
			} ] ],
			toolbar : '#toolbar'
		});
		
	});
	
</script>
	</head>
	<body>
	<!-- 树形列表 -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center',border:false"  style="overflow: hidden;">
			<table  id="treeGrid" style="height: 500px;"></table>
		</div>
		<div id="toolbar" style="display: none;">
			<button onclick="javascript:makeEwm()">生成二维码</button>
		</div>
	</div>
</body>
</html> 

<script>
	/*二维码生成*/
	function makeEwm() {
		var rows = $('#treeGrid').datagrid('getSelections');
		var bmids = "";
		if(rows <= 0) {
			alert("请选择数据！");
			return false;
		}
		for(var i=0;i<rows.length;i++) {
			bmids+=rows[i].department_id+",";
		}
		bmids = bmids.substring(0,bmids.length-1);
		LODOP=getLodop(); 
		LODOP.ADD_PRINT_URL('10%',0,'100%','100%',"jsonBm.do?bmids="+bmids);//最后的参数就是你要传到后台的路径
		LODOP.PREVIEW();
	}
</script>


