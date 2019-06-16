<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="wsdc" value="${pageContext.request.contextPath}" />
<div id="tt" class="easyui-tabs" style="width: 100%;">
	<div title="角色查询" style="padding: 20px; display: none;">
		<table id="jyss" border="1" bordercolor="#8DB2E3" title="信息查询" style="border-collapse: collapse; width: 100%;">
			<tr>
				<td style="text-align: center; background-color: #f2f2f2;">角色名称:</td>
				<td><input name="role_name" id="role_name" role_name"" /></td>
				<td style="text-align: center; background-color: #f2f2f2;">角色类型:</td>
				<td><select name="role_level" id="role_level">
						<option value="">请选择</option>
						<option value="0">终极管理员</option>
						<option value="1">子管理员</option>
						<option value="2">用户</option>
				</select></td>
			</tr>
		</table>
		<table style="float: right;">
			<tr>
				<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_QUERY">
					<td>
						<button onclick="javascript:search()">查询</button>
					</td>
				</security:authorize>
				<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_ADD">
					<td>
						<button onclick="javascript:addFun()">添加</button>
					</td>
				</security:authorize>
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
			singleSelect : true,
			showHeader : true,
			title : '角色列表',
			fitColumns : true,
			method : "post",
			queryParams : {
				draw : 1
			},
			sortable : false,
			columns : [ [ {
				field : 'role_name',
				title : '角色名称',
				sortable : false,
				align : 'center',
				width : 100
			}, {
				field : 'role_level',
				title : '角色类型',
				sortable : false,
				align : 'center',
				width : 100,
				formatter : function (value, row, index) {
					switch (value) {
					case '0':
						return '终极管理员';
					case '1':
						return '子管理员';
					case '2':
						return '用户';
					default :
						return value;
					}
				}
			}, {
				field : 'description',
				title : '备注',
				sortable : false,
				align : 'center',
				width : 100
			}, {
				field : 'action',
				title : '操作',
				width : 80,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_ADD"><a class="easyui-linkbutton" href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a></security:authorize>', row.role_id);
					str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_DELETE"><a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a></security:authorize>', row.role_id);
					str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_GRANT"><a href="javascript:void(0)" onclick="grantFun(\'{0}\');" >授权</a></security:authorize>', row.role_id);
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
		$('#dg').datagrid('options').url = "${wsdc}/role/querylist.do", $('#dg').datagrid(
				'load', {
					role_name : $("#role_name").val(),
					role_level : $("#role_level").val(),
					draw : 1,
					page : page_Number,
					rows : page_Size
				});
	}
	
	/*打开模态框*/
	function addFun() {
		$("#roleid").val('');
		$("#rolename").val('');
		$("#rolelevel").combobox('setValue','0');
//		$("#seq").numberspinner(0);
		$("#description").val('');
		$('#dlg').dialog('open');
	}
	/*关闭模态框*/
	function close(){ 
    	$('#dlg').dialog('close');
    }
	/*添加*/
	function save() {
		var data = new Object();
        data["role_id"] = $("#roleid").val();
        data["role_name"] = $("#rolename").val();
        data["role_level"] = $("#rolelevel").combobox('getValue');
//        data["seq"] = $("#seq").val();
        data["description"] = $("#description").val();
         $.ajax({
            url: "${wsdc}/role/editRole.do",
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
	
	
	/*删除*/
	function deleteFun(id) {
		parent.$.messager.confirm('询问', '您是否要删除当前角色？',
				function(b) {
					if (b) {
						progressLoad();
						$.post('${wsdc}/role/deleteRole.do', {
							id : id
						}, function(result) {
							parent.$.messager.alert('提示',result.successMessage, 'info');
							search();
							progressClose();
						}, 'JSON');
					}
				});
	}
	/*编辑*/
	function editFun(id) {
		$.ajax({
			url: "${wsdc}/role/editShow.do?id="+id,
            contentType: "application/json;charset=utf-8",
            datatype: "json",
            type: "GET",
            success: function (data) {
            	if(data.success) {
            		var t = data.t;
            		if(null != t.role_name) {
            			$("#rolename").val(t.role_name);
            		}
            		if(null != t.role_level) {
            			$("#rolelevel").combobox('setValue',t.role_level);
            		}
            		/* if(null != t.seq) {
            			$("#seq").numberspinner('setValue',t.seq);
            		} */
            		if(null != t.description) {
            			$("#description").val(t.description);
            		}
            		if(null != t.role_id) {
            			$("#roleid").val(t.role_id);
            		}
            		$('#dlg').dialog('open');
            	}
            }
		})
	}
	/*授权模态框*/
	var resourceTree;
	function grantFun(id) {
		resourceTree = $('#resourceTree').tree({
			url : '${wsdc}/resource/allTreeGrid.do?flag=false',
			parentField : 'pid',
			lines : true,
			checkbox : true,
			onClick : function(node) {
				
			},
			onLoadSuccess : function(node, data) {
				progressLoad();
				$.post( '${wsdc}/role/selectRoleResource.do', {
					id : id
				}, function(result) {
					var resources = result.t.resources;
					for(var i = 0; i < resources.length; i++) {
						if(resources[i].resource_id != undefined && null != resources[i].resource_id) {
							if (resourceTree.tree('find', resources[i].resource_id)) {
								resourceTree.tree('check', resourceTree.tree('find', resources[i].resource_id).target);
							}
						}
					}
				}, 'json');
				progressClose();
				$("#roleid").val(id);
			},
			cascadeCheck : false
		});
		$("#roleGrant").dialog('open');
	}
	/*保存授权*/
	function saveGrant() {
		var data = new Object();
		var resources = resourceTree.tree('getChecked');
		var ids = "";
		if(null != resources && resources.length > 0) {
			for(var i = 0; i < resources.length; i++) {
				ids += resources[i].resource_id+",";
			}
			if(ids.length > 0) {
				ids = ids.substring(0,ids.length-1);
			}
			data["resourceIds"] = ids;
		} 
		data["role_id"] = $("#roleid").val();
		$.ajax({
            url: "${wsdc}/role/saveRoleResource.do",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: function (data) {
                if (data.success == true) {
                	alert(data.successMessage);
                	closeGrant();
                } else {
                	alert("失败"); 
                }
            }
        });	 
	}
	
	/*关闭模态框*/
	function closeGrant(){ 
		$("#roleid").val('');
    	$("#roleGrant").dialog('close');
    }
	/*全选*/
	function checkAll() {
		var nodes = resourceTree.tree('getChecked', 'unchecked');
		if (nodes && nodes.length > 0) {
			for ( var i = 0; i < nodes.length; i++) {
				resourceTree.tree('check', nodes[i].target);
			}
		}
	}
	/*取消*/
	function uncheckAll() {
		var nodes = resourceTree.tree('getChecked');
		if (nodes && nodes.length > 0) {
			for ( var i = 0; i < nodes.length; i++) {
				resourceTree.tree('uncheck', nodes[i].target);
			}
		}
	}
	/*反选*/
	function checkInverse() {
		var unchecknodes = resourceTree.tree('getChecked', 'unchecked');
		var checknodes = resourceTree.tree('getChecked');
		if (unchecknodes && unchecknodes.length > 0) {
			for ( var i = 0; i < unchecknodes.length; i++) {
				resourceTree.tree('check', unchecknodes[i].target);
			}
		}
		if (checknodes && checknodes.length > 0) {
			for ( var i = 0; i < checknodes.length; i++) {
				resourceTree.tree('uncheck', checknodes[i].target);
			}
		}
	}
	/*加载*/
	$(document).ready(function () {
	    search();
	});
	    	
</script>

<!-- 添加编辑模态框 -->
<div id="dlg" class="easyui-dialog" style="width: 500px; height: 250px;" closed="true" buttons="#dlg-buttons" title="角色管理">
	<form action="" id="dlgForm">
		<table style="margin:auto">
			<tr>
				<td>角色源名称</td>
				<td>
					<input id="rolename" name="rolename" type="text" class="easyui-validatebox span2" data-options="required:true">
					<input type="hidden" id="roleid" name="roleid" />
				</td>
			</tr>
			<tr>
				<td>角色类型</td>
				<td>
					<select id="rolelevel" name="rolelevel" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
							<option value="0">终极管理员</option>
							<option value="1">子管理员</option>
							<option value="2">用户</option>
					</select>
				</td>
			</tr>
			<!-- <tr>
				<td>排序</td>
				<td>
					<input id="seq" name="seq" value="0"
					class="easyui-numberspinner" style="width: 140px; height: 29px;"
					required="required" data-options="editable:false">
				</td>
			</tr> -->
			<tr>
				<td>备注</td>
				<td>
					<textarea id="description" name="description" rows="3" cols="20" ></textarea>
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="dlg-buttons" style="text-align: center;">
	<a href="javascript:save();" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">保存</a> 
	<a href="javascript:close();" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlg').dialog('close');" style="width: 90px">关闭</a>
</div>
<!-- 授权模态框 -->
<div id="roleGrant" class="easyui-dialog" style="width: 500px; height: 500px;" closed="true" buttons="#roleGrant-buttons" title="授权管理">
	<div class="easyui-layout" data-options="fit:true,border:false" >
		<div data-options="region:'west'" title="资源权限" style="width: 300px; padding: 1px;">
			<div class="well well-small">
				<form id="roleGrantForm" method="post">
					<input name="id" type="hidden"  value="" readonly="readonly">
					<ul id="resourceTree"></ul>
					<input id="resourceIds" name="resourceIds" type="hidden" />
				</form>
			</div>
		</div>
		<div data-options="region:'center'" title="操作" style="overflow: hidden; padding: 10px;">
			<div>
				<button class="btn btn-success" onclick="checkAll();">全选</button>
				<br /> <br />
				<button class="btn btn-warning" onclick="checkInverse();">反选</button>
				<br /> <br />
				<button class="btn btn-inverse" onclick="uncheckAll();">取消</button>
			</div>
		</div>
	</div>
</div>
<div id="roleGrant-buttons" style="text-align: center;">
	<a href="javascript:saveGrant();" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">保存</a> 
	<a href="javascript:closeGrant();" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#roleGrant').dialog('close');" style="width: 90px">关闭</a>
</div>

