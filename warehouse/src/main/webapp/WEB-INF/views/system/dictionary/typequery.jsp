<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="wsdc" value="${pageContext.request.contextPath}" />

<html>
	<head>
	<script type="text/javascript">
	var id=${id};
	 $(function() {
		 $('#dg').datagrid({
			pageNumber : 0,
			pagination : true,
			rownumbers : true,
			singleSelect : true,
			showHeader : true,
			title : '类型列表',
			fitColumns : true,
			method : "post",
			queryParams : {
				draw : 1
			},
			sortable : false,
			columns : [ [ {
				field : 'dictionary_id',
				title : 'id',
				sortable : false,
				align : 'left',
				width : 100,
				hidden: true
			} ,{
				field : 'dictionary_code',
				title : '类型编号',
				sortable : false,
				align : 'left',
				width : 80
			}, {
				field : 'dictionary_name',
				title : '类型名称',
				sortable : false,
				align : 'left',
				width : 100,
			}, {
				field : 'dictionary_order',
				title : '排序',
				sortable : false,
				align : 'left',
				width : 100,
				hidden: true
			}, {
				field : 'parent_id',
				title : '父级',
				sortable : false,
				align : 'left',
				width : 100,
				hidden: true
			}, {
				field : 'action',
				title : '操作',
				width : 80,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_DIC_DELETE"><a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a></security:authorize>', row.dictionary_id);
					return str;
				}
			} ] ]
		})
	});
	
		
		//列表查询 加载
		$(document).ready(function () {
		    search();
		});
		
		//列表查询
	 	function search() {
				//pageNumber为datagrid的当前页码  
				var page_Number = $('#dg').datagrid('options').pageNumber;
				//pageSize为datagrid的每页记录条数  
				var page_Size = $('#dg').datagrid('options').pageSize;
				$('#dg').datagrid('options').url = '${wsdc}/dictionary/queryNode.do?id='+id, 
				$('#dg').datagrid(
						'load', {
							dictionary_name : $("#dictionary_name").val(),
							dictionary_code : $("#dictionary_code").val(),
							draw : 1,
							page : page_Number,
							rows : page_Size
						});
				}
	 
			/*删除*/
			function deleteFun(id) {
				parent.$.messager.confirm('询问', '您是否要删除当前角色？',
						function(b) {
							if (b) {
								progressLoad();
								$.post('${wsdc}/dictionary/deleteDictionary.do', {
									id : id
								}, function(result) {
									parent.$.messager.alert('提示',result.successMessage, 'info');
									search();
									progressClose();
								}, 'JSON');
							}
						});
			}
			
			/* /*打开模态框*/
			function addFun() {
				$("#dictionary_id").val('');
				$("#dictionary_code").val('');
				$("#dictionary_order").val('');
				$("#parent_id").val('');
				$('#pid').combotree('clear');
				//$('#dlg').dialog('open');
				$('#dlg').window('open');
			}
			//关闭模态框
			function close(){ 
		    	$('#dlg').dialog('close');
		    } 
	
			/*添加*/
			function save() {
				var data = new Object();
				 data["dictionary_code"] = $("#dictionary_code").val();
			        data["dictionary_name"] = $("#dictionary_name").val();
			        data["dictionary_id"] = $("#dictionary_id").val();
			        data["parent_id"] = id;
		         $.ajax({
		            url: "${wsdc}/dictionary/editDictionary.do",
		            type: "POST",
		            contentType: "application/json;charset=utf-8",
		            dataType: "json",
		            data: JSON.stringify(data),
		            success: function (data) {
		                if (data.success == true) {
		                	alert(data.successMessage);
		                	close();
		                	search();
		                } else {
		                    	alert("失败");               
		                    }
		            }
		        });
			}
	
	
			 function editFun() {
					//1.获得被选中的行
						var rows = $('#dg').datagrid('getSelections');
						 if(rows.length!=1){
							//提示请选择一行
							parent.$.messager.alert('提示','请选择一行!','error');  
							return ;
						} 
						//2.将行的内容回显到窗口表单中'
						$('#dlg').form('load',rows[0])
						$("#dictionary_id").val(rows[0]["dictionary_id"]);
						//3.显示窗口
						 $('#dlg').window('open');  
					}
			// $("#dlg").
			 
			 //$.fn.panel.defaults.
</script>
	</head>
	<body>
	

	<!-- 树形列表 -->
	<div id="tt" class="easyui-tabs" style="width: 100%;">
	<div title="类型查询"  style="width: 100%;" >
		<table style="float: left;">
			<tr>
				<td>
						<button onclick="javascript:addFun()">类型录入</button>
					</td>
				<td>
					<button onclick="javascript:editFun()">类型修改</button>
				</td>
			</tr>
		</table>
		<table id="dg" style="border-collapse: collapse; width: 100%;"></table>
	</div>
</div>
	
	<!-- 添加编辑模态框 -->
	<div id="dlg" class="easyui-dialog" style="width:400px; height:180px" closed="true" buttons="#dlg-buttons" title="修改类型"  >
        <form action="" id="dlgForm"  target="_blank">
        <table style="margin:auto" >
        	<tr></tr>
        	<tr></tr>
			<tr>
				<td>编号</td>
				<td>
					<input id="dictionary_code" name="dictionary_code" type="text" class="easyui-validatebox span2" data-options="required:true" >
					<input type="hidden" id="dictionary_id" name="dictionary_id" />
					<span class="Validform_checktip">编码范围在2~8位字符</span>
				</td>
				</tr>
				<tr>
				<td>名称</td>
				
				<td>
					<input id="dictionary_name" name="dictionary_name" type="text" class="easyui-validatebox span2" data-options="required:true" >
					<input type="hidden" id="dictionary_id" name="dictionary_id" />
					<span class="Validform_checktip">编码范围在2~8位字符</span>
				</td>
			</tr>
			
		</table>
		</form>	
    </div>
    <div id="dlg-buttons" style="text-align: center;">
        <a href="javascript:save();" class="easyui-linkbutton c6" iconCls="icon-ok"  style="width:90px">保存</a>
        <a href="javascript:close();" class="easyui-linkbutton" iconCls="icon-cancel"  onclick="$('#parent_id').combotree('clear');" style="width:90px">关闭</a>
    </div>
</body>
</html> 