<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/includes.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<link rel="stylesheet" href="${wsdc}/css/bootstrap.min.css">
<link rel="stylesheet" href="${wsdc}/css/common.css"/>


<script type="text/javascript" src="${wsdc}/resources/scripts/dept/dept.js"></script>
<script type="text/javascript" src="${wsdc}/resources/js/ajaxfileupload.js"></script>
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
						<span class="panel-title" style="color: #182b56;font-family: Tahoma,Verdana,微软雅黑,新宋体;font-size: 12px; ">编辑用户 </span>
					</p>
					</div>
              
                <form:form id="userInfoForm" commandName="userInfoForm" action=""
                           method="post">
                    <table class="table table-condensed">
                        <tr>
                            <th class="text-center">用户名</th>
                            <td><form:hidden id="userinfo_id" path="userinfo_id"/> <form:hidden
                                    id="user_id" path="user_id"/>  <form:hidden path="password" id="password"/> <c:choose>
                                <c:when test="${not empty userInfoForm.userinfo_id}">
                                    ${userInfoForm.username}
                                    
                                      <form:hidden id="username" path="username"
                                                    cssClass="form-control input-sm"  />
                                </c:when>
                                <c:otherwise>
                                    <div class="col-md-3">
                                        <form:input id="username" path="username"
                                                    cssClass="form-control input-sm"/>
                                                  
                                                   
                                    </div>
                                </c:otherwise>
                            </c:choose></td>
                        </tr>
                        <tr>
                            <th class="text-center">姓名</th>
                            <th>
                                <div class="col-md-3">
                                    <form:input id="realname" path="realname"
                                                cssClass="form-control input-sm"/>
                                </div>
                            </th>
                        </tr>

                        <tr>
                            <th class="text-center">性别</th>
                            <th>
                                <div class="col-md-3">
                                    <form:select id="sex" path="sex" hideName="sex"
                                                 class="form-control input-sm">
                                                 <form:option value="女">女</form:option>
                                        <form:option value="男">男</form:option>
                                        
                                    </form:select>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th class="text-center">职务</th>
                            <th>
                                <div class="col-md-3">
                                    <form:input id="zwmc" path="zwmc"
                                                cssClass="form-control input-sm"/>
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
                        <tr>
                            <th class="text-center">是否使用</th>
                            <th>
                                <div class="col-md-3">
                                    <form:select id="isUse" path="isUse" hideName="isUse"
                                                 class="form-control input-sm">
                                        <form:option value="1">使用</form:option>
                                        <form:option value="0">禁用</form:option>
                                    </form:select>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th class="text-center">是否为执法权益审批领导</th>
                            <th>
                                <div class="col-md-3">
                                    <form:select id="isld" path="isld" hideName="isld"
                                                 class="form-control input-sm">
                                        <form:option value="N">否</form:option>
                                        <form:option value="Y">是</form:option>
                                      
                                    </form:select>
                                </div>
                            </th>
                        </tr>
                         <tr>
                            <th class="text-center">是否为预警领导</th>
                            <th>
                                <div class="col-md-3">
                                    <form:select id="isyjld" path="isyjld" hideName="isyjld"
                                                 class="form-control input-sm">
                                        <form:option value="N">否</form:option>
                                        <form:option value="Y">是</form:option>
                                      
                                    </form:select>
                                </div>
                            </th>
                        </tr>
                         <tr>
                            <th class="text-center">督察事项权限</th>
                            <th>
                                <div class="col-md-3">
                                    <form:select id="isdcsxld" path="isdcsxld" hideName="isdcsxld"
                                                 class="form-control input-sm">
                                         <form:option value="">看自己</form:option>
                                        <form:option value="2">大领导</form:option>
                                        <form:option value="1">支队长</form:option>
                                      
                                    </form:select>
                                </div>
                            </th>
                        </tr>
                         <tr>
                            <th class="text-center">是否有问卷调查下载权限</th>
                            <th>
                                <div class="col-md-3">
                                    <form:select id="isxz" path="isxz" hideName="isxz"
                                                 class="form-control input-sm">
                                        <form:option value="N">否</form:option>
                                        <form:option value="Y">是</form:option>
                                      
                                    </form:select>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th class="text-center">查看日志权限</th>
                            <th>
                                <div class="col-md-3">
                                    <form:select id="isrzqx" path="isrzqx" hideName="isrzqx"
                                                 class="form-control input-sm">
                                        <form:option value="D">领导</form:option>
                                        <form:option value="X">支队长</form:option>
                                       
                                        <form:option value="">看自己</form:option>
                                    </form:select>
                                </div>
                            </th>
                        </tr>
                         <tr>
							<th class="text-center">白名单ip</th>
							<th>
                                <div class="col-md-3">
                                    <form:input id="userip" path="userip"
                                                cssClass="form-control input-sm"/>
                                </div><font color="red" >*多个IP以逗号分开</font>
                            </th>
                            
                        </tr>
                         <tr>
							<th class="text-center">身份证号</th>
							<th>
                                <div class="col-md-3">
                                    <form:input id="ukey" path="ukey"
                                                cssClass="form-control input-sm"/>
                                </div>
                            </th>
                            
                        </tr>
                        <tr>
	                        <th class="text-center">照片:</th>
	                        <th>
	                        <div class="col-md-4">
	                            <input type="file" class="form-control" name="btnFile" id="btnFile">
	                            <form:hidden id="zpid" path="zpid"/> 
									<span id="imgcr">
									<c:if test="${not empty userInfoForm.zpid }">
	                                    <img width=100 height=100 src="../user?cmd=showimg&ywlsh=${userInfoForm.zpid}"/>
	                                </c:if>
									</span>
	                        </div>
	                        <div class="col-md-2">
                            <input type='button' class='btn btn-info' value='上传'
                                   onclick='javascript:uploadzp()'/>
                        </div>
	                        </th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center">
                                <button type="submit" class="btn btn-primary btn-xs"
                                        onclick="doSubmit();">
                                    <span class="glyphicon glyphicon-save"></span> 保 存
                                </button>
                                <a href="${wsdc}/user/query.do?" class="btn btn-primary btn-xs"><span
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
        $("#userInfoForm").validate({
            submitHandler: function (form) {
                if (confirm("确认执行该操作吗？")) {
                    ajaxSubmitForm();//验证通过之后会去调用的方法
                }
            },
            rules: {
                username: {
                    required: true,
                    rangelength: [1, 50],
                    remote: {
                        type: "POST",
                        url: "${wsdc}/user/checkUsername.do",
                        data: {
                            username: function () {
                                return $("#username").val();
                            }
                        }
                    }
                },
                realname: {
                    required: true,
                    rangelength: [1, 50]
                },
                department_name: {
                	required: true
                }
            }
        });
    }
    function ajaxSubmitForm() {
        $.ajax({
            type: "POST",
            url: "${wsdc}/user/userInfoEdit.do",
            data: $('#userInfoForm').serialize(),
            async: false,
            success: function (data) {
                alert(data);
                window.location = "${wsdc}/user/query.do";
            }
        });
    }
    
    function uploadzp(){


    	$.ajaxFileUpload({
    	type: "POST",
    	url:"upload",
    	secureuri : false,//安全协议
    	fileElementId:'btnFile',//id
    	//contentType: 'application/json;charset=utf-8',
    	datatype: "text",//"xml", "html", "script", "json", "jsonp", "text".
    	success: function(data) {

    	if(data=="err"){
    	alert("请选择上传文件");
    	}else{
    	alert("上传成功");
    	$("#imgcr").html("");
    	var d=new Date()
  		$("#zpid").val(data);
    	$("#imgcr").html("<img width=100 height=100 src=\"..\\user?cmd=showimg&ywlsh="+data+"\"/>");
    	}
    	},
    	error: function(XMLHttpRequest, textStatus, errorThrown) {
    	alert(XMLHttpRequest.status);
    	alert(XMLHttpRequest.readyState);
    	alert(textStatus);
    	},
    	complete: function(XMLHttpRequest, textStatus) {
    	this; // 调用本次AJAX请求时传递的options参数
    	}
    	});

    }
</script>
