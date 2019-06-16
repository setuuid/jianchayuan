<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/includes.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<link rel="stylesheet" href${wsdc}/css/bootstrap.min.css">
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
            <div class="panel panel-default">
            
             <div class="panel-head">
					<p style="padding-top: 7px;padding-left: 10px;">
						<span class="panel-title" style="color: #182b56;font-family: Tahoma,Verdana,微软雅黑,新宋体;font-size: 12px; ">用户列表 </span>
					</p>
					</div>
                
               
                <table
                        class="table table-striped table-bordered table-condensed table-hover">
                    <tr>
                      
                        <th>姓名</th>
                        
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${list}" var="user">
                        <tr>
                            <td>${user.realname}</td>
                            <td><a class="btn btn-primary btn-xs"
                                   href="javascript:rtId('${user.userinfo_id}','${user.realname}')"><span
                                    class="glyphicon glyphicon-pencil"></span> 选择</a> </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <!------------- 分页开始 ------------->
            <jsp:include page="../../system/common/page.jsp">
                <jsp:param name="url" value="${pageUrl}"/>
            </jsp:include>
            <!------------- 分页结束 ------------->
        </div>
    </div>
</div>
<script src="${wsdc}/js/jquery-1.10.1.js" type="text/javascript"></script>
<script src="${wsdc}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${wsdc}/js/respond.js" type="text/javascript"></script>
<script src="${police }/js/common.js" type="text/javascript"></script>
<form id="condition" name="condition" hidden="true" method="post">
    <input type="text" id="departmentId" name="departmentId"
           value="${departmentId}"/> 
</form>
<script type="text/javascript">
function rtId(userid,username){
	window.parent.parent.returnValue = userid+","+username;
    window.parent.close();
}
</script>
