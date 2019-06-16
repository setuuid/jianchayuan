<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="wsdc" value="${pageContext.request.contextPath}" />
<div id="tt" class="easyui-tabs" style="width: 100%;">
	<div title="设备管理查询" style="padding: 20px; display: none;">
		<table id="jyss" border="1" bordercolor="#8DB2E3" title="信息查询" style="border-collapse: collapse; width: 100%;">
			<tr>
				<td style="text-align: right; background-color: #f2f2f2;">品名:</td>
				<td><input name="pm" id="pm" class="easyui-textbox" style="width:150px; height: 20px;"/></td>
				<td style="text-align:right;background-color:#f2f2f2">到货日期:</td>
					<td>
					<input name="beginDate" id="beginDate" data-options="editable:false"
							class="easyui-datebox"  style="width:150px" /> 至
						<input name="endDate" id="endDate" data-options="editable:false"
							class="easyui-datebox" style="width:150px" /> 
					</td>
				<td style="text-align:right;background-color:#f2f2f2">物品来源:</td>
				<td>
					<select id="cwply" name="cwply" class="easyui-combobox" style="width: 100px;">
						<option value="">请选择</option>
						<option value="1">自产</option>
						<option value="2">暂存</option>
					</select>
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
		<table style="float: left;">
			<tr>
					<td>
						<button onclick="javascript:addXlsFun()">上传</button>
						<button onclick="javascript:exportSb()">导出</button>
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
			singleSelect : true,
			showHeader : true,
			title : '设备管理列表',
			fitColumns : true,
			method : "post",
			queryParams : {
				draw : 1
			},
			sortable : false,
			columns : [ [ {
				width : '150',
				title : '品名',
				field : 'pm',
				sortable : false
			} , {
				width : '100',
				title : '到货日期',
				field : 'dhrq',
				sortable : false
			} , {
				width : '80',
				title : '一级分类',
				field : 'yjfl',
				sortable : false
			} , {
				width : '80',
				title : '二级分类',
				field : 'ejfl',
				sortable : false
			}, {
				width : '80',
				title : '三级分类',
				field : 'sjfl',
				sortable : false
			}, {
				width : '60',
				title : '物品来源',
				field : 'wply',
				formatter : function(value, row, index) {
					if(row.wply=="1"){
						return "自产";
					}else{
						return "暂存";
					}
				}
			}, {
				width : '200',
				title : '运维商',
				field : 'yws',
				sortable : false
			}, {
				width : '100',
				title : '维保有效期',
				field : 'yxq',
				sortable : false
			},{
				field : 'action',
				title : '操作',
				width : 150,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					str += $.formatString('<a class="easyui-linkbutton" href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a>', row.sbid);
					str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					str += $.formatString('<a href="javascript:void(0)" onclick="viewFun(\'{0}\');" >查看</a>', row.sbid);
					str += '&nbsp;&nbsp;&nbsp;&nbsp;';
					str += $.formatString('<a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a>', row.sbid);
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
		$('#dg').datagrid('options').url = "${wsdc}/sbb/listpage.do", 
		$('#dg').datagrid(
				'load', {
					yjfl :yjfl,
					ejfl :ejfl,
					sjfl :sjfl,
					pm : $("#pm").val(),
					beginDate : $("#beginDate").datebox("getValue"),
					endDate : $("#endDate").datebox("getValue"),
					cwply: $("#cwply").combobox('getValue'),
					draw : 1,
					page : page_Number,
					rows : page_Size
				});
	}
	
	function clearFl() {
		$("#yjfl").combobox("clear");
		$("#ejfl").combobox("clear");
		$("#sjfl").combobox("clear");
		$('#pm').val('');
		$('#beginDate').datebox('clear');
		$('#endDate').datebox('clear');
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
	
	
	
	
	/*打开模态框*/
	function addFun() {
		   $("#pmg").textbox("setValue",'');
	       $("#dhrq").datebox("setValue",'');
	       $("#yjflg").textbox("setValue",'');
	       $("#ejflg").textbox("setValue",'');
	       $("#sjflg").textbox("setValue",'');
	       $("#sccs").textbox("setValue",'');
	       $("#scrq").datebox("setValue",'');
	       $("#yws").textbox("setValue",'');
	       $("#yxq").datebox("setValue",'');
	       $("#wbdh").textbox("setValue",'');
	       $("#zcxh").textbox("setValue",'');
	       $("#zcgg").textbox("setValue",'');
	       $("#wply").textbox("setValue",'');
	       $("#wplydw").textbox("setValue",'');
	       $("#zcbm").val('');
	       $("#lx").val('');
	       $("#xxcs").val('');
	       $("#sbid").val('');
	       $("#fjxs").html('');
		$('#dlg').dialog('open');
	}
	/*关闭模态框*/
	function close(){ 
    	$('#dlg').dialog('close');
    }
	/*添加*/
	function save() {
		if(!$("#dlg").form('enableValidation').form('validate')){
        	alert("请输入必填项");
        	preventDefault();
        }
		var data1 = {
 		       "pm":$("#pmg").val(),
 		       "dhrq":$("#dhrq").datebox("getValue"),
 		       "yjfl":$("#yjflg").combobox('getValue'),
 		       "ejfl":$("#ejflg").combobox('getValue'),
 		       "sjfl":$("#sjflg").combobox('getValue'),
 		       "sccs":$("#sccs").val(),
 		       "scrq":$("#scrq").datebox("getValue"),
 		       "yws":$("#yws").val(),
 		       "yxq":$("#yxq").datebox("getValue"),
 		       "wbdh":$("#wbdh").val(),
 		       "zcxh":$("#zcxh").val(),
 		       "zcgg":$("#zcgg").val(),
 		       "zcbm":$("#zcbm").val(),
 		       "xxcs":$("#xxcs").val(),
 		       "wply":$("#wply").combobox('getValue'),
 		       "wplydw":$("#wplydw").val(),
 		       "lx":$("#lx").val(),
 		       "sbid":$("#sbid").val()
 		       }

 	$.ajaxFileUpload({
         type: "post",
         url: "${wsdc}/sbb?cmd=savesb",
         secureuri : false,//安全协议  
	        fileElementId:'btn',//id 		
         data: data1,
         datatype: "text",//"xml", "html", "script", "json", "jsonp", "text".
         success: function (data) {
			  alert("保存成功");
			  close();
			  search();
         
     	},
         error: function (XMLHttpRequest, textStatus, errorThrown) {
             alert(XMLHttpRequest.status);
             alert(XMLHttpRequest.readyState);
             alert(textStatus);
         },
         complete: function (XMLHttpRequest, textStatus) {
             this; // 调用本次AJAX请求时传递的options参数

         }

     });
	}
	
	/*删除*/
	function deleteFun(id) {
		parent.$.messager.confirm('询问', '您是否要删除设备信息？',
				function(b) {
					if (b) {
						progressLoad();
						$.post('${wsdc}/sbb/deleteSb.do', {
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
			url: "${wsdc}/sbb/show.do?id="+id,
            contentType: "application/json;charset=utf-8",
            datatype: "json",
            type: "GET",
            success: function (data) {
            	if(data.success) {
            		var t = data.t;
            		$("#fjxs").html('');
            		if(null != t.sbid) {
            			$("#sbid").val(t.sbid);
            		}
            		if(null != t.pm) {
            			$("#pmg").textbox('setValue',t.pm);
            		}
            		if(null != t.dhrq) {
            			$("#dhrq").datebox("setValue",t.dhrq);;
            		}
            		if(null != t.yjfl) {
            			$("#yjflg").combobox('setValue',t.yjfl);
            		}
            		if(null != t.ejfl) {
            			$("#ejflg").combobox('setValue',t.ejfl);
            		}
            		if(null != t.sjfl) {
            			$("#sjflg").combobox('setValue',t.sjfl);
            		}
            		if(null != t.sccs) {
            			$("#sccs").textbox('setValue',t.sccs);
            		}
            		if(null != t.scrq) {
            			$("#scrq").datebox('setValue',t.scrq);
            		}
            		if(null != t.yws) {
            			$("#yws").textbox('setValue',t.yws);
            		}
            		if(null != t.yxq) {
            			$("#yxq").datebox('setValue',t.yxq);
            		}
            		if(null != t.wbdh) {
            			$("#wbdh").textbox('setValue',t.wbdh);
            		}
            		if(null != t.zcxh) {
            			$("#zcxh").textbox('setValue',t.zcxh);
            		}
            		if(null != t.zcgg) {
            			$("#zcgg").textbox('setValue',t.zcgg);
            		}
            		if(null != t.wply) {
            			$("#wply").combobox('setValue',t.wply);
            		}
            		if(null != t.wplydw) {
            			$("#wplydw").textbox('setValue',t.wplydw);
            		}
            		if(null != t.lx) {
            			$("#lx").val(t.lx);
            		}
            		if(null != t.xxcs&&''!=t.xxcs) {
            			$("#xxcs").val(t.xxcs);
            			$("#fjxs").append("<div id='cs"+t.xxcs+"'>"+t.xxcs+"&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"${wsdc}/resources/file/"+t.xxcs+"\" target='_blank'>查看</a><div>")
            		}
            		if(null != t.zcbm) {
            			$("#zcbm").val(t.zcbm);
            		}
            		$('#dlg').dialog('open');
            	}
            }
		})
	}
	
	function viewFun(id) {
		$.ajax({
			url: "${wsdc}/sbb/editShow.do?id="+id,
            contentType: "application/json;charset=utf-8",
            datatype: "json",
            type: "GET",
            success: function (data) {
            	if(data.success) {
            		var t = data.t;
            		$("#vfjxs").html('');
            		if(null != t.pm) {
            			$("#vpmg").textbox('setValue',t.pm);
            		}
            		if(null != t.dhrq) {
            			$("#vdhrq").textbox("setValue",t.dhrq);;
            		}
            		if(null != t.yjfl) {
            			$("#vyjflg").textbox('setValue',t.yjfl);
            		}
            		if(null != t.ejfl) {
            			$("#vejflg").textbox('setValue',t.ejfl);
            		}
            		if(null != t.sjfl) {
            			$("#vsjflg").textbox('setValue',t.sjfl);
            		}
            		if(null != t.sccs) {
            			$("#vsccs").textbox('setValue',t.sccs);
            		}
            		if(null != t.scrq) {
            			$("#vscrq").textbox('setValue',t.scrq);
            		}
            		if(null != t.yws) {
            			$("#vyws").textbox('setValue',t.yws);
            		}
            		if(null != t.yxq) {
            			$("#vyxq").textbox('setValue',t.yxq);
            		}
            		if(null != t.wbdh) {
            			$("#vwbdh").textbox('setValue',t.wbdh);
            		}
            		if(null != t.zcxh) {
            			$("#vzcxh").textbox('setValue',t.zcxh);
            		}
            		if(null != t.wply) {
            			$("#vwply").textbox('setValue',t.wply);
            		}
            		if(null != t.wplydw) {
            			$("#vwplydw").textbox('setValue',t.wplydw);
            		}
            		if(null != t.zcgg) {
            			$("#vzcgg").textbox('setValue',t.zcgg);
            		}
            		if(null != t.wply) {
            			if(t.wply=="1"){
            				$("#vwply").textbox('setValue',"自产");
            			}else{
            				$("#vwply").textbox('setValue',"暂存");
            			}
            			
            		}
            		if(null != t.wplydw) {
            			$("#vwplydw").textbox('setValue',t.wplydw);
            		}
            		if(null != t.xxcs&&''!=t.xxcs) {
            			$("#vfjxs").append("<div id='cs"+t.xxcs+"'>"+t.xxcs+"&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"${wsdc}/resources/file/"+t.xxcs+"\" target='_blank'>查看</a><div>")
            		}
            		$('#vdlg').dialog('open');
            	}
            }
		})
	}
	function vclose(){ 
    	$('#vdlg').dialog('close');
    }
	/*加载*/
	$(document).ready(function () {
	    search();
	    selectFl("jcss");
	});
	
	//======================================================
	//xls文件上传  打开模态框
	function addXlsFun(){
		$('#xls').dialog('open');	
	}
	
	function downloadTemplate(){
		alert("请稍后。。。");
	}
	 function importEmp(){  
		    //检验导入的文件是否为Excel文件   
	    var excelPath = document.getElementById("excelPath").value;  
	    if(excelPath == null || excelPath == ''){  
	        alert("请选择要上传的Excel文件");  
	        return;  
	    }else{  
	        var fileExtend = excelPath.substring(excelPath.lastIndexOf('.')).toLowerCase();   
	        if(fileExtend == '.xls' | fileExtend == '.xlsx'){  
	        }else{  
	            alert("文件格式需为'.xlsx'格式或'.xls'格式");  
	            return;  
	        }  
	    }  
	     var formData = new FormData($( "#dlgFormXls" )[0]);
	    /*  $.ajax({
            type: "post",
            url: "${wsdc}/xls/importXls.do",
            dataType: "text",
            data: formData,
             //必须false才会自动加上正确的Content-Type   
         	contentType : false, 
            // 必须false才会避开jQuery对 formdata 的默认处理   
             // XMLHttpRequest会对 formdata 进行正确的处理   
             
            processData : false,
            success: function(data){//从后端返回数据进行处理
              if(data){
                  alert("上传成功！");
              }else{
                  alert("上传失败！");
              }
            },
            error: function(err) {//提交出错
                $("#msg").html(JSON.stringify(err));//打出响应信息
                alert("服务器无响应");
              }
          });   */
	   
		
		
	  /*   $.ajaxFileUpload({
	         type: "post",
	         url: "${wsdc}/xls/importExcelA",
	         secureuri : false,//安全协议  
		        fileElementId:'excelPath',//id 		
	         datatype: "text",//"xml", "html", "script", "json", "jsonp", "text".
	         success: function () {
				  alert("保存成功");
				  close();
				  search();
	         
	     	},
	         error: function (XMLHttpRequest, textStatus, errorThrown) {
	             alert(XMLHttpRequest.status);
	             alert(XMLHttpRequest.readyState);
	             alert(textStatus);
	         },
	         complete: function (XMLHttpRequest, textStatus) {
	             this; // 调用本次AJAX请求时传递的options参数

	         }

	     });    */
	 }
	 
	 function submitExcel(){
	 
		  $("#button-import").upload({
				action:"${wsdc}/xls/importExcel",//提交的后台路径
				name:"xls" //提交的文件的键
			});
	 }
	//ajax 方式上传文件操作    
     $(document).ready(function(){    
        $('#btn').click(function(){    
            if(checkData()){    
                $('#form1').ajaxSubmit({      
                    url:'uploadExcel/ajaxUpload.do',    
                    dataType: 'text',    
                    success: resutlMsg,    
                    error: errorMsg    
                });     
                function resutlMsg(msg){    
                      
                   //document.write(msg.data);  
                   var data = JSON.parse(msg.replace(/\\n/g,'</br>'))  
                   $('body').append('<span>' + data.data + '</span>');  
                    $("#upfile").val("");    
                }    
                function errorMsg(err){     
                    alert("导入excel出错！");        
                }    
            }    
        });    
     });    
         
     //JS校验form表单信息    
     function checkData(){    
        var fileDir = $("#upfile").val();    
        var suffix = fileDir.substr(fileDir.lastIndexOf("."));    
        if("" == fileDir){    
            alert("选择需要导入的Excel文件！");    
            return false;    
        }    
        if(".xls" != suffix && ".xlsx" != suffix ){    
            alert("选择Excel格式的文件导入！");    
            return false;    
        }    
        return true;    
     } 
     
     
 	/** 导出*/
 	function exportSb(){
 		var pm=$("#pm").textbox("getValue");
 		var beginDate=$("#beginDate").datebox("getValue");
 		var endDate=$("#endDate").datebox("getValue");
 		var yjfl=$("#yjfl").combobox("getValue");
 		var ejfl=$("#ejfl").combobox("getValue");
 		var sjfl=$("#sjfl").combobox("getValue");
 		var cwply = $("#cwply").combobox('getValue');
 		location.href="${wsdc}/sbb/sbxxExport.do?pm="+pm+"&beginDate="
 				+beginDate+"&endDate="+endDate+"&yjfl="+yjfl+"&ejfl="+ejfl+"&sjfl="+sjfl+"&cwply="+cwply;
 	}
</script>


<div id="xls" class="easyui-dialog" style="width: 400px; height: 200px;" closed="true" buttons="#dlg-buttons" title="设备管理">
	
	  <form method="POST"  enctype="multipart/form-data" id="form1" name="xls" action="${wsdc}/xls/importX.do">    
        <div>  
            
            <div>下载模版：  </div> 
            <div> <a href="${wsdc}/sbb/download/cors.xlsx">下载文件</a></div>
   			<!-- <div><a href="javascript:void(0)" class="easyui-linkbutton"  onclick="downloadTemplate()">下载模板文件</a></div> -->
            <div>上传Excel表格: </div> 
            <div><input id="xls" type="file" name="xls"></div>     
        	 <div><input type="submit" value="提交" onclick="return checkData()"></div>  
            <!-- <div><input type="button" value="ajax方式提交" id="btn" name="btn" ></div>  -->     
        </div>      
    </form>    
   </div>
<!-- 添加编辑模态框 -->
<div id="dlg" class="easyui-dialog" style="width: 500px; height: 500px;" closed="true" buttons="#dlg-buttons" title="设备管理">
	<form action="" id="dlgForm">
		<table style="margin:auto">
			<tr>
				<td>品名</td>
				<td>
					<input id="pmg" name="pmg" type="text" class="easyui-textbox" data-options="required:true">
					<input type="hidden" id="sbid" name="sbid" />
					<input type="hidden" id="zcbm" name="zcbm" />
					<input type="hidden" id="lx" name="lx" />
				</td>
			</tr>
			<tr>
				<td>一级分类</td>
				<td><select class="easyui-combobox" id="yjflg" name="yjflg" style="width: 150px; height: 20px;" data-options="required:true"></select></td>
			</tr>
			<tr>
				<td>二级分类</td>
				<td><select data-options="editable:false,required:true" class="easyui-combobox" id="ejflg" name="ejflg" style="width: 150px; height: 20px;"></select></td>
			</tr>
			<tr>
				<td>三级分类</td>
				<td><select data-options="editable:false" class="easyui-combobox" id="sjflg" name="sjflg" style="width: 150px; height: 20px;"></select></td>
			</tr>
			<tr>
				<td>到货日期</td>
				<td>
					<input id="dhrq" name="dhrq" type="text" class="easyui-datebox" data-options="editable:false">
				</td>
			</tr>
			<tr>
				<td>生产厂商</td>
				<td>
					<input id="sccs" name="sccs" type="text" class="easyui-textbox" >
				</td>
			</tr>
			<tr>
				<td>生产日期</td>
				<td>
					<input id="scrq" name="scrq" type="text" class="easyui-datebox" data-options="editable:false">
				</td>
			</tr>
			<tr>
				<td>运维商</td>
				<td>
					<input id="yws" name="yws" type="text" class="easyui-textbox" >
				</td>
			</tr>
			<tr>
				<td>维保电话</td>
				<td>
					<input id="wbdh" name="wbdh" type="text" class="easyui-textbox" >
				</td>
			</tr>
			<tr>
				<td>维保有效期</td>
				<td>
					<input id="yxq" name="yxq" type="text" class="easyui-datebox" data-options="editable:false">
				</td>
			</tr>
			<tr>
				<td>资产型号</td>
				<td>
					<input id="zcxh" name="zcxh" type="text" class="easyui-textbox" >
				</td>
			</tr>
			<tr>
				<td>资产规格</td>
				<td>
					<input id="zcgg" name="zcgg" type="text" class="easyui-textbox" >
				</td>
			</tr>
			<tr>
				<td>物品来源</td>
				<td>
					<select id="wply" name="wply" class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto',editable:false,required:true">
						<option value="1">自产</option>
						<option value="2">暂存</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>物品来源单位</td>
				<td>
					<input id="wplydw" name="wplydw" type="text" class="easyui-textbox" >
				</td>
			</tr>
			<tr>
				<td>详细规格参数附件</td>
				<td>
                    <input type="file" name="btn" id="btn" >
                    <input type="hidden" name="xxcs" id="xxcs" />
                    <div id="fjxs">
	                   
                      </div>
                </td>
            </tr>
		</table>
	</form>
	<div id="dlg-buttons" style="text-align: center;">
		<a href="javascript:save();" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">保存</a> 
		<a href="javascript:close();" class="easyui-linkbutton" iconCls="icon-cancel" onclick="close();" style="width: 90px">关闭</a>
	</div>
</div>

<div id="vdlg" class="easyui-dialog" style="width: 500px; height: 500px;" closed="true" buttons="#vdlg-buttons" title="设备管理">
		<table style="margin:auto">
			<tr>
				<td>品名</td>
				<td>
					<input id="vpmg" name="vpmg" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>一级分类</td>
				<td>
					<input id="vyjflg" name="vyjflg" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>二级分类</td>
				<td>
					<input id="vejflg" name="vejflg" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>三级分类</td>
				<td>
					<input id="vsjflg" name="vsjflg" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>到货日期</td>
				<td>
					<input id="vdhrq" name="vdhrq" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>生产厂商</td>
				<td>
					<input id="vsccs" name="vsccs" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>生产日期</td>
				<td>
					<input id="vscrq" name="vscrq" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>运维商</td>
				<td>
					<input id="vyws" name="vyws" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>维保电话</td>
				<td>
					<input id="vwbdh" name="vwbdh" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>维保有效期</td>
				<td>
					<input id="vyxq" name="vyxq" type="text" class="easyui-textbox" readonly="readonly" >
				</td>
			</tr>
			<tr>
				<td>资产型号</td>
				<td>
					<input id="vzcxh" name="vzcxh" type="text" class="easyui-textbox" readonly="readonly" >
				</td>
			</tr>
			<tr>
				<td>资产规格</td>
				<td>
					<input id="vzcgg" name="vzcgg" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>物品来源</td>
				<td>
					<input id="vwply" name="vwply" type="text" class="easyui-textbox"  readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>物品来源单位</td>
				<td>
					<input id="vwplydw" name="vwplydw" type="text" class="easyui-textbox" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>详细规格参数附件</td>
				<td>
               		<div id="vfjxs">
	                   
                      </div>
                </td>
            </tr>
		</table>
</div>
<div id="vdlg-buttons" style="text-align: center;">
	<a href="javascript:vclose();" class="easyui-linkbutton" iconCls="icon-cancel" onclick="vclose();" style="width: 90px">关闭</a>
</div>
