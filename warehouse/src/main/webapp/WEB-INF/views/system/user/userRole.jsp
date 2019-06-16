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
						<span class="panel-title" style="color: #182b56;font-family: Tahoma,Verdana,微软雅黑,新宋体;font-size: 12px; ">配置角色 </span>
					</p>
					</div>
               
                <table class="table table-striped table-condensed table-hover">
                    <tr>
                        <th><input type="checkbox" name="checkAll" id="checkAll"/></th>
                        <th>角色名称</th>
                    </tr>
                    <c:forEach items="${roleList}" var="role">
                        <tr>
                            <td><input type="checkbox" value="${role.role_id}"
                                       name="ids"
                                       <c:if test="${role.checked==true}">checked="checked"</c:if> /></td>
                            <td>${role.role_name }</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2" class="text-center">
                            <button id="submit" name="submit" type="submit"
                                    class="btn btn-primary btn-xs"
                                    onClick="checkBox('${wsdc}/user/saveUserRole.do?user_id=${user_id}&','是否确认保存？');">
                                <span class="glyphicon glyphicon-save"></span> 保 存
                            </button>
                            <a href="${wsdc}/user/query.do" class="btn btn-primary btn-xs"><span
                                    class="glyphicon glyphicon-share-alt"></span> 返 回</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="${wsdc}/js/jquery-1.10.1.js" type="text/javascript"></script>
<script src="${wsdc}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${wsdc}/js/respond.js" type="text/javascript"></script>
<script src="${wsdc}/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
    function checkBox(url, alertmsg) {
        var idValues = '';
        var j = 0;
        $("input[name='ids']").each(function () {
            if (this.checked) {
                j++;
                if (idValues == '') {
                    idValues = this.value;
                } else {
                    idValues += "," + this.value;
                }
            }
        });
        if (j == 0) {
            alert("请至少选择一项！");
        } else {
            var v = window.confirm(alertmsg);
            if (v) {
                $.ajax({
                    type: "POST",
                    url: url + 'ids=' + idValues,
                    async: false,
                    success: function (data) {
                        alert(data);
                        window.location = "${wsdc}/user/query.do";
                    }
                });
            }
        }
    }
</script>
