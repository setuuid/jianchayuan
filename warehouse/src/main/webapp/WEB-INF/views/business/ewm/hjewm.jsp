<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ctx}/resources/js/LodopFuncs.js"></script>
<div id="tt" class="easyui-tabs" style="width: 100%;">
	<div title="货架信息" style="padding: 20px; display: none;">
		<table id="jyss" border="1" bordercolor="#8DB2E3" title="信息查询" style="border-collapse: collapse; width: 100%;">
			<tr>
				<td style="text-align: center; background-color: #f2f2f2;">仓库名称:</td>
				<td>
					<select class="easyui-combobox"  id="ckmc" name="ckmc" style="width: 150px; height: 20px;">
					</select>
				</td>
				<td style="text-align: center; background-color: #f2f2f2;">货架名称:</td>
				<td><input name=name id="name" /></td>
			</tr>
			<tr>
				<td style="text-align: center; background-color: #f2f2f2;">货架编号:</td>
				<td><input name=hjbm id="hjbm" /></td>
				<td style="text-align: center; background-color: #f2f2f2;">创建时间:</td>
				<td>
					<input data-options="editable:false" name="beginDate" id="beginDate" class="easyui-datebox"  style="width:150px" /> 至
					<input data-options="editable:false" name="endDate" id="endDate" class="easyui-datebox" style="width:150px" /> 
				</td>
			</tr>

		</table>
		
		<table style="float: right;">
			<tr>
				<td>
					<button onclick="javascript:search()">查询</button>
					<button onclick="javascript:clearFl()">清空</button>
				</td>
			</tr>
		</table>
		<table style="float: left;">
			<tr>
				<td>
					<button onclick="javascript:makeEwm()">生成二维码</button>
				</td>
			</tr>
		</table>
		<!-- 查询table -->
		<table id="dg" style="border-collapse: collapse; width: 100%;"></table>
	</div>
</div>

<script type="text/javascript">
	/*列表*/
	$(function() {
		
		$('#dg').datagrid({
			pageNumber : 0,
			pagination : true,
			rownumbers : true,
			singleSelect : false,
			showHeader : true,
			title : '货架信息列表',
			fitColumns : true,
			method : "post",
			queryParams : {
				draw : 1
			},
			sortable : true,
			columns : [ [ {
				field : 'ckmcName',
				title : '仓库名称',
				sortable : true,
				align : 'center',
				width : 100,
				checkbox:true,
			},{
				field : 'name',
				title : '货架名称',
				sortable : true,
				align : 'center',
				width : 100
			},{
				field : 'hjbm',
				title : '货架编号',
				sortable : true,
				align : 'center',
				width : 100
			},{
				field : 'cjsj',
				title : '创建时间',
				sortable : true,
				align : 'center',
				width : 100
			}
			,{
				field : 'action',
				title : '',
				width : 100
			} 
			] ]
		})
	});
	
	/*列表查询*/
	function search() {
		//pageNumber为datagrid的当前页码  
		var page_Number = $('#dg').datagrid('options').pageNumber;
		//pageSize为datagrid的每页记录条数  
		var page_Size = $('#dg').datagrid('options').pageSize;
		$('#dg').datagrid('options').url = "${ctx}/hjxxld/queryList.do", 
		$('#dg').datagrid(
				'load', {
					ckmc: $("#ckmc").combobox("getValue"),
					name: $("#name").val(),
					hjbm: $("#hjbm").val(),
					beginDate:$("#beginDate").datebox("getValue"),
					endDate:$("#endDate").datebox("getValue"),
					draw: 1,
					page: page_Number,
					rows: page_Size
				});
	}
	/*清空*/
	function clearFl() {
		$("#ckmc").combobox("setValue","");
		$("#hjname").val("");
		$("#hjbm").val("");
		$("#beginDate").datebox("setValue","");
		$("#endDate").datebox("setValue","");
	}
	/*查询仓库*/
	function findckzd(id,code){
		$(id).combobox({
			 url:'${ctx}/dictionary/selectChildsByPcodemini.do?code='+code,
			 valueField:'dictionary_id',
			 textField:'dictionary_name'
		})
	}
	
	/*二维码生成*/
	function makeEwm() {
		var rows = $('#dg').datagrid('getSelections');
		var hjids = "";
		if(rows <= 0) {
			alert("请选择数据！");
			return false;
		}
		for(var i=0;i<rows.length;i++) {
			hjids+=rows[i].hjxxid+",";
		}
		hjids = hjids.substring(0,hjids.length-1);
		//window.open("jsonHj.do?hjids="+hjids);
		LODOP=getLodop(); 
		LODOP.ADD_PRINT_URL('10%',0,'100%','100%',"jsonHj.do?hjids="+hjids);//最后的参数就是你要传到后台的路径
		LODOP.PREVIEW();
	}
	/*加载*/
	$(document).ready(function () {
		findckzd("#ckmc","ckmc");
	    search();
	});
	    	
</script>
