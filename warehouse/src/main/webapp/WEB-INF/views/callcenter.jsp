<%@ page language="java" pageEncoding="UTF-8" %>
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
    <title>960111</title>
</head>
<body onload="login();">
<form id="login" method="post" action="http://10.88.18.149:8080/96011/j_spring_security_check">
    <input type="text" id="username" name="username" value="${user.username }" readonly="readonly">
    <input type="password" id="password" name="password" value="${user.password }" readonly="readonly">
    <input type="text" id="DevNum" name="DevNum" value="${callnum}"/ readonly="readonly">
    <input type="text" id="AgentID" name="AgentID" value="${callnum}"/ readonly="readonly">
</form>
<script type="text/javascript">
    function login() {
        document.forms[0].submit();
    }
</script>
</body>
</html>

