<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
						<button onclick="javascript:addFun()">添加</button>
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
			singleSelect : true,
			showHeader : true,
			title : '货架信息列表',
			fitColumns : true,
			method : "post",
			queryParams : {
				draw : 1
			},
			columns : [ [ {
				field : 'ckmcName',
				title : '仓库名称',
				align : 'center',
				width : 100
			},{
				field : 'name',
				title : '货架名称',
				align : 'center',
				width : 100
			},{
				field : 'hjbm',
				title : '货架编号',
				align : 'center',
				width : 100
			},{
				field : 'cjsj',
				title : '创建时间',
				align : 'center',
				width : 100
			}
			,{
				field : 'action',
				title : '操作',
				width : 100,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_ADD"><a class="easyui-linkbutton" href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a></security:authorize>', row.hjxxid);
					str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_DELETE"><a href="javascript:void(0)" onclick="viewFun(\'{0}\');" >查看</a></security:authorize>', row.hjxxid);
					str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_DELETE"><a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a></security:authorize>', row.hjxxid);
					return str;
				}
			} 
			] ]
		})
		var id="#ckmc", code="ckmc";
		findckzd(id,code);
		var id="#ckmc_edit", code="ckmc";
		findckzd(id,code);
	
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
		$("#name").val("");
		$("#hjbm").val("");
		$("#beginDate").datebox("setValue","");
		$("#endDate").datebox("setValue","");
	}
	/*查看*/
	function viewFun(id){
		$.ajax({
			url: "${ctx}/hjxxld/editShow.do?id="+id,
            contentType: "application/json;charset=utf-8",
            datatype: "json",
            type: "POST",
            success: function (data) {
            	var result = data.t;
            	if(null != result.hjbm) {
           			$("#hjbm_view").textbox('setValue',result.hjbm);
           		}
           		if(null != result.name) {
           			$("#name_view").textbox('setValue',result.name);
           		}
           		if(null != result.ckmc) {
           			$("#ckmc_view").textbox('setValue',result.ckmcName);
           		}
           		if(null != result.cjsj) {
           			$("#cjsj_view").textbox('setValue',result.cjsj);
           		}
            }
		});
		$('#dlgshow').dialog('open');
	}
	function closeshow() {
		$('#dlgshow').dialog('close');
	}
	/*编辑*/
	function editFun(id){
		$.ajax({
            url: "${ctx}/hjxxld/editShow.do?id="+id,
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (data) {
            	var result = data.t;
            	if(null != result.hjxxid) {
           			$("#hjxxid").val(result.hjxxid);
           		}
           		if(null != result.name) {
           			$("#name_edit").textbox('setValue',result.name);
           		}
           		if(null != result.ckmc) {
           			$("#ckmc_edit").combobox('setValue',result.ckmc);
           		}
            }
        });
		$('#dlg').dialog('open');
	}
	
	function findckzd(id,code){
		$(id).combobox({
			 url:'${ctx}/dictionary/selectChildsByPcodemini.do?code='+code,
			 valueField:'dictionary_id',
			 textField:'dictionary_name'
		})
	}
	/*添加*/
	function addFun(){
		$("#name_edit").textbox('setValue',"");
		$("#ckmc_edit").textbox('setValue',"");
		$("#hjxxid").val("");
		$('#dlg').dialog('open');
	}
	
	/*关闭模态框*/
	function close(){ 
    	$('#dlg').dialog('close');
    }
	/*保存*/
	function save(){
		var data = new Object();
        data["hjxxid"] = $("#hjxxid").val();
        data["name"] = $("#name_edit").textbox('getValue');
        data["ckmc"] = $("#ckmc_edit").combobox('getValue');
		if(!$("#dlg").form('enableValidation').form('validate')){
        	alert("请输入必填项");
        	preventDefault();
        }
		 $.ajax({
	            url: "${ctx}/hjxxld/save.do",
	            type: "POST",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            data: JSON.stringify(data),
	            success: function (data) {
	                if (data == "0") {
	                	alert("保存成功");
	                	close();
	                	search();
	                } else {
	                    alert("保存失败");               
	                }
	            }
	        });
	}
	/*删除*/
	function deleteFun(id){
		parent.$.messager.confirm('询问', '您是否要删除当前数据？',
			function(b) {
				if (b) {
					progressLoad();
					$.post('${ctx}/hjxxld/deletehjxxld.do', {
						id : id
					}, function(result) {
						parent.$.messager.alert('提示',result.successMessage, 'info');
						search();
						progressClose();
					}, 'JSON');
				}
			});
	}
	/*加载*/
	$(document).ready(function () {
	    search();
	});
	    	
</script>

<!-- 添加编辑模态框 -->
<div id="dlg" class="easyui-dialog" style="width: 300px; height: 300px;" closed="true" buttons="#dlg-buttons" title="货架信息">
	<form action="" id="dlgForm">
		<table style="margin:auto">
			<tr>
				<td>货架名称</td>
				<td>
					<input id="name_edit" name="name" type="text" class="easyui-textbox" data-options="required:true">
					<input type="hidden" id="hjxxid" name="hjxxid" />
				</td>
			</tr>
			<tr>
				<td>仓库名称</td>
				<td>
					<select data-options="required:true,editable:false" class="easyui-combobox"  id="ckmc_edit" name="ckmc" style="width: 150px; height: 20px;">
					</select>
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="dlg-buttons" style="text-align: center;">
	<a href="javascript:save();" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">保存</a> 
	<a href="javascript:close();" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlg').dialog('close');" style="width: 90px">关闭</a>
</div>



<!-- 查看页面 -->
<div id="dlgshow" class="easyui-dialog" style="width: 300px; height: 300px;" closed="true" buttons="#dlgshow-buttons" title="货架信息查看">
	<form action="" id="dlgFormshow">
		<table style="margin:auto">
			<tr>
				<td>货架名称:</td>
				<td><input readonly="readonly"  type="text" id="name_view" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>货架编码:</td>
				<td>
					<input readonly="readonly"  type="text" id="hjbm_view" value="" class="easyui-textbox" />
				</td>
			</tr>
			<tr>
				<td>仓库名称</td>
				<td>
					<input readonly="readonly" type="text" id="ckmc_view" value="" class="easyui-textbox" />
				</td>
			</tr>
			<tr>
				<td>创建时间</td>
				<td>
					<input readonly="readonly" id="cjsj_view"  type="text" class="easyui-textbox" />
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="dlgshow-buttons" style="text-align: center;">
	<a href="javascript:closeshow();" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlgshow').dialog('close');" style="width: 90px">关闭</a>
</div>