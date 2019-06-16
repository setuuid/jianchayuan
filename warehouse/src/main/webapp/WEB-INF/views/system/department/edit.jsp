<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/includes.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<link rel="stylesheet" href="${wsdc}/css/bootstrap.min.css">
<link rel="stylesheet" href="${wsdc}/css/common.css"/>
<style>
.panel-head{

    line-height: 17px;
    color: #15428b;
    font-weight: bold;
    font-size: 12px;
    background: url('${wsdc}/resources/js/themes/default/images/panel_title.png') repeat-x;
    position: relative;
    border: 1px solid #99BBE8;
}
</style>
<div class="container" style="width:100%">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
             <div class="panel-head">
					<p style="padding-top: 7px;padding-left: 10px;">
						<span class="panel-title" style="color: #182b56;font-family: Tahoma,Verdana,微软雅黑,新宋体;font-size: 12px; ">新建部门 </span>
					</p>
					</div>
               
                <form:form id="departmentForm" commandName="departmentForm"
                           action="" method="post">
                    <table class="table table-condensed">
                        <tr>
                            <th class="text-center">部门机构代码</th>
                            <th>
                                <div class="col-md-3">
                                    <form:input id="department_id" path="department_id"
                                                cssClass="form-control input-sm"/>
                                               
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th class="text-center">部门名称</th>
                            <th>
                                <div class="col-md-3">
                                    <form:input id="department_name" path="department_name"
                                                cssClass="form-control input-sm"/>
                                                <form:hidden id="parent_id" path="parent_id"/>
                                   
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th class="text-center">序号</th>
                            <th>
                                <div class="col-md-3">
                                    <form:input id="department_order" path="department_order"
                                                cssClass="form-control input-sm"/>
                                </div>
                            </th>
                        </tr>
                          <tr>
                            <th class="text-center">是否为督察部门</th>
                            <th>
                                <div class="col-md-3">
                                  <form:select id="isdcdw" path="isdcdw" hideName="isdcdw"
                                                 class="form-control input-sm">
                                                  <form:option value="">请选择</form:option>
                                                 <form:option value="N">否</form:option>
                                        <form:option value="Y">是</form:option>
                                        
                                    </form:select>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center">
                                <button type="submit" class="btn btn-primary btn-xs"
                                        onclick="doSubmit();">
                                    <span class="glyphicon glyphicon-save"></span> 保 存
                                </button>
                                <a
                                        href="${wsdc}/department/selectDepartmentByParentId.do?parentId=${departmentForm.parent_id}"
                                        class="btn btn-primary btn-xs"><span
                                        class="glyphicon glyphicon-share-alt"></span> 返 回</a>
                            </th>
                        </tr>
                    </table>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function doSubmit() {
        validateForm();//调用验证方法
    }
    function validateForm() {
        $("#departmentForm").validate({
            submitHandler: function (form) {
                if (confirm("确认执行该操作吗？")) {
                    ajaxSubmitForm();//验证通过之后会去调用的方法
                }
            },
            rules: {
                department_code: {
                    required: true,
                    rangelength: [1, 50],
                    remote: {
                        type: "POST",
                        url: "${wsdc}/department/checkCode.do",
                        data: {
                            department_code: function () {
                                return $("#department_code").val();
                            }
                        }
                    }
                },
                department_name: {
                    required: true,
                    rangelength: [1, 50]
                },
                department_order: {
                    required: true,
                    digits: true,
                    rangelength: [1, 2]
                }
            }
        });
    }
    function ajaxSubmitForm() {
        $.ajax({
            type: "POST",
            url: "${wsdc}/department/departmentEdit.do",
            data: $('#departmentForm').serialize(),
            async: false,
            success: function (data) {
                //alert(data);
               window.location= "${wsdc}/department/selectDepartmentByParentId.do?parentId=${departmentForm.parent_id}";
                //window.parent.location = "${wsdc}/department/department.do";
            }
        });
    }
</script>

