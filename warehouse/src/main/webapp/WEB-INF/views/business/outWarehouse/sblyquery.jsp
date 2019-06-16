<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="tt" class="easyui-tabs" style="width: 100%;">
	<div title="设备领用查询" style="padding: 20px; display: none;">
		<table id="jyss" border="1" bordercolor="#8DB2E3" title="信息查询" style="border-collapse: collapse; width: 100%;">
			<tr>
				<td style="text-align: center; background-color: #f2f2f2;">一级分类:</td>
				<td><select class="easyui-combobox" id="yjfl" name="yjfl" style="width: 150px; height: 20px;"></select></td>
				<td style="text-align: center; background-color: #f2f2f2;">二级分类:</td>
				<td><select data-options="editable:false" class="easyui-combobox" id="ejfl" name="ejfl" style="width: 150px; height: 20px;"></select></td>
				<td style="text-align: center; background-color: #f2f2f2;">三级分类:</td>
				<td><select data-options="editable:false" class="easyui-combobox" id="sjfl" name="sjfl" style="width: 150px; height: 20px;"></select></td>
			</tr>
			<tr>
				<td style="text-align: center; background-color: #f2f2f2;">品名:</td>
				<td><input name="pm" id="pm" r /></td>
				<td style="text-align: center; background-color: #f2f2f2;">申领时间:</td>
				<td>
					<input data-options="editable:false" name="beginDate" id="beginDate" class="easyui-datebox"  style="width:150px" /> 至
					<input data-options="editable:false" name="endDate" id="endDate" class="easyui-datebox" style="width:150px" /> 
				</td>
				<td style="text-align: center; background-color: #f2f2f2;">申领单位:</td>
				<td><select class="easyui-combobox" id="sldw" name="sldw" style="width: 150px; height: 20px;"></select></td>
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
				<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_ADD">
					<td>
						<button onclick="javascript:addFun()">设备领用</button>
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
			title : '设备领用列表',
			fitColumns : false,
			method : "post",
			queryParams : {
				draw : 1
			},
			sortable : false,
			columns : [ [ {
				field : 'sbmc',
				title : '品名',
				sortable : false,
				align : 'center',
				width : 100
			},{
				field : 'sccs',
				title : '生产厂商',
				sortable : false,
				align : 'center',
				width : 100
			},{
				field : 'scrq',
				title : '生产日期',
				sortable : false,
				align : 'center',
				width : 100
			},{
				field : 'yws',
				title : '运维商',
				sortable : false,
				align : 'center',
				width : 100
			},{
				field : 'yxq',
				title : '维保有效期至',
				sortable : false,
				align : 'center',
				width : 100
			}, {
				field : 'lydwmc',
				title : '领用单位',
				sortable : false,
				align : 'center',
				width : 100
			}, {
				field : 'lysl',
				title : '领用数量',
				sortable : false,
				align : 'center',
				width : 100
			},{
				field : 'czr',
				title : '操作人',
				sortable : false,
				align : 'center',
				width : 100
			},{
				field : 'czsj',
				title : '操作时间',
				sortable : false,
				align : 'center',
				width : 100
			},{
				field : 'action',
				title : '操作',
				width : 150,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_ADD"><a class="easyui-linkbutton" href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a></security:authorize>', row.crkid);
					str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_ADD"><a class="easyui-linkbutton" href="javascript:void(0)" onclick="showFun(\'{0}\');" >查看</a></security:authorize>', row.crkid);
					str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					str += $.formatString('<security:authorize ifAllGranted="ROLE_SYSTEM_SYS_ROLE_DELETE"><a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a></security:authorize>', row.crkid);
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
		var yjfl = $("#yjfl").combobox('getValue');
		var ejfl = $("#ejfl").combobox('getValue');
		var sjfl = $("#sjfl").combobox('getValue');
		$('#dg').datagrid('options').url = "${ctx}/outwarehouse/querylist.do", 
		$('#dg').datagrid(
				'load', {
					yjfl: yjfl,
					ejfl: ejfl,
					sjfl: sjfl,
					pm:   $("#pm").val(),
					sldw: $("#sldw").combobox('getValue'),
					beginDate:$("#beginDate").datebox("getValue"),
					endDate:$("#endDate").datebox("getValue"),
					zt:  "2",
					lx:   "1",
					wply: "1",
					draw: 1,
					page: page_Number,
					rows: page_Size
				});
	}
	/*清除分类*/
	function clearFl() {
		$("#yjfl").combobox("clear");
		$("#ejfl").combobox("clear");
		$("#sjfl").combobox("clear");
		$('#pm').val('');
		$('#pm').val('');
		$('#beginDate').datebox('clear');
		$('#endDate').datebox('clear');
		$('#sldw').combotree('clear');
	}
	/*查询分类（1,2,3）*/
	function selectFl() {
		initYjfl("jcss");
	}
	
	/*一级分类*/
	function initYjfl(code) {
		$("#yjfl").combobox({
			 url:'${ctx}/dictionary/selectChildsByPcodemini.do?code='+code,
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
	}
	/*二级分类*/
	function initEjfl(id) {
		$("#ejfl").combobox({
			 url:'${ctx}/dictionary/selectChildsByPid.do?id='+id,
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
	}
	/*三级分类*/
	function initSjfl(id) {
		$("#sjfl").combobox({
			 url:'${ctx}/dictionary/selectChildsByPid.do?id='+id,
			 valueField:'dictionary_id',
			 textField:'dictionary_name',
			 editable:false
		})
	}
	/*查询设备详情*/
	function showSb(nv) {
		if(nv!='' && nv != 'undefined') {
			$.ajax({
	            url: "${ctx}/sbb/editShow.do?id="+nv,
	            type: "GET",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function (data) {
	            	var result = data.t;
	            	if(result) {
	            		$("#zcbm").val(result.zcbm);
	                   	$("#wpmc").val(result.pm);
	                   	$("#zcxh").val(result.zcxh);
	                   	$("#zcgg").val(result.zcgg);
	                   	$("#edit_yjfl").val(result.yjfl);
	                   	$("#edit_ejfl").val(result.ejfl);
	                   	$("#edit_sjfl").val(result.sjfl);
	            	}
	            }
	        });
		}
	}
	/*查询设备*/
	function selectSb(value) {
		if(value!='' && value!='undefined') {
			$("#sbid").combobox({
				 url:'${ctx}/sbb/selectSbCombobox.do?wply=1&lx=1&gh=1',
				 valueField:'sbid',
				 textField:'pm',
				 editable:true,
				 value:value,
				 onChange:function(nv,ov) {
					 showSb(nv);
				 },
				 onLoadSuccess:function(array) {
					 for(var i=0;i<array.length;i++) {
						 if(array[i].sbid == value) {
					 		showSb(value);
						 }
					 }
				 }
			})
		} else {
			$("#sbid").combobox({
				 url:'${ctx}/sbb/selectSbCombobox.do?wply=1&lx=1&dqzt=1',
				 valueField:'sbid',
				 textField:'pm',
				 editable:true,
				 onChange:function(nv,ov) {
					 showSb(nv);
				 }
			})
		}
	}
	/*查询货架*/
	function selectHj(value) {
		if(value!='' && value!='undefined') {
			$("#hjxxid").combobox({
				 url:'${ctx}/hjxxld/selectHjCombobox.do',
				 valueField:'hjxxid',
				 textField:'name',
				 editable:false,
				 value:value
			})
		} else {
			$("#hjxxid").combobox({
				 url:'${ctx}/hjxxld/selectHjCombobox.do',
				 valueField:'hjxxid',
				 textField:'name',
				 editable:false,
			})
		}
	}
	/*查询领用单位*/
	function selectDw(value,lydw) {
		if(value!=''&&value!='undefined') {
			$(lydw).combotree({
				url : '${ctx}/department/allTreeGrid.do',
				parentField : 'pid',
				lines : true,
				value:value,
				onLoadSuccess : function() {
					$('#lydw').combotree('tree').tree("collapseAll");
				}
			});
		} else {
		$(lydw).combotree({
			url : '${ctx}/department/allTreeGrid.do',
			parentField : 'pid',
			lines : true,
			onLoadSuccess : function() {
				$('#lydw').combotree('tree').tree("collapseAll");
			}
		});
		}
	}
	/*清除物品编码信息及单位信息*/
	function clearWpDw() {
		$("#zcbm").val('');
       	$("#wpmc").val('');
       	$("#zcxh").val('');
       	$("#zcgg").val('');
       	$("#edit_yjfl").val('');
       	$("#edit_ejfl").val('');
       	$("#edit_sjfl").val('');
	}
	/*打开模态框*/
	function addFun() {
		selectDw("","#lydw");
		selectSb();
		selectHj();
		//清空
		$("#crkid").val('');
		$("#sbid").combobox("clear");
		$("#hjxxid").combobox("clear");
		$("#lydw").combotree("clear");
		$("#lysl").numberspinner("setValue",0);
		clearWpDw();
		$('#dlg').dialog('open');
	}
	/*关闭模态框*/
	function close(){ 
    	$('#dlg').dialog('close');
    }
	
	/*添加*/
	function save() {
		var data = new Object();
       	data["sbid"] = $("#sbid").combotree('getValue');
        data["lydw"] = $("#lydw").combotree('getValue');
        data["lysl"] = $("#lysl").numberspinner('getValue');
        data["crkid"] = $("#crkid").val();
        data["zt"] = '2';//出库
        data["lx"] = '1';//设备
        if(!$("#dlg").form('enableValidation').form('validate')){
        	alert("请输入必填项");
        	preventDefault();
        }
        if(data.lysl <= 0) {
        	alert("领用数量不能为负数及0");
        	preventDefault();
        }
        var jyzd = $("#sbid").combotree('getText');//校验
        if(data.sbid == jyzd) {
        	alert("请选择正确耗材设备");
        	preventDefault();
        } 
         $.ajax({
            url: "${ctx}/outwarehouse/editoutwarehouse.do",
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
                    	alert("保存失败");               
                    }
            }
        });
	}
	
	
	/*删除*/
	function deleteFun(id) {
		parent.$.messager.confirm('询问', '您是否要删除当前数据？',
				function(b) {
					if (b) {
						$.post('${ctx}/outwarehouse/deleteOutWarehouse.do?crkid='+id, {
							id : id
						}, function(result) {
							parent.$.messager.alert('提示',result.successMessage, 'info');
							search();
						}, 'JSON');
					}
				});
	}
	/*编辑*/
	function editFun(id) {
		 $.ajax({
	            url: "${ctx}/outwarehouse/editShow.do?crkid="+id,
	            type: "POST",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function (data) {
	            	if(data.success == true) {
	            		var result = data.t;
	            		if(null != result.crkid) {
	            			$("#crkid").val(result.crkid);
	            		}
	            		if(null != result.lysl) {
	            			$("#lysl").numberspinner('setValue',result.lysl);
	            		}
	            		if(null != result.lydw) {
	            			selectDw(result.lydw,"#lydw");
	            		} else {
	            			selectDw();
	            		}
	            		if(null != result.sbid) {
	            			selectSb(result.sbid);
	            		} else {
	            			selectSb();
	            		}
	            		if(null != result.hjxxid) {
	            			selectHj(result.hjxxid);
	            		} else {
	            			selectHj();
	            		}
	            		
	            	}
	            }
	        });
		 $('#dlg').dialog('open');
	}
	/*加载*/
	$(document).ready(function () {
		selectFl("jcss");
		selectDw("","#sldw");
	    search();
	    
	});
	    	
</script>

<!-- 添加编辑模态框 -->
<div id="dlg" class="easyui-dialog" style="width: 400px; height: 350px;display:none;" closed="true" buttons="#dlg-buttons" title="设备领用管理">
	<form action="" id="dlgForm">
		<table style="margin:auto">
			<tr>
				<td>设备</td>
				<td>
					<select data-options="required:true" class="easyui-combobox" id="sbid" name="sbid" style="width: 150px; height: 20px;">
					</select>
				</td>
			</tr>
			<tr>
				<td>物品编码:</td>
				<td><input readonly="readonly" style="border: 0px;outline:none;" type="text" id="zcbm" value=""  /></td>
			</tr>
			<tr>
				<td>物品名称:</td>
				<td><input readonly="readonly" style="border: 0px;outline:none;" type="text" id="wpmc" value=""  /></td>
			</tr>
			<tr>
				<td>物品型号:</td>
				<td><input readonly="readonly" style="border: 0px;outline:none;" type="text" id="zcxh" value=""  /></td>
			</tr>
			<tr>
				<td>物品规格:</td>
				<td><input readonly="readonly" style="border: 0px;outline:none;" type="text" id="zcgg" value=""  /></td>
			</tr>
			<tr>
				<td>一级分类:</td>
				<td><input readonly="readonly" style="border: 0px;outline:none;" type="text" id="edit_yjfl" value=""  /></td>
			</tr>
			<tr>
				<td>二级分类:</td>
				<td><input readonly="readonly" style="border: 0px;outline:none;" type="text" id="edit_ejfl" value=""  /></td>
			</tr>
			<tr>
				<td>三级分类:</td>
				<td><input readonly="readonly" style="border: 0px;outline:none;" type="text" id="edit_sjfl" value=""  /></td>
			</tr>
			<tr>
				<td>领用单位</td>
				<td>
					<select data-options="required:true" class="easyui-combotree" id="lydw" name="lydw" style="width: 150px; height: 20px;">
					</select>
				</td>
			</tr>
			<tr>
				<td>领用数量</td>
				<td>
					<input style="width: 150px; height: 20px;" data-options="required:true" id="lysl" name="lysl" class="easyui-numberspinner" />
					<input id="crkid" name="crkid" type="hidden" />
					<input id="zt" name="zt" type="hidden"/>
					<input id="lx" name="lx" type="hidden" />
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="dlg-buttons" style="text-align: center;display:none;">
	<a href="javascript:save();" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px;">保存</a> 
	<a href="javascript:close();" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlg').dialog('close');" style="width: 90px;">关闭</a>
</div>


<!-- 查看页面 -->
<div id="dlgshow" class="easyui-dialog" style="width: 400px; height: 470px;display:none;" closed="true" buttons="#dlgshow-buttons" title="设备领用查看">
	<form action="" id="dlgFormshow">
		<table style="margin:auto">
			<tr>
				<td>物品编码:</td>
				<td><input style="width: 200px; height: 20px;width: 250px;" readonly="readonly"  type="text" id="show_zcbm" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>物品名称:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly" type="text" id="show_wpmc" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>物品型号:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_zcxh" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>一级分类:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_yjfl" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>二级分类:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_ejfl" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>三级分类:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_sjfl" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>物品分类:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_fl" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>生产厂商:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_sccs" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>生产日期:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_scrq" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>运维商:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_yws" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>有效期:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_yxq" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>维保电话:</td>
				<td><input style="width: 150px; height: 20px;" readonly="readonly"  type="text" id="show_wbdh" value="" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>领用单位</td>
				<td>
					<input style="width: 150px; height: 20px;" readonly="readonly" type="text" id="show_lydw" value="" class="easyui-textbox" />
				</td>
			</tr>
			<tr>
				<td>领用数量</td>
				<td>
					<input style="width: 150px; height: 20px;" readonly="readonly" id="show_lysl"  type="text" class="easyui-textbox" />
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="dlgshow-buttons" style="text-align: center;display:none;">
	<a href="javascript:closeshow();" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlgshow').dialog('close');" style="width: 90px">关闭</a>
</div>

<script>
/*查看页面*/
function showFun(id) {
	
	$.ajax({
        url: "${ctx}/outwarehouse/show.do?crkid="+id,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (data) {
        	var result = data.t;
        	if(result) {
        		$("#show_zcbm").textbox('setValue',result.zcbm);
               	$("#show_wpmc").textbox('setValue',result.pm);
               	$("#show_zcxh").textbox('setValue',result.zcxh);
               	$("#show_zcgg").textbox('setValue',result.zcgg);
               	$("#show_hj").textbox('setValue',result.name);
               	$("#show_lydw").textbox('setValue',result.department_name);
               	$("#show_yjfl").textbox('setValue',result.yjfl);
               	$("#show_ejfl").textbox('setValue',result.ejfl);
               	$("#show_sjfl").textbox('setValue',result.sjfl);
               	$("#show_lysl").textbox('setValue',result.lysl);
               	$("#show_sccs").textbox('setValue',result.sccs);
               	$("#show_scrq").textbox('setValue',result.scrq);
               	$("#show_yws").textbox('setValue',result.yws);
               	$("#show_yxq").textbox('setValue',result.yxq);
               	$("#show_wbdh").textbox('setValue',result.wbdh);
        	}
        }
    });
	$('#dlgshow').dialog('open');
}

function closeshow() {
	$('#dlgshow').dialog('close');
}
</script>
