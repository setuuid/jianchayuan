<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="wsdc" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${wsdc}/resources/js/LodopFuncs.js"></script>
<div id="tt" class="easyui-tabs" style="width: 100%;">
	<div title="设备管理二维码查询" style="padding: 20px; display: none;">
		<table id="jyss" border="1" bordercolor="#8DB2E3" title="信息查询" style="border-collapse: collapse; width: 100%;">
			<tr>
				<td style="text-align: right; background-color: #f2f2f2;">品名:</td>
				<td><input name="pm" id="pm" class="easyui-textbox" style="width:150px; height: 20px;"/></td>
				<td style="text-align:right;background-color:#f2f2f2">到货日期:</td>
					<td colspan="4">
					<input name="beginDate" id="beginDate" data-options="editable:false"
							class="easyui-datebox"  style="width:150px" /> 至
						<input name="endDate" id="endDate" data-options="editable:false"
							class="easyui-datebox" style="width:150px" /> 
					</td>
			</tr>
			<tr>
				<td style="text-align:right;background-color:#f2f2f2">一级分类:</td>
				<td><select class="easyui-combobox" id="yjfl" name="yjfl" style="width: 150px; height: 20px;"></select></td>
				<td style="text-align:right;background-color:#f2f2f2">二级分类:</td>
				<td><select data-options="editable:false" class="easyui-combobox" id="ejfl" name="ejfl" style="width: 150px; height: 20px;"></select></td>
				<td style="text-align:right;background-color:#f2f2f2">三级分类:</td>
				<td><select data-options="editable:false" class="easyui-combobox" id="sjfl" name="sjfl" style="width: 150px; height: 20px;"></select></td>
			</tr>
		</table>
		
		<table style="float: right;">
			<tr>
					<td>
						<button onclick="javascript:search()">查询</button>
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
		<table id="dg" style="border-collapse: collapse; width: 100%;">
		</table>
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
			title : '设备管理列表',
			fitColumns : true,
			method : "post",
			queryParams : {
				draw : 1
			},
			columns : [ [ {
				width : '150',
				title : '品名',
				field : 'pm',
				checkbox:true
			} , {
				width : '100',
				title : '到货日期',
				field : 'dhrq'
			} , {
				width : '150',
				title : '一级分类',
				field : 'yjfl'
			} , {
				width : '150',
				title : '二级分类',
				field : 'ejfl'
			}, {
				width : '150',
				title : '三级分类',
				field : 'sjfl'
			}, {
				width : '200',
				title : '生产厂商',
				field : 'sccs'
			}, {
				width : '100',
				title : '生产日期',
				field : 'scrq'
			}, {
				width : '200',
				title : '运维商',
				field : 'yws'
			}, {
				width : '100',
				title : '维保有效期',
				field : 'yxq'
			},{
				field : 'action',
				title : '',
				width : 120
				
			} ] ]
		})
	});
	
	/*列表查询*/
	function search() {
		//pageNumber为datagrid的当前页码  
		var page_Number = $('#dg').datagrid('options').pageNumber;
		//pageSize为datagrid的每页记录条数  
		var page_Size = $('#dg').datagrid('options').pageSize;
		var yjfl = $("#yjfl").combobox('getValue');
		var ejfl = $("#ejfl").combobox('getValue');
		var sjfl = $("#sjfl").combobox('getValue');
		$('#dg').datagrid('options').url = "${wsdc}/sbb/listpage.do", 
		$('#dg').datagrid(
				'load', {
					yjfl :yjfl,
					ejfl :ejfl,
					sjfl :sjfl,
					pm : $("#pm").val(),
					beginDate : $("#beginDate").datebox("getValue"),
					endDate : $("#endDate").datebox("getValue"),
					draw : 1,
					page : page_Number,
					rows : page_Size
				});
	}
	
	function selectFl() {
		initYjfl("jcss");
	}
	
	/*一级分类*/
	function initYjfl(code) {
		$("#yjfl").combobox({
			 url:'${wsdc}/dictionary/selectChildsByPcodemini.do?code='+code,
			 valueField:'dictionary_id',
			 textField:'dictionary_name',
			 editable:false,
			 onChange:function(nv,ov){
				 initEjfl(nv);
				 if(nv != ov) {
					 $("#ejfl").combobox("clear");
					 $("#sjfl").combobox("clear");
				 }
			 }
		})
		
		$("#yjflg").combobox({
			 url:'${wsdc}/dictionary/selectChildsByPcodemini.do?code='+code,
			 valueField:'dictionary_id',
			 textField:'dictionary_name',
			 editable:false,
			 onChange:function(nv,ov){
				 var lx=$("#yjflg").combobox("getText");
				 if(lx=="设备资产"){
					 $("#lx").val("1");
				 }else{
					 $("#lx").val("2");
				 }
				 initEjfl(nv);
				 if(nv != ov) {
					 $("#ejflg").combobox("clear");
					 $("#sjflg").combobox("clear");
				 }
			 }
		})
	}
	/*二级分类*/
	function initEjfl(id) {
		$("#ejfl").combobox({
			 url:'${wsdc}/dictionary/selectChildsByPid.do?id='+id,
			 valueField:'dictionary_id',
			 textField:'dictionary_name',
			 editable:false,
			 onChange:function(nv,ov){
				 initSjfl(nv);
				 if(nv != ov) {
					 $("#sjfl").combobox("clear");
				 }
			 }
		})
		
		$("#ejflg").combobox({
			 url:'${wsdc}/dictionary/selectChildsByPid.do?id='+id,
			 valueField:'dictionary_id',
			 textField:'dictionary_name',
			 editable:false,
			 onChange:function(nv,ov){
				 initSjfl(nv);
				 if(nv != ov) {
					 $("#sjflg").combobox("clear");
				 }
			 }
		})

	}
	/*三级分类*/
	function initSjfl(id) {
		$("#sjfl").combobox({
			 url:'${wsdc}/dictionary/selectChildsByPid.do?id='+id,
			 valueField:'dictionary_id',
			 textField:'dictionary_name',
			 editable:false
		})
		
		$("#sjflg").combobox({
			 url:'${wsdc}/dictionary/selectChildsByPid.do?id='+id,
			 valueField:'dictionary_id',
			 textField:'dictionary_name',
			 editable:false
		})
	}
	


	/*加载*/
	$(document).ready(function () {
	    search();
	    selectFl("jcss");
	});
	
</script>

<script>
	/*打印*/
	function dy() {
		LODOP=getLodop(); 
		LODOP.ADD_PRINT_URL('10%',0,'100%','100%',"${ctx}/ewm/jsonSb.do?sbids=hc0002");//最后的参数就是你要传到后台的路径
		LODOP.PREVIEW();
	}

	/*二维码生成*/
	function makeEwm() {
		var rows = $('#dg').datagrid('getSelections');
		var sbids = "";
		if(rows <= 0) {
			alert("请选择数据！");
			preventDefault();
		}
		for(var i=0;i<rows.length;i++) {
			sbids+=rows[i].sbid+",";
		}
		sbids = sbids.substring(0,sbids.length-1);
		//window.open("jsonSb.do?sbids="+sbids);
		LODOP=getLodop(); 
		LODOP.ADD_PRINT_URL('10%',0,'100%','100%',"jsonSb.do?sbids="+sbids);//最后的参数就是你要传到后台的路径
		LODOP.PREVIEW();
	}
</script>
