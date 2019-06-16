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
						<span class="panel-title" style="color: #182b56;font-family: Tahoma,Verdana,微软雅黑,新宋体;font-size: 12px; ">编辑角色 </span>
					</p>
					</div>
               
                <form:form id="roleForm" commandName="roleForm" action=""
                           method="post">
                    <table class="table table-condensed">
                        <tr>
                            <th class="text-center">角色名称</th>
                            <th>
                                <div class=" col-md-4">
                                    <form:input id="role_name" path="role_name"
                                                cssClass="form-control input-sm"/>
                                    <form:hidden id="role_id" path="role_id"/>
                                </div>
                            </th>
                        </tr>
                        <tr>
                        	<th class="text-center">部门</th>
							<th>
								<div class="col-md-3">
                                    <form:input id="department_name" path="department_name"
                                                class="form-control input-sm" readonly="true"/>
                                    <form:hidden id="department_id" path="department_id"/>
                                </div>
                                <div class="col-md-3">
				                     <input type="button" class="btn btn-primary btn-md" value="选择部门" onclick="javascirpt:selectDept('department_name','department_id')"/>
				                </div>
							</th>
						</tr>
						<c:choose>
							<c:when test="${roleLevel=='系统管理员'}">
								<tr>
		                            <th class="text-center">角色级别</th>
		                            <th>
		                                <div class="col-md-3">
		                                    <form:select id="role_level" path="role_level" hideName="role_level"
		                                                 class="form-control input-sm">
		                                        <form:option value="0">系统管理员</form:option>
		                                        <form:option value="1">子管理员</form:option>
		                                        <form:option value="2">普通用户</form:option>
		                                    </form:select>
		                                </div>
		                            </th>
		                        </tr>
							</c:when>
							<c:otherwise>
								<tr>
		                            <th class="text-center">角色级别</th>
		                            <th>
		                                <div class="col-md-3">
		                                    <form:select id="role_level" path="role_level" hideName="role_level"
		                                                 class="form-control input-sm">
		                                        <form:option value="2">普通用户</form:option>
		                                    </form:select>
		                                </div>
		                            </th>
		                        </tr>
							</c:otherwise>
						</c:choose>
                        <tr>
                            <th colspan="2" class="text-center">
                                <button type="submit" class="btn btn-primary btn-xs"
                                        onclick="doSubmit();">
                                    <span class="glyphicon glyphicon-save"></span> 保 存
                                </button>
                                <a href="${wsdc}/role/query.do" class="btn btn-primary btn-xs"><span
                                        class="glyphicon glyphicon-share-alt"></span> 返 回</a>
                            </th>
                        </tr>
                    </table>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${wsdc}/resources/scripts/dept/dept.js"></script>

<script type="text/javascript">
    function doSubmit() {
        validateForm();//调用验证方法
    }
    function validateForm() {
        $("#roleForm").validate({
            submitHandler: function (form) {
                if (confirm("确认执行该操作吗？")) {
                    ajaxSubmitForm();//验证通过之后会去调用的方法
                }
            },
            rules: {
                role_name: {
                    required: true,
                    rangelength: [1, 50]
                },
                department_name: {
                	required: true
                },
                role_level: {
                	remote: {
                        type: "POST",
                        url: "${wsdc}/role/checkCode.do",
                        data: {
                            role_level: function () {
                                return $("#role_level").val();
                            },
                            department_id: function () {
                            	return $("#department_id").val();
                            },
                            role_id: function (){
                            	return $("#role_id").val();
                            }
                        }
                    }
                }
            }
        });
    }
    function ajaxSubmitForm() {
        $.ajax({
            type: "POST",
            url: "${wsdc}/role/roleEdit.do",
            data: $('#roleForm').serialize(),
            async: false,
            success: function (data) {
                alert(data);
                window.location = "${wsdc}/role/query.do";
            }
        });
    }
</script>
<script src="${wsdc}/js/common.js" type="text/javascript"></script>
