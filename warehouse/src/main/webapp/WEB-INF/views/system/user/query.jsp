<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="wsdc" value="${pageContext.request.contextPath}" />
<div id="tt" class="easyui-tabs" style="width:100%;" >
<div title="用户查询" style="padding:20px;display:none;"> 
	<table  id="jyss" border="1" bordercolor="#8DB2E3" title="信息查询" style="border-collapse:collapse;width:100%;">
		<tr>
			<td style="text-align:right;background-color:#f2f2f2">用户名:</td>
			<td><input name="username" id="username" /></td>
			<td style="text-align:right;background-color:#f2f2f2">姓名:</td>
			<td><input name="realname" id="realname"/></td>
		</tr>
		<tr>
			<td style="text-align:right;background-color:#f2f2f2">性别:</td>
			<td>
				<select name="sex"  id="sex">
             		<option value="">请选择</option>
             		<option value="1">男</option>
             		<option value="0">女</option>
                </select>
			</td>
			<td style="text-align:right;background-color:#f2f2f2">状态:</td>
			<td>
				<select name="isUse"  id="isUse">
             		<option value="">请选择</option>
             		<option value="1">启用</option>
             		<option value="0">停用</option>
                </select>
			</td>
		</tr>
	</table>	
		   
    <table style="float: right;">
	   	<tr >
	   		<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_USER_QUERY">
	   		 	<td>
	   		 		<button  onclick="javascript:search()">查询</button>
	   		 	</td>
	   		</security:authorize>
   		 	<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_USER_ADD">
	   		 	<td>		   		 
	   		 		<button  onclick="javascript:addFun()">添加</button>
	   		 	</td>
   		 	</security:authorize>
	   	</tr>
    </table> 
    <table id="dg" style="border-collapse:collapse;width:100%;" >
		

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
			singleSelect : true,
			showHeader : true,
			title : '用户列表',
			fitColumns : true,
			method : "post",
			queryParams : {
				draw : 1
			},
			sortable : false,
			columns : [ [ {
				field : 'username',
				title : '用户名',
				sortable : false,
				align : 'center',
				width : 100
			}, {
				field : 'realname',
				title : '姓名',
				sortable : false,
				align : 'center',
				width : 100
			}, {
				field : 'sex',
				title : '性别',
				sortable : false,
				align : 'center',
				width : 100,
				formatter : function(value,row,index) {
					switch(value) {
						case '0':
							return '女';
						case '1':
							return '男';
					}
				}
			}, {
				field : 'department_name',
				title : '所属部门',
				sortable : false,
				align : 'center',
				width : 100,
				formatter : function(value,row,index) {
					return row.department.department_name;
				}
			}, {
				field : 'isUse',
				title : '账号状态',
				sortable : false,
				align : 'center',
				width : 100,
				formatter : function(value,row,index) {
					switch (value) {
						case '0':
							return '停用';
						case '1':
							return '启用';
						default :
							return value;
					}
				}
			}, {
				field : 'create_time',
				title : '创建时间',
				sortable : false,
				align : 'center',
				width : 100
			}, {
				field : 'action',
				title : '操作',
				width : 80,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_USER_ADD"><a class="easyui-linkbutton" href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a></security:authorize>', row.user_id);
					str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_USER_DELETE"><a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a></security:authorize>', row.user_id);
					return str;
				}
			} ] ]
		})
	});
	/*列表查询*/
	function search() {
		//pageNumber为datagrid的当前页码  
		var page_Number = $('#dg').datagrid('options').pageNumber;
		//pageSize为datagrid的每页记录条数  
		var page_Size = $('#dg').datagrid('options').pageSize;
		$('#dg').datagrid('options').url = "querylist.do", $('#dg').datagrid(
				'load', {
					username : $("#username").val(),
					realname : $("#realname").val(),
					sex : $("#sex").val(),
					isUse : $("#isUse").val(),
					draw : 1,
					page : page_Number,
					rows : page_Size
				});

	}
	/*加载*/
	$(document).ready(function () {
	    search();
	});
	
	
	/*打开模态框*/
	function addFun() {
		/*部门*/
		$('#departmentid').combotree({
			url : '${wsdc}/user/selectDepartment.do',
			parentField : 'pid',
			lines : true,
			required: true,
			//panelHeight : 'auto',
			onLoadSuccess : function() {
				$('#departmentid').combotree('tree').tree("collapseAll");
			}
		});
		/*角色*/
		$('#roleids').combotree({
			url : '${wsdc}/user/selectRole.do',
			multiple: true,
			lines : true,
			required: true,
			//panelHeight : 'auto',
		});
		/*清空表单*/
		$("#user_id").val('');
		$("#usernamedlg").val('');
		$("#sexdlg").combobox('setValue','1');
		$("#realnamedlg").val('');
		$("#isUsedlg").combobox('setValue','1');
		$("#departmentid").combotree('clear');
		$("#roleids").combotree('clear');
		$("#phone").numberbox('setValue','');
		$('#dlg').dialog('open');
	}
	/*关闭模态框*/
	function close(){ 
    	$('#dlg').dialog('close');
    }
	
	/*添加*/
	function save() {
		var data = new Object();
		data["username"] = $("#usernamedlg").val();
		data["user_id"] = $("#user_id").val();
		data["sex"] = $("#sexdlg").combobox('getValue');
		data["realname"] = $("#realnamedlg").val();
		data["isUse"] = $("#isUsedlg").combobox('getValue');
		data["department_id"] = $("#departmentid").combotree('getValue');
		data["phone"] = $("#phone").numberbox('getValue');
		data["rolesids"] = $("#roleids").combotree('getValues');
		if(!data.rolesids.length > 0) {
			alert("请选择角色");
			preventDefault();
		}
		if(!data.department_id) {
			alert("请选择部门");
			preventDefault();
		}
		$.ajax({
			url : "${wsdc}/user/editUser.do",
			type : "POST",
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			data : JSON.stringify(data),
			success : function(data) {
				if (data.success == true) {
					alert(data.successMessage);
					close();
					search(); // 重新载入
				} else {
					alert(data.error);
				}
			}
		});
	}
	/*编辑模态框*/
	function editFun(id) {
		console.dir(id);
		$.ajax({
			url : "${wsdc}/user/editShow.do?id=" + id,
			contentType : "application/json;charset=utf-8",
			datatype : "json",
			type : "GET",
			success : function(data) {
				console.dir(data);
				if (data.success) {
					var t = data.t;
					if (null != t.username) {
						$("#usernamedlg").val(t.username);
					}
					if (null != t.realname) {
						$("#realnamedlg").val(t.realname);
					}
					if (null != t.isUse) {
						$("#isUsedlg").combobox('setValue', t.isUse);
					}
					if (null != t.sex) {
						$("#sexdlg").combobox('setValue',t.sex);
					}
					if (null != t.phone) {
						$("#phone").numberbox('setValue',t.phone);
					}
					if (null != t.user_id) {
						$("#user_id").val(t.user_id);
					}
					if (null != t.department_id) {
						/*部门*/
						$('#departmentid').combotree({
							url : '${wsdc}/user/selectDepartment.do',
							parentField : 'pid',
							lines : true,
							required: true,
							onLoadSuccess : function() {
								$('#departmentid').combotree('tree').tree("collapseAll");
							},
							value : t.department_id
						});
					}
					if (null != t.userRoles && t.userRoles.length > 0) {
						var roleids = "";
						var userRoles = t.userRoles;
						for(var i = 0 ;i < userRoles.length; i++) {
							roleids += userRoles[i].role_id + ",";
						}
						if(roleids.length > 0) {
							roleids = roleids.substring(0,roleids.length-1);
						}
						/*角色*/
						$('#roleids').combotree({
							url : '${wsdc}/user/selectRole.do',
							multiple: true,
							lines : true,
							multiple : true,
							required: true,
							cascadeCheck : false,
							value : $.stringToList(roleids)
						});
						
					} 
					$('#dlg').dialog('open');
				}
			},error: function(e) { 
				console.dir(e);
			} 
		})
	}
	/*删除用户*/
	function deleteFun(id) {
		parent.$.messager.confirm('询问', '删除当前用户会连带信息一起删除,您是否要继续删除？', function(b) {
				if (b) {
					progressLoad();
					$.post('${wsdc}/user/deleteUser.do', {
						id : id
					}, function(result) {
						parent.$.messager.alert('提示', result.successMessage, 'info');
						search();
						progressClose();
					}, 'JSON');
				}
			});
	}
</script>
<!-- 添加编辑模态框 -->
<div id="dlg" class="easyui-dialog" style="width: 600px; height: 250px;" closed="true" buttons="#dlg-buttons" title="用户管理">
	<form action="" id="dlgForm">
		<table style="margin:auto">
			<tr>
				<td>用户名</td>
				<td>
					<input id="usernamedlg" name="usernamedlg" type="text" class="easyui-validatebox span2" data-options="required:true">
					<input type="hidden" id="user_id" name="user_id" />
				</td>
				<td>&nbsp;&nbsp;&nbsp;性别</td>
				<td>
					<select id="sexdlg" name="sexdlg" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
							<option value="1">男</option>
							<option value="0">女</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>姓名</td>
				<td>
					<input id="realnamedlg" name="realnamedlg" type="text" class="easyui-validatebox span2" data-options="required:true">
				</td>
				<td>使用状态</td>
				<td>
					<select id="isUsedlg" name="isUsedlg" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
							<option value="1">使用</option>
							<option value="0">停用</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>部门</td>
				<td>
					<select id="departmentid" name="departmentid" style="width: 140px; height: 30px;"></select>
					<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#departmentid').combotree('clear');" >清空</a>
				</td>
				<td>角色</td>
				<td>
					<select id="roleids"  name="roleids"   style="width: 140px; height: 30px;"></select>
					<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#roleids').combotree('clear');" >清空</a>
				</td>
			</tr>
			<tr>
				<td>手机号</td>
				<td>
					<input id="phone" name="phone" type="text" class="easyui-numberbox">
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- 添加编辑按钮 -->
<div id="dlg-buttons" style="text-align: center;">
	<a href="javascript:save();" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">保存</a> 
	<a href="javascript:close();" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlg').dialog('close');" style="width: 90px">关闭</a>
</div>
