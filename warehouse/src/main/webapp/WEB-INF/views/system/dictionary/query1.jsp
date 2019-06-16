<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="wsdc" value="${pageContext.request.contextPath}" />
<!-- <style>
.panel-head{

    line-height: 17px;
    color: #15428b;
    font-weight: bold;
    font-size: 12px;
    background: url('${wsdc}/resources/js/themes/default/images/panel_title.png') repeat-x;
    position: relative;
    border: 1px solid #99BBE8;
}
</style> -->
<!-- 会话 -->
<div id="dialog" class="modal fade">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">字典信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" name="form1" id="form1">
                    <div class="form-group">
                        <label class="col-md-3 control-label">字典代码</label>

                        <div class="col-md-9">
                            <input type="text" class="form-control" name="dm" id="dm" >
                            <input type="hidden" class="form-control" id="ywlsh">
                           
                        </div>
                        
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">名称</label>

                        <div class="col-md-9">
                            <input name="mc" id="mc" class="form-control" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">拼音码</label>

                        <div class="col-md-9">
                            <input type="text" class="form-control" name="pym" id="pym">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">字典类型</label>

                        <div class="col-md-9">
                            <input type="text" class="form-control" name="zdlx" id="zdlx">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">案件类型</label>

                        <div class="col-md-9">
                            <input type="text" class="form-control" name="ajlx" id="ajlx">
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-offset-2 col-md-6">
                    <button type="submit" class="btn btn-primary">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
</div>

<!-- /.modal 模态框-->
<div class="panel panel-primary">
<div class="panel-head">
					<p style="padding-top: 7px;padding-left: 10px;">
						<span class="panel-title" style="color: #182b56;font-family: Tahoma,Verdana,微软雅黑,新宋体;font-size: 12px; ">字典表查询 </span>
					</p>
					</div>
   
    <div class="panel-body">
        <form class="form-horizontal">
           
            <div class="form-group  col-md-6">
                <label class="control-label col-md-3">字典类型:</label>

                <div class="col-md-4">
                    <input type="text" class="form-control" name="zdlx_s" id="zdlx_s" > 
               
                </div>
                
            </div>
        </form>

    </div>
    <div class="panel-footer">
        <div class="row">
            <div class="col-md-2 col-md-offset-5">
                <button class="btn btn-primary" onclick="javascript:search()">查询</button>
            </div>
        </div>
    </div>
</div>

<div class="panel panel-primary">
   <div class="panel-head">
					<p style="padding-top: 7px;padding-left: 10px;">
						<span class="panel-title" style="color: #182b56;font-family: Tahoma,Verdana,微软雅黑,新宋体;font-size: 12px; ">字典表查询列表 </span>
					</p>
					</div>
    <div class="panel-body">
        <button type="button" class="btn btn-primary btn-xs" id="zbxxcreate">
            <span class="glyphicon glyphicon-plus"></span>新建
        </button>
    </div>
    <table id="zbxxs"
           class="table table-striped table-condensed table-hover" width="100%">
       <!--  <thead>
        <tr>
            <th>业务流水号</th>
            <th>代码</th>
            <th>名称</th>
            <th>拼音码</th>
            <th>字典类型</th>
            <th>案件类型</th>
            <th>操作</th>
        </tr>
        </thead> -->
    </table>
</div>
<script type="text/javascript">
<script type="text/javascript">
var treeGrid;
$(function() {
	treeGrid = $('#zbxxs').treegrid({
		url : '${wsdc}/dictionary/querylist.do',
		idField : 'id',
		treeField : 'name',
		parentField : 'pid',
		fit : true,
		fitColumns : false,
		border : false,
		onLoadSuccess: function () {
			$('#zbxxs').treegrid('collapseAll')
		},
		frozenColumns : [ [ {
			title : '业务流水号',
			field : 'department_code',
			width : 150,
		} ] ],
		columns : [ [ {
			field : 'name',
			title : '代码',
			width : 150,
		}, {
			field : 'department_order',
			title : '拼音码',
			width : 150,
		}, {
			field : 'isDel',
			title : '字典类型',
			width : 150,
		},{
			field : '案件类型',
			title : '父级',
			width : 100,
			hidden: true
		},  {
			field : 'action',
			title : '操作',
			width : 80,
			formatter : function(value, row, index) {
				var str = '&nbsp;';
				str += $.formatString('<a class="easyui-linkbutton" href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
				str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
				str += $.formatString('<a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
				return str;
			}
		} ] ],
		toolbar : '#toolbar'
	});
	
});
/*  */

    var $zbxxs;
    var $zbxxDialog;

    function del(ywlsh) {
        if (window.confirm('你确定要删除该记录！')) {
            $.ajax({
                url: "dictionarydelete.do?ywlsh=" + ywlsh,
                contentType: "application/json",
                success: function (data) {
                    if (data.success == true) {
                        alert("删除成功!")
                        $zbxxs.ajax.reload();
                    } else {
                        alert("任务删除失败！")
                    }
                }
            });
            return true;
        } else {
        	preventDefault();
        }
    }

    function edit(iidd, dm, mc, pym, zdlx, ajlx) {
        $("#ywlsh").val(iidd);
        $("#dm").val(dm);
        $("#mc").val(mc);
        $("#pym").val(pym);
        $("#zdlx").val(zdlx);
        if(ajlx!="null"){
        $("#ajlx").val(ajlx);}
        $("#dialog").modal('show');
    }
    function save() {
        var data = new Object();
        
        data["iidd"] = $("#ywlsh").val();
        data["dm"] = $("#dm").val();
        data["mc"] = $("#mc").val();
        data["pym"] = $("#pym").val();
        data["zdlx"] = $("#zdlx").val();
        data["ajlx"] = $("#ajlx").val();

        $.ajax({
            url: "dictionarycreate.do",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: function (data) {
                if (data.success == true) {
                    $("#dialog").modal('hide');
                    $zbxxs.ajax.reload();
                    if($("#ywlsh").val()==""){
                    alert("添加成功！");}else{
                    	alert("修改成功！");
                    }
                } else {
                	alert(data.error);
                }
            }
        });
    }

    $(function () {

        $("#zbxxcreate").click(function () {
            $("#ywlsh").val("");
            $("#dm").val("");
            $("#mc").val("");
            $("#pym").val("");
            $("#zdlx").val("");
            $("#ajlx").val("");
            $("#dialog").modal('show');

        });

    });
    function init() {
        $zbxxs = $('#zbxxs')
                .DataTable(
                {
                    serverSide: true,
                    ajax: {
                        method: "POST",
                        url: "dictionarylist.do",
                        contentType: "application/x-www-form-urlencoded",
                        "data": function (d) {
                            //添加额外的参数传给服务器
                           
                            d.zdlx = $('#zdlx_s').val();
                        }

                    },
                    columns: [{
                        data: "iidd"
                    }, {
                        data: "dm"
                    }, {
                        data: "mc"
                    }, {
                        data: "pym"
                    }, {
                        data: "zdlx"
                    }, {
                        data: "ajlx"
                    }, {
                        data: null
                    }],
                    columnDefs: [
                       
                        {
                            "render": function (data, type, row,
                                                meta) {

                                var edit = '<button type="button" class="btn btn-primary btn-sm" onclick="edit('
                                        + '\''
                                        + data.iidd
                                        + '\''
                                        + ","
                                        + '\''
                                        + data.dm
                                        + '\''
                                        + ","
                                        + '\''
                                        + data.mc
                                        + '\''
                                        + ","
                                        + '\''
                                        + data.pym
                                        + '\''
                                        + ","
                                        + '\''
                                        + data.zdlx
                                        + '\''
                                        + ","
                                        + '\''
                                        + data.ajlx
                                        + '\'' + ')">修改</button>';
                                var del = '<button type="button" class="btn btn-danger btn-sm" onclick="del(\''
                                        + data.iidd
                                        + '\')">删除</button>';
                                return edit + del;

                            },
                            "targets": 6
                        }]

                });
    }

    function search() {
        $zbxxs.ajax.reload();
    }

    $(document).ready(function () {
        init();
    });

</script>
<script type="text/javascript">
    $(function () {
    	
    	
        var validator = $("#form1").validate({
            rules: {
                dm: {required:true},
                mc: {required:true},
                pym: {required:true},
                zdlx: {required:true}
              
            },
            submitHandler: function (form) {
                save();
            }
        });

    })
    
</script>