<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="wsdc" value="${pageContext.request.contextPath}" />
<html>
	<head>
		<script type="text/javascript">
	var treeGrid;
	$(function() {
		treeGrid = $('#treeGrid').treegrid({
			url : '${wsdc}/resource/treeGrid.do',
			idField : 'id',
			treeField : 'name',
			iconCls : 'icon-ok',
			animate : true,
			collapsible: true,
			//fit : true,
			fitColumns : true,
			pagination : true, //分页属性
			rownumbers : true,
			pageNumber : 1,
			autoRowHeight : true,
			queryParams : {
				draw : 1,
				resource_name : $("#resource_name").val(),
				type : "0",
				
			},
			method : "post",
			onLoadSuccess: function () {
				 delete $(this).treegrid('options').queryParams['id'];  
			},
			onBeforeLoad : function(row,param) {
				if(row) {
					param.id = row.id;
					$('#treeGrid').treegrid('options').url = "${wsdc}/resource/selectChilds.do"
				} else {
					param.id = '0';
					$('#treeGrid').treegrid('options').url = "${wsdc}/resource/treeGrid.do"
				}
				
			},
			frozenColumns : [ [ {
				title : '资源名称',
				field : 'name',
				width : 150,
			} ] ],
			columns : [ [ {
				field : 'resource_code',
				title : '资源编码',
				width : 150,
			}, {
				field : 'valuea',
				title : '资源路径',
				width : 150,
			}, {
				field : 'seq',
				title : '排序',
				width : 150,
			}, {
				field : 'resource_icon',
				title : '图标',
				width : 150,
			},{
				field : 'type',
				title : '资源类型',
				width : 150,
				formatter : function(value, row, index) {
					switch (value) {
					case 'RESOURCE_TYPE_MENU':
						return '菜单';
					case 'RESOURCE_TYPE_REQUEST':
						return '按钮';
					default :
						return value;
					}
				}
			}, {
				field : 'pid',
				title : '父级',
				width : 100,
				hidden: true
			}, {
				field : 'id',
				title : 'id',
				width : 100,
				hidden: true
			}, {
				field : 'action',
				title : '操作',
				width : 80,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_AUTH_ADD"><a class="easyui-linkbutton" href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a></security:authorize>', row.id);
					str += '&nbsp;&nbsp; &nbsp;&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_AUTH_DELETE"><a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a></security:authorize>', row.id);
					return str;
				}
			} ] ],
			toolbar : '#toolbar'
		});
		
	});
	
	/*删除*/
	function deleteFun(id) {
		if (id != undefined) {
			treeGrid.treegrid('select', id);
		}
		var node = treeGrid.treegrid('getSelected');
		if(null != node.children) {
			alert("请逐级删除节点信息");
			return;
		} 
		if (node) {
			parent.$.messager.confirm('询问', '您是否要删除当前资源？删除当前资源会连同子资源一起删除!', function(b) {
				if (b) {
					progressLoad();
					$.post('${wsdc}/resource/deleteResource.do', {
						id : node.id
					}, function(result) {
						parent.$.messager.alert('提示', result.successMessage, 'info');
						treeGrid.treegrid('reload');
						progressClose();
					}, 'JSON');
				}
			});
		}
	}
	/*打开模态框*/
	function addFun() {
		/*上级资源*/
		$('#pid').combotree({
				url : '${wsdc}/resource/allTreeGrid.do',
				parentField : 'pid',
				lines : true,
				//panelHeight : 'auto',
				onLoadSuccess : function() {
					$('#pid').combotree('tree').tree("collapseAll");
				}
			});
		$("#resource_id").val('');
		$("#resource_name").val('');
		$("#valuea").val('');
		$("#resource_icon").val('');
		$("#resource_code").val('');
		$('#seq').numberspinner('setValue',0);
		$('#state').combobox('setValue',0);
		$('#type').combobox('setValue','RESOURCE_TYPE_MENU');
		$('#pid').combotree('clear');
		$('#dlg').dialog('open');
	}
	/*关闭模态框*/
	function close(){ 
    	$('#dlg').dialog('close');
    }
	/*添加*/
	function save() {
	        var data = new Object();
	        data["resource_id"] = $("#resource_id").val();
	        data["resource_name"] = $("#resource_name").val();
	        data["type"] = $("#type").combobox('getValue');
	        data["valuea"] = $("#valuea").val();
	        data["seq"] = $("#seq").numberspinner('getValue');
	        data["resource_icon"] = $("#resource_icon").val();
	       // data["state"] = $("#state").combobox('getValue');
	        data["resource_code"] = $("#resource_code").val();
	        data["parent_id"] = $("#pid").combotree('getValue');
	        console.dir(data);
	        $.ajax({
	            url: "${wsdc}/resource/editResource.do",
	            type: "POST",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            data: JSON.stringify(data),
	            success: function (data) {
	                if (data.success == true) {
	                	alert(data.successMessage);
	                	close();
	                	$('#treeGrid').treegrid('reload');   	// 重新载入所有行
	                } else {
	                    	alert("失败");               
	                    }
	            }
	        });
	    }
	/*编辑*/
	function editFun(id) {
		$.ajax({
			url: "${wsdc}/resource/editShow.do?id="+id,
            contentType: "application/json;charset=utf-8",
            datatype: "json",
            type: "GET",
            success: function (data) {
            	if(data.success) {
            		var t = data.t;
            		if(null != t.resource_name) {
            			$("#resource_name").val(t.resource_name);
            		}
            		if(null != t.resource_code) {
            			$("#resource_code").val(t.resource_code);
            		}
            		if(null != t.resource_id) {
            			$("#resource_id").val(t.resource_id);
            		}
            		if(null != t.type) {
            			$("#type").combobox('setValue',t.type);
            		}
            		/* if(null != t.state) {
            			$("#state").combobox('setValue',t.state);
            		} */
            		if(null != t.seq) {
            			$("#seq").numberspinner('setValue',t.seq);
            		}
            		if(null != t.valuea) {
            			$("#valuea").val(t.valuea);
            		}
            		if(null != t.resource_icon) {
            			$("#resource_icon").val(t.resource_icon);
            		} else {
            			$("#resource_icon").val('');
            		}
            		if(null != t.resource_code) {
            			$("#resource_code").val(t.resource_code);
            		}
            		if(null != t.parent_id && t.parent_id != 0) {
            			/*上级资源*/
            			$('#pid').combotree({
           					url : '${wsdc}/resource/allTreeGrid.do',
           					parentField : 'pid',
           					lines : true,
           					//panelHeight : 'auto',
           					onLoadSuccess : function() {
           						$('#pid').combotree('tree').tree("collapseAll");
           					},
           					value : t.parent_id
            				});
            		} else {
            			/*上级资源*/
            			$('#pid').combotree({
           					url : '${wsdc}/resource/allTreeGrid.do',
           					parentField : 'pid',
           					lines : true,
           					//panelHeight : 'auto',
           					onLoadSuccess : function() {
           						$('#pid').combotree('tree').tree("collapseAll");
           					},
           					value : ''
            				});
            		}
            		$('#dlg').dialog('open');
            	}
            }
		})
	}
	
</script>
	</head>
	<body>
	<!-- 树形列表 -->
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center',border:false"  style="overflow: hidden;">
			<table  id="treeGrid" style="height: 500px;"></table>
		</div>
	</div>
	<!-- 添加 -->
	<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_AUTH_ADD">
	<div id="toolbar" style="display: none;">
		<a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
	</div>
	</security:authorize>
	<!-- 添加编辑模态框 -->
	<div id="dlg" class="easyui-dialog" style="width:500px; height:250px" closed="true" buttons="#dlg-buttons" title="资源权限">
        <form action="" id="dlgForm">
        <table style="margin:auto">
			<tr>
				<td>资源名称</td>
				<td>
					<input id="resource_name" name="resource_name" type="text" class="easyui-validatebox span2" data-options="required:true" >
					<input type="hidden" id="resource_id" name="resource_id" />
				</td>
				<td>资源类型</td>
				<td><select class="easyui-combobox" id="type" name="type"  data-options="width:140,height:29,editable:false,panelHeight:'auto'">
							<option value="RESOURCE_TYPE_MENU">菜单</option>
							<option value="RESOURCE_TYPE_REQUEST">按钮</option>
				</select></td>
			</tr>
			<tr>
				<td>资源路径</td>
				<td><input id="valuea" name="valuea" type="text" placeholder="请输入资源路径" class="easyui-validatebox span2" data-options="width:140,height:29" ></td>
				<td>排序</td>
				<td><input id="seq" name="seq" value="0"  class="easyui-numberspinner" style="width: 140px; height: 29px;" required="required" data-options="editable:false"></td>
			</tr>
			<tr>
				<td>菜单图标</td>
				<td ><input id="resource_icon"  name="resource_icon" /></td>
				<td>上级资源</td>
				<td colspan="3"><select id="pid" name="pid" style="width: 150px; height: 20px;"></select>
				<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#pid').combotree('clear');" >清空</a></td>
				<!-- <td>状态</td>
				<td><select class="easyui-combobox" id="state" name="state"  data-options="width:140,height:29,editable:false,panelHeight:'auto'">
							<option value="0">正常</option>
							<option value="1">停用</option>
				</select></td> -->
			</tr>
			<tr>
				<td>资源编码</td>
				<td>
					<input id="resource_code" name="resource_code" type="text" class="easyui-validatebox span2" data-options="width:140,height:29" >
				</td>
			</tr>
			<tr>
				
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


