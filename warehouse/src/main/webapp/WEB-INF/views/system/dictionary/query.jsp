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
				url : '${wsdc}/dictionary/querylist.do',
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
					dictionary_name : $("#dictionaryname").val(),
				},
				method : "post",
				onLoadSuccess: function () {
					 delete $(this).treegrid('options').queryParams['id'];  
				},
				onBeforeLoad : function(row,param) {
					if(row) {
						param.id = row.id;
						$('#treeGrid').treegrid('options').url = "${wsdc}/dictionary/selectChilds.do"
					} else {
						param.id = '0';
						$('#treeGrid').treegrid('options').url = "${wsdc}/dictionary/querylist.do"
					}
					
				},
				frozenColumns : [ [ {
					title : '字典名称',
					field : 'name',
					width : 150,
				} ] ],
				columns : [ [ {
					field : 'dictionary_code',
					title : '字典编号',
					sortable : false,
					align : 'left',
					width : 80,
				},{
					field : 'dictionary_order',
					title : '排序',
					sortable : false,
					align : 'left',
					width : 30,
				}, {
					field : 'dictionary_id',
					title : 'id',
					sortable : false,
					align : 'left',
					width : 50,
					hidden: true
				},  {
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
						str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_DIC_DELETE"><a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a></security:authorize>', row.dictionary_id);
						str += '&nbsp;&nbsp;&nbsp;&nbsp;';
						str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_DIC_ADD"><a href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a></security:authorize>', row.dictionary_id);
						//str += '&nbsp;&nbsp;&nbsp;&nbsp;';
						return str;
					}
				} ] ],
				toolbar : '#toolbar'
			});
			
		});
	
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
							treeGrid.treegrid('reload');
							progressClose();
						}, 'JSON');
					}
				});
	}
	/* /*打开模态框*/
	function addFun() {
		/*上级资源*/
		$('#pid').combotree({
				url : '${wsdc}/dictionary/allTreeGrid.do',
				parentField : 'pid',
				lines : true,
				//panelHeight : 'auto',
				onLoadSuccess : function() {
					$('#pid').combotree('tree').tree("collapseAll");
				}
			});
		$("#dictionaryid").val('');
		$("#dictionarycode").val('');
		$("#dictionaryname").val('');
		$("#dictionaryorder").val('');
		$('#pid').combotree('clear');
		$('#dlg').dialog('open');
	}
	//关闭模态框
	function close(){ 
    	$('#dlg').dialog('close');
    } 
	
	/*添加*/
	function save() {
		var data = new Object();
		 	data["dictionary_code"] = $("#dictionarycode").val();
	        data["dictionary_name"] = $("#dictionaryname").val();
	        data["dictionary_id"] = $("#dictionaryid").val();
	        data["parent_id"] = $("#pid").combotree('getValue');
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
                	$('#treeGrid').treegrid('reload');
                } else {
                    	alert("失败");               
                    }
            }
        });
	}
	
	   /*编辑*/
		function editFun(id) {
			$.ajax({
				url: "${wsdc}/dictionary/editShow.do?id="+id,
	            contentType: "application/json;charset=utf-8",
	            datatype: "json",
	            type: "GET",
	            success: function (data) {
	            	if(data.success) {
	            		var t = data.t;
	            		if(null != t.dictionary_name) {
	            			$("#dictionaryname").val(t.dictionary_name);
	            		}
	            		if(null != t.dictionary_code) {
	            			$("#dictionarycode").val(t.dictionary_code);
	            		}
	            		if(null != t.dictionary_id) {
	            			$("#dictionaryid").val(t.dictionary_id);
	            		}
	            		if(null != t.parent_id && t.parent_id != 0) {
	            			/*上级资源*/
	            			$('#pid').combotree({
	           					url : '${wsdc}/dictionary/allTreeGrid.do',
	           					parentField : 'pid',
	           					lines : true,
	           					onLoadSuccess : function() {
	           						$('#pid').combotree('tree').tree("collapseAll");
	           					},
	           					value : t.parent_id
	            				});
	            		} else {
	            			/*上级资源*/
	            			$('#pid').combotree({
	           					url : '${wsdc}/dictionary/allTreeGrid.do',
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

	<!-- 页面列表 -->
	
	<!-- 添加编辑模态框 -->
	<div id="dlg" class="easyui-dialog" style="width:400px; height:180px" closed="true" buttons="#dlg-buttons" title="字典录入">
        <form action="" id="dlgForm">
        <table style="margin:auto" >
        	<tr>&nbsp;&nbsp;&nbsp;&nbsp;</tr>
        	<tr>&nbsp;&nbsp;&nbsp;&nbsp;</tr>
			<tr>
				<td>编号</td>
				<td>
					<input id="dictionarycode" name="dictionary_code" type="text" class="easyui-validatebox span2" data-options="required:true" >
					<input type="hidden" id="dictionaryid" name="dictionary_id" />
					<span class="Validform_checktip">编码范围在2~8位字符1</span>
				</td>
				</tr>
				<tr>
				<td>名称</td>
				
				<td>
					<input id="dictionaryname" name="dictionary_name" type="text" class="easyui-validatebox span2" data-options="required:true" >
					<input type="hidden" id="dictionaryid" name="dictionary_id" />
					<span class="Validform_checktip">编码范围在2~8位字符</span>
				</td>
			</tr>
			<tr>
				<td>上级资源</td>
				<td colspan="3"><select id="pid" name="pid" style="width: 150px; height: 20px;"></select>
				<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#pid').combotree('clear');" >清空</a></td>
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