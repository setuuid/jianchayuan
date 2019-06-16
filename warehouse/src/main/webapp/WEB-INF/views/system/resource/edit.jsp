<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/includes.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<link rel="stylesheet" href="${wsdc}/css/bootstrap.min.css"/>
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
						<span class="panel-title" style="color: #182b56;font-family: Tahoma,Verdana,微软雅黑,新宋体;font-size: 12px; ">新建权限 </span>
					</p>
					</div>
               
                <form:form id="resourceForm" commandName="resourceForm"
                           action="${wsdc}/resource/resourceEdit.do" method="post">
                    <table class="table table-condensed">
                        <tr>
                            <th>权限编码</th>
                            <th>
                                <div class=" col-xs-8">
                                    <c:choose>
                                        <c:when test="${not empty resourceForm.resource_code}">
                                            ${resourceForm.resource_code}
                                        </c:when>
                                        <c:otherwise>
                                            <form:input id="resource_code" path="resource_code"
                                                        cssClass="form-control input-sm"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <form:hidden id="parent_id" path="parent_id"/>
                                    <form:hidden id="resource_id" path="resource_id"/>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>模块名称</th>
                            <th>
                                <div class=" col-xs-8">
                                    <form:input id="resource_name" path="resource_name"
                                                cssClass="form-control input-sm"/>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>类型</th>
                            <th>
                                <div class=" col-xs-8">
                                    <form:select id="type" path="type" cssClass="form-control">
                                        <form:option value="RESOURCE_TYPE_COMMON">通用资源</form:option>
                                        <form:option value="RESOURCE_TYPE_MENU">菜单资源</form:option>
                                        <form:option value="RESOURCE_TYPE_REQUEST">请求资源</form:option>
                                    </form:select>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>资源</th>
                            <th>
                                <div class=" col-xs-8">
                                    <form:input id="value" path="value"
                                                cssClass="form-control input-sm"/>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center">
                                <button type="submit" class="btn btn-primary btn-xs">
                                    <span class="glyphicon glyphicon-save"></span> 保存
                                </button>
                                <a
                                        href="${wsdc}/resource/selectResourceByParentId.do?parentId=${resourceForm.parent_id}"
                                        class="btn btn-primary btn-xs"><span
                                        class="glyphicon glyphicon-share-alt"></span> 返回</a>
                            </th>
                        </tr>
                    </table>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#resourceForm").validate({
        rules: {
            resource_code: {
                required: true,
                rangelength: [1, 50],
                remote: {
                    type: "POST",
                    url: "${wsdc}/resource/checkCode.do",
                    data: {
                        resource_code: function () {
                            return $("#resource_code").val();
                        }
                    }
                }
            },
            resource_name: {
                required: true,
                rangelength: [1, 50]
            },
            type: {
                required: true
            },
            value: {
                required: true,
                rangelength: [1, 100]
            }
        }
    });
</script>

