<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    
%>
<c:set var="wsdc" value="${pageContext.request.contextPath}"/>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
    <meta content="IE=8" http-equiv="X-UA-Compatible"/>


    <spring:message code="application_name" htmlEscape="false"
                    var="app_name"/>
    <title>天津市检察院仓库管理系统
    </title>
    <style>
        body {
            background: url(${wsdc}/images/login/background1.jpg) no-repeat;
            background-size: auto;
              height:600px;
              overflow: hidden;
        }

        .content-block {
            width: 70%;
            margin: 150px auto;
            height: 600px;
            background-size: 100% 100%;
            position: relative;
                 z-index:10;
        }

        .childback {
            position: absolute;
            max-width: 100%;
            max-height: 600px;
            width: 100%;
            height: auto;
            z-index: -1;
        }

        .forms {
            width: 220px;
            height: 100%;
            margin: 0 auto;
            text-align: center;
        }

        input {
            padding: 8px 0;
            width: 150px;
            outline: none;
            border-style: none;
            font-size: 14px;
            border-radius: 4px;
            margin-left: -30px;
        }

        .submit_btn {
            text-align: center;
            margin: 10px auto;
            padding: 8px;
            width: 80px;
            background-color: #80c337;
            color: white;
            font-size: 16px;
            font-weight: bold;
        }

            .submit_btn:hover {
                background-color: #80c337;
            }

        .childinput {
            border-radius: 4px;
            margin-bottom: 10px;
            margin-top: 10px;
        }

        .diviconuser {
            width: 20px;
            height: 20px;
            padding: 5px;
            float: left;
        }

        .diviconpass {
            width: 20px;
            height: 20px;
            float: left;
            padding: 5px;
        }

        .childimg {
            width: 220px;
        }

        .userloginicon {
            max-width: 40%;
            width: 40%;
        }

        .empty {
            height:30%;
            width: 200px;
        }
    </style>
</head>
<c:if test="${!empty user}">
<body onload="login();" style="display: none">

<spring:url value="/resources/j_spring_security_check" var="form_url"/>

        <form action="${fn:escapeXml(form_url)}" method="POST" name="f">
 <div class="content-block" >
        <%-- <img src="${wsdc}/images/login/xiao.jpg" alt="" class="childback"> --%>
        <div class="forms">
         <spring:message code="security_login_form_name" var="name"/>
                <spring:message code="security_login_form_name_message" htmlEscape="false" var="name_msg"/>
                 <spring:message code="security_login_form_password" var="pass"/>
                <spring:message code="security_login_form_password_message" htmlEscape="false" var="pwd_msg"/>
            <div class="empty"></div>
            <div class="childimg">

                <%-- <img src="${wsdc}/images/login/userloginicon.png" class="userloginicon"> --%>
            </div>
            <div class="childinput">
                <div class="diviconuser"><img src="${wsdc}/images/login/iconuser.jpg" height="20" width="20" alt="" /></div>
                <input type="text" placeholder="${name}" autofocus="autofocus" id="j_username"
                           name="j_username" data-required="true" data-minlength="3" data-maxlength="30"
                           data-original-title="${name_msg}" />
            </div>
            <div class="childinput">
                <div class="diviconpass"><img src="${wsdc}/images/login/iconpassword.jpg" height="20" width="20" alt="" /></div>
                <input type="password"  placeholder="${pass}" id="j_password"
                                            name="j_password" data-required="true" data-minlength="3"
                                            data-maxlength="30" data-original-title="${pwd_msg}"/>
                                             <input type="hidden"   id="spring-security-redirect"
                                            name="spring-security-redirect" />
            </div>
            <input type="submit" value="登&nbsp;录" class="submit_btn" />
        </div>
    </div>
    </form>


	
    <script type="text/javascript">
        function login() {
            document.getElementById("j_username").value = '${user.username}';
            document.getElementById("j_password").value = '${user.password}';
            document.getElementById("spring-security-redirect").value = '${url}';
            document.forms[0].submit();
        }
    </script>



</body>
</c:if>

<c:if test="${empty user}">
<body >
<spring:url value="/resources/j_spring_security_check" var="form_url"/>

        <form action="${fn:escapeXml(form_url)}" method="POST" name="f">
 <div class="content-block" >
        <%-- <img src="${wsdc}/images/login/xiao.jpg" alt="" class="childback"> --%>
        <div class="forms">
         <spring:message code="security_login_form_name" var="name"/>
                <spring:message code="security_login_form_name_message" htmlEscape="false" var="name_msg"/>
                 <spring:message code="security_login_form_password" var="pass"/>
                <spring:message code="security_login_form_password_message" htmlEscape="false" var="pwd_msg"/>
            <div class="empty"></div>
            <div class="childimg">

                <img src="${wsdc}/images/login/userloginicon.png" class="userloginicon">
            </div>
            <div class="childinput">
                <div class="diviconuser"></div>
                <input type="text" placeholder="${name}" autofocus="autofocus" id="j_username"
                           name="j_username" data-required="true" data-minlength="3" data-maxlength="30" 
                           data-original-title="${name_msg}" style="padding: "/>
            </div>
            <div class="childinput">
                <div class="diviconpass"></div>
                <input type="password"  placeholder="${pass}" id="j_password"
                                            name="j_password" data-required="true" data-minlength="3"
                                            data-maxlength="30" data-original-title="${pwd_msg}"/>
            </div>
            <input type="submit" value="登&nbsp;录" class="submit_btn" />
            <div><font color="red">${SPRING_SECURITY_LAST_EXCEPTION.message}</font></div>
        </div>
    </div>
    </form>


	
    



</body>
</c:if>
</html>

