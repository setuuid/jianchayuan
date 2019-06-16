<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/includes.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<link rel="stylesheet" href="${wsdc}/css/bootstrap.min.css">
<link rel="stylesheet" href="${wsdc}/css/common.css"/>

<script src="${wsdc}/js/jquery-1.10.1.js" type="text/javascript"></script>
<script src="${wsdc}/js/jquery-form.js" type="text/javascript"></script>
<script src="${wsdc}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${wsdc}/js/respond.js" type="text/javascript"></script>
<script src="${wsdc}/js/jquery.validate.js" type="text/javascript"></script>
<script src="${wsdc}/js/messages_cn.js" type="text/javascript"></script>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">新建字典</div>
                <form:form id="dictionaryForm" commandName="dictionaryForm"
                           action="" method="post">
                    <table class="table table-condensed">
                        <tr>
                            <th>字典编码</th>
                            <td>
                                <div class=" col-xs-4">
                                    <c:choose>
                                        <c:when test="${not empty dictionaryForm.dictionary_code}">
                                            ${dictionaryForm.dictionary_code}
                                        </c:when>
                                        <c:otherwise>
                                            <form:input id="dictionary_code" path="dictionary_code"
                                                        cssClass="form-control input-sm"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <form:hidden id="parent_id" path="parent_id"/>
                                    <form:hidden id="dictionary_id" path="dictionary_id"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>字典名称</th>
                            <th>
                                <div class=" col-xs-4">
                                    <form:input id="dictionary_name" path="dictionary_name"
                                                cssClass="form-control input-sm"/>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>序号</th>
                            <th>
                                <div class=" col-xs-4">
                                    <form:input id="dictionary_order" path="dictionary_order"
                                                cssClass="form-control input-sm"/>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center"><security:authorize
                                    ifAnyGranted="ROLE_SYSTEM_SYS_DIC_ADD">
                                <button type="submit" class="btn btn-primary btn-xs"
                                        onclick="doSubmit();">
                                    <span class="glyphicon glyphicon-save"></span> 保存
                                </button>
                            </security:authorize> <a
                                    href="${wsdc}/dictionary/selectDictionaryByParentId.do?parentId=${dictionaryForm.parent_id}"
                                    class="btn btn-primary btn-xs"><span
                                    class="glyphicon glyphicon-share-alt"></span> 返回</a></th>
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
        $("#dictionaryForm").validate({
            submitHandler: function (form) {
                if (confirm("确认执行该操作吗？")) {
                    ajaxSubmitForm();//验证通过之后会去调用的方法
                }
            },
            rules: {
                dictionary_code: {
                    required: true,
                    rangelength: [1, 50],
                    remote: {
                        type: "POST",
                        url: "${wsdc}/dictionary/checkCode.do",
                        data: {
                            dictionary_code: function () {
                                return $("#dictionary_code").val();
                            }
                        }
                    }
                },
                dictionary_name: {
                    required: true,
                    rangelength: [1, 50]
                },
                dictionary_order: {
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
            url: "${wsdc}/dictionary/dictionaryEdit.do",
            data: $('#dictionaryForm').serialize(),
            async: false,
            success: function (data) {
                alert(data);
                //window.location = "${wsdc}/dictionary/selectDictionaryByParentId.do?parentId="+$("#parent_id").val();
                window.parent.location = "${wsdc}/dictionary/dictionary.do";
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 403) {
                    window.location = "${wsdc}/jsp/403.do";
                }
            }
        });
    }
</script>
<script src="${wsdc}/js/common.js" type="text/javascript"></script>
