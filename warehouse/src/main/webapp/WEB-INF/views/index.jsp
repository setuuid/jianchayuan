<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="wsdc" value="${pageContext.request.contextPath}" />
<security:authentication property="principal.user_id" var="userid"/>
<security:authentication property="principal.username" var="username"/>
<security:authentication property="principal.realname" var="realname"/>
<security:authentication property="principal.ism" var="ism"/>
<security:authentication property="principal.password" var="password"/>
<security:authentication property="principal.department.department_name" var="department_name"/>
<script type="text/javascript">
	window.open("${wsdc}/jsp/newindex","_parent")
</script>

