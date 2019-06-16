
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="wsdc" value="${pageContext.request.contextPath}"/>
<security:authentication property="principal.user_id" var="user_id"/>
<security:authentication property="principal.username" var="username"/>
<security:authentication property="principal.department.department_id" var="deptid"/>
<security:authentication property="principal.authorities" var="authorities"/>
<c:forEach items="${authorities}" var="author">
	<c:if test="${author.authority=='ROLE_WHMJZFQY_FJWQAJDJ'}">
	<c:set var="fjgly" value="true"/>
	</c:if>
	<c:if test="${author.authority=='ROLE_WHMJZFQY_SJWHMJZFQY'}">
	<c:set var="sjgly" value="true"/>
	</c:if>
</c:forEach>
<!DOCTYPE HTML>

<head>
    <title>天津市公安局网上督察系统</title>
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>

    <!-- Bootstrap -->
    <style>
        #kq_prompt {
            width: 300px;
            height: 220px;
            overflow: hidden;
            display: none;
            border: 1px solid #bbb;
            position: absolute;
            bottom: 0;
            right: 0;
            background: #fff;
            font-size: 13px;
        }

        #closeP {
            border-bottom: 1px solid #bbb;
            width: 100%;
            height: 20px;
            cursor: pointer;
            line-height: 20px;
            text-align: right;
            color: #fff;
            background: #646464;
        }
         #kq_prompt1 {
            width: 370px;
            height: auto;
            overflow: hidden;
            display: none;
            border: 1px solid #bbb;
            position: absolute;
            bottom: 110px;
            right: 0;
            background: #fff;
            font-size: 13px;
        }

        #closeP1 {
            border-bottom: 1px solid #bbb;
            width: 100%;
            height: 20px;
            cursor: pointer;
            line-height: 20px;
            text-align: right;
            color: #fff;
            background: #646464;
        }
         #kq_prompt2 {
            width: 370px;
            height: auto;
            overflow: hidden;
            display: none;
            border: 1px solid #bbb;
            position: absolute;
            bottom: 110px;
            right: 0;
            background: #fff;
            font-size: 13px;
        }

        #closeP2 {
            border-bottom: 1px solid #bbb;
            width: 100%;
            height: 20px;
            cursor: pointer;
            line-height: 20px;
            text-align: right;
            color: #fff;
            background: #646464;
        }
        
        #kq_prompt3 {
            width: 370px;
            height: auto;
            overflow: hidden;
            display: none;
            border: 1px solid #bbb;
            position: absolute;
            bottom: 110px;
            right: 0;
            background: #fff;
            font-size: 13px;
        }

        #closeP3 {
            border-bottom: 1px solid #bbb;
            width: 100%;
            height: 20px;
            cursor: pointer;
            line-height: 20px;
            text-align: right;
            color: #fff;
            background: #646464;
        }
        
         #kq_prompt4 {
            width: 370px;
            height: auto;
            overflow: hidden;
            display: none;
            border: 1px solid #bbb;
            position: absolute;
            bottom: 110px;
            right: 0;
            background: #fff;
            font-size: 13px;
        }

        #closeP4 {
            border-bottom: 1px solid #bbb;
            width: 100%;
            height: 20px;
            cursor: pointer;
            line-height: 20px;
            text-align: right;
            color: #fff;
            background: #646464;
        }
        
         #kq_prompt5 {
            width: 370px;
            height: auto;
            overflow: hidden;
            display: none;
            border: 1px solid #bbb;
            position: absolute;
            bottom: 110px;
            right: 0;
            background: #fff;
            font-size: 13px;
        }

        #closeP5 {
            border-bottom: 1px solid #bbb;
            width: 100%;
            height: 20px;
            cursor: pointer;
            line-height: 20px;
            text-align: right;
            color: #fff;
            background: #646464;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet" href="${wsdc}/resources/scripts/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="${wsdc}/resources/styles/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${wsdc}/resources/styles/bootstrap/index.css">

    <script src="${wsdc}/resources/scripts/jquery-1.10.1.js" type="text/javascript"></script>
    <script src="${wsdc}/resources/scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="${wsdc}/resources/scripts/jquery.layout-latest.js" type="text/javascript"></script>
    <script src="${wsdc}/resources/scripts/jquery.ui.all.js" type="text/javascript"></script>
    <script src="${wsdc}/resources/scripts/index.js" type="text/javascript"></script>
    <script src="${wsdc}/resources/scripts/respond.js" type="text/javascript"></script>
    <script src="${wsdc}/resources/scripts/html5shiv.js" type="text/javascript"></script>
    <script src="${wsdc}/resources/scripts/json2.js" type="text/javascript"></script>
    <script src="${wsdc}/resources/scripts/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${wsdc}/resources/scripts/workflow/workflow.js"></script>
    <script type="text/javascript" src="${wsdc}/resources/scripts/workflow/quartz.js"></script>
    <script type="text/javascript">
        function closeWest() {

            window.open("/web", "_self");
        }


        /* function openMenu(menu_id) {


            if (menu_id == '03' || menu_id == '09' || menu_id == '05' || menu_id == '06'|| menu_id == '10') {

                $.ajax({
                    type: "POST",
                    url: "${wsdc}/jsp/menu.do?menu_id=" + menu_id,
                    async: false,
                    success: function (data) {
                        //alert(data);
                        var json = eval("(" + data + ")");
                        //alert(json);
                        var html = '<li><a href="http://192.168.3.25:8080/wf/wf/taskList.do?userid=${user_id}"  class="menu-first"  target="mainFrame"><span class="glyphicon glyphicon-eye-open"></span> &nbsp;&nbsp;子系统首页</a></li>';
                        for (var o in json) {
                            html += '<li><a href="#' + json[o].cname + '" class="menu-first" data-toggle="collapse"><span class="' + json[o].icon + '"></span> &nbsp;&nbsp;' + json[o].cname + '</a>' +
                            '<ul id="' + json[o].cname + '" class="nav nav-list collapse menu-second">';
                            var jsons = json[o].items;
                            for (var oo in jsons) {
                                if (jsons[00].allURL == "Y") {
                                    html += '<li><a href="' + jsons[oo].url + '" target="mainFrame"><span class="glyphicon glyphicon-chevron-right"></span>&nbsp;' + jsons[oo].cname + '</a></li>';
                                } else {
                                    html += '<li><a href="${wsdc}' + jsons[oo].url + '" target="mainFrame"><span class="glyphicon glyphicon-chevron-right"></span>&nbsp;' + jsons[oo].cname + '</a></li>';
                                }
                            }
                            html += '</ul></li>';
                        }
                        $("#menu").html("");
                        $("#menu").append(html);

                    }
                });
                myLayout.toggle('west');
            }

        } */
    </script>
    <style type="text/css">
    .panel-group .panel+.panel {
    margin-top: 0px;
}
    </style>
</head>

<body style="background-color: #CCCCCC">
<div class="ui-layout-north">
    <div class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <img class="img-rounded" alt="Brand" src="${wsdc}/resources/images/wsdc.png" >
            </div>
            <ul class="nav navbar-nav navbar-right" style="margin-right: 100px;">
                <li>
                    <a href="#">
                        <jsp:useBean id="now" class="java.util.Date"/>
                        <fmt:formatDate value="${now}" type="date" dateStyle="full"/>
                    </a>
                </li>
                <%-- <li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> <security:authentication property="principal.department.department_name"/></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <security:authentication property="principal.userInfo.realname"/></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> <security:authentication property="principal.userInfo.last_login_ip"/></a></li> --%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"
                       onmouseover="myLayout.allowOverflow('north')">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 系统 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="../jsp/newindex?menu_id=09"><span class="glyphicon glyphicon-edit"
                                                                          aria-hidden="true"></span> 系统管理</a></li>
                        <li class="divider"></li>
                        <li><a href="${wsdc}/user/editPassword.do" target="_blank"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 修改个人密码</a></li>
                        </li>
                        <li class="divider"></li>
                        <li class="divider"></li>
                        <li><a onClick="top.location.replace('${wsdc}/resources/j_spring_security_logout')"><span
                                class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出系统</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="ui-layout-west" >
    <div class="sidebar-menu">
        <ul class="nav nav-list sidebar-list panel-group" id="menu">
         <li class="panel panel-default"><a href="http://localhost:8080/wf/wf/taskList.do?userid=${user_id}"  class="menu-first" data-toggle="collapse" data-parent="#menu"  target="mainFrame"><span class="glyphicon glyphicon-eye-open"></span> &nbsp;
 <%-- <li><a href="http://tjsgajwsdc.java.tenv.cst.canic/GZL/V1.0/wf/taskList.do?userid=${user_id}"  class="menu-first"  target="mainFrame"><span class="glyphicon glyphicon-eye-open"></span> &nbsp;&nbsp;子系统首页</a></li> --%> 
          <%-- <li><a href="http://10.88.18.148:8080/wf/wf/taskList.do?userid=${user_id}"  class="menu-first"  target="mainFrame"><span class="glyphicon glyphicon-eye-open"></span> &nbsp;&nbsp;--%>
    <c:if test="${menu_id=='05' }">
    警务评议系统
    </c:if>  
     <c:if test="${menu_id=='03' }">
    执法业务系统
    </c:if>
     <c:if test="${menu_id=='10' }">
 维权系统
    </c:if>
     <c:if test="${menu_id=='06' }">
    综合应用系统
    </c:if> 
     <c:if test="${menu_id=='09' }">
    系统管理
    </c:if>  
          </a></li> 

            <c:forEach items="${sysMenuList}" var="sysMenuList">
                <li class="panel panel-default" style="width:230px;" >
                    <a href="#${sysMenuList.cname}" class="menu-first" data-toggle="collapse" data-parent="#menu" ><span
                            class="glyphicon glyphicon-eye-open"></span> &nbsp;&nbsp;${sysMenuList.cname }</a>
                    <ul id="${sysMenuList.cname}" class="nav nav-list collapse menu-second" >
                        <c:forEach items="${sysMenuList.items}" var="menu">
                        <security:authorize ifAllGranted="${menu.authority }">
                            <li style="margin-top: 0px;background-color: #cccccc;"><c:if test="${menu.allURL =='Y' }">
                            <c:if test="${menu.authority=='ROLE_SYSTEM_SYS_SPAUTH' }">
                            <a href="${menu.url }?username=${username}&password=1111" target="mainFrame">
                            </c:if>
                             <c:if test="${menu.authority!='ROLE_SYSTEM_SYS_SPAUTH' }">
                            <a href="${menu.url }" target="mainFrame">
                            </c:if>
                            </c:if><c:if test="${menu.allURL !='Y' }"><a href="${wsdc}${menu.url }" target="mainFrame"></c:if><span
                                    class="glyphicon glyphicon-chevron-right"></span>&nbsp;${menu.cname }</a>
                            </li>
                         </security:authorize>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<div id="center" class="ui-layout-center">

 
<%--    <iframe id="mainFrame" name="mainFrame" src="http://tjsgajwsdc.java.tenv.cst.canic/GZL/V1.0/wf/taskList.do?userid=${user_id}"
            width="100%" height="100%"
            frameborder="0" scrolling="auto"></iframe>  --%> 

   <%--  <iframe id="mainFrame" name="mainFrame" src="http://10.88.18.148:8080/wf/wf/taskList.do?userid=${user_id}"
            width="100%" height="100%"
            frameborder="0" scrolling="auto"></iframe>  --%> 
          <iframe id="mainFrame" name="mainFrame" src="http://localhost:8080/wf/wf/taskList.do?userid=${user_id}"
            width="100%" height="100%"
            frameborder="0" scrolling="auto"></iframe>
</div>


<div class="ui-layout-south">
    <div class="navbar-inverse">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <ul class="nav navbar-nav">
                        <li><a target="mainFrame" onclick="closeWest();"><img
                                src="${wsdc}/resources/images/welcome/Windows-8-Logo.png" alt="..." class="" height="5%"
                                width="10%"> 返回首页</a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <p class="text-center" style="color: #fff;margin-top: 5px;">Copyright©2015 天津市公安局 All Rights
                        Reserved</p>

                    <p class="text-center" style="color: #fff;margin-top: 5px;">技术支持：天津市康恒信息科技有限公司</p>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
</div>
<!-- 提醒Modal -->
<div id="kq_prompt">
    <p id="closeP"><span id="iGetIt">关闭</span></p>
    <bgsound id="m_bg_music" src="" loop=100/>
    <table>
        <tr>
            <td><p id="haha"></p></td>
        </tr>
    </table>
</div>
<div id="kq_prompt1">
    <p id="closeP1"><span id="iGetIt1">关闭</span></p>
    <bgsound id="m_bg_music1" src="" loop=100/>
    <table>
        <tr>
            <td><p id="haha1"></p></td>
        </tr>
    </table>
</div>
<div id="kq_prompt2">
    <p id="closeP2"><span id="iGetIt2">关闭</span></p>
    <bgsound id="m_bg_music2" src="" loop=100/>
    <table>
        <tr>
            <td><p id="haha2"></p></td>
        </tr>
    </table>
</div>

<div id="kq_prompt3">
    <p id="closeP3"><span id="iGetIt3">关闭</span></p>
    <bgsound id="m_bg_music3" src="" loop=100/>
    <table>
        <tr>
            <td><p id="haha3"></p></td>
        </tr>
    </table>
</div>
<div id="kq_prompt4">
    <p id="closeP4"><span id="iGetIt4">关闭</span></p>
    <bgsound id="m_bg_music4" src="" loop=100/>
    <table>
        <tr>
            <td><p id="haha4"></p></td>
        </tr>
    </table>
</div>
<div id="kq_prompt5">
    <p id="closeP5"><span id="iGetIt5">关闭</span></p>
    <bgsound id="m_bg_music5" src="" loop=100/>
    <table>
        <tr>
            <td><p id="haha5"></p></td>
        </tr>
    </table>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        var myLayout = $("body").layout(
                {south_closable: false, north__closable: false, west__closable: false});
        $(".ui-layout-west").mCustomScrollbar({theme: "dark", alwaysShowScrollba: 1, autoHideScrollbar: false});
        myLayout.sizePane("west", 230);


        //openMenu('${menu_id}');
    })

</script>
<c:if test="${menu_id!='05'}">
    <script>
        function tt() {
            var t = document.getElementById("bgDiv");
            var t1 = document.getElementById("msgDiv");
            var t2 = document.getElementById("msgTitle");


            if (t == null) {


            } else {
                document.body.removeChild(t);
                document.getElementById("msgDiv").removeChild(t2);
                document.body.removeChild(t1);
            }
            tasks("${user_id}");
            
            quartz("${wsdc}");
//            quartz("tjsgajwsdc.java.tenv.cst.canic");

        }
        setInterval(tt, 350000);

    </script>
</c:if>
<c:if test="${menu_id=='03'}">
    <script>
        function remind() {
            $.ajax({
                url: "${wsdc}/zfyw/remind?cmd=selectCount",
                //async: false,
                success: function (data) {
                    if (data != "") {
                        var json = eval("(" + data + ")");
                        var str = "";
                        for (var p in json) {
                            if (json[p].type == "menu") {
                                str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + json[p].resourceName + "&nbsp;&nbsp;<a style='cursor:pointer;text-align:left;' onclick='linking(\"" + json[p].url + "\")'>" + json[p].count + "</a>" + "</br>";
                            } else if (json[p].type == "case") {
                                //str += json[p].resourceName + "中编号为：" + json[p].caseNo + "<button type='button' onclick='linking(\"" + json[p].url + "\")' class='btn btn-primary btn-xs'><span class='glyphicon glyphicon-search'></span>查看</button>" + "</br>"
                            }
                            document.getElementById("m_bg_music").src = '${wsdc}/voice/message.mp3';
                        }
                        $("#haha").html(str);
                        var mes = $("#kq_prompt");
                        mes.slideDown();
                    }
                }
            });
            window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        //重复执行某个方法

        var t1 = window.setInterval(remind, 300000);


        function linking(url) {
            window.mainFrame.location = "${wsdc}" + url+"?ck=%25E5%2590%25A6";
        }
        $("#iGetIt").click(function () {
            var mes = $("#kq_prompt");
            document.getElementById("m_bg_music").src = '';
            mes.slideUp();
        });
    </script>
</c:if>

<c:if test="${menu_id=='10'&&sjgly==true}">
    <script>
        function remind1() {
        	 $("#haha1").html("");
            $.ajax({
                url: "${wsdc}/zfyw/remind?cmd=selectCountZFQY",
                //async: false,
                success: function (datas) {
                	var data=datas.data;
                    if (data != "") {
                        
                        var str = "";
                        for (var p in data) {
                           
                                str += "编号：&nbsp;&nbsp;<a style='cursor:pointer;text-align:left;' onclick='linking1(\"" + data[p].ywlsh + "\")'>"+data[p].ajbh+"</a>有新工作记录</br>";
                          
                            document.getElementById("m_bg_music1").src = '${wsdc}/voice/message.mp3';
                        }
                        $("#haha1").html(str);
                        var mes = $("#kq_prompt1");
                        mes.slideDown();
                    }
                    
                }
            });
          window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        //重复执行某个方法
        var zfqy = window.setInterval(remind1, 100000);
        function linking1(ywlsh) {
            window.mainFrame.location = "${wsdc}/zfqy/base?ctr=showinfor&ywlsh="+ywlsh+"&ymxs=sjdbspedit#log";
        }
       
        $("#iGetIt1").click(function () {
            var mes1 = $("#kq_prompt1");
            document.getElementById("m_bg_music1").src = '';
            mes1.slideUp();
        });
    </script>
</c:if>

<c:if test="${menu_id=='10'&&fjgly==true}">
    <script>
        function remind2() {
        	 $("#haha2").html("");
            $.ajax({
                url: "${wsdc}/zfyw/remind?cmd=selectYJZFQY",
                //async: false,
                success: function (datas) {
                	var data=datas.data;
                    if (data != "") {
                        
                        var str = "";
                        for (var p in data) {
                           
                                str += "编号：&nbsp;&nbsp;<a style='cursor:pointer;text-align:left;' onclick='linking2(\"" + data[p].ywlsh + "\")'>"+data[p].ajbh+"</a>还未提交结案审批</br>";
                          
                            document.getElementById("m_bg_music2").src = '${wsdc}/voice/message.mp3';
                        }
                        $("#haha2").html(str);
                        var mes = $("#kq_prompt2");
                        mes.slideDown();
                    }
                    
                }
            });
          window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        //重复执行某个方法
        var zfqy2 = window.setInterval(remind2, 100000);
        function linking2(ywlsh) {
            window.mainFrame.location = "${wsdc}/zfqy/base?ctr=showinfor&ywlsh="+ywlsh+"&ymxs=sjdbspedit#log";
        }
        $("#iGetIt2").click(function () {
            var mes1 = $("#kq_prompt2");
            document.getElementById("m_bg_music2").src = '';
            mes1.slideUp();
        });
    </script>

    
     <script>
        function remind3() {
        	 $("#haha3").html("");
            $.ajax({
                url: "${wsdc}/zfyw/remind?cmd=selectYJZFQYSQ",
                //async: false,
                success: function (datas) {
                	var data=datas.data;
                    if (data != "") {
                        
                        var str = "";
                        for (var p in data) {
                        	if(p>=10){
                         	   break;
                            }
                                str += data[p].desc+"<p>";
                          
                            document.getElementById("m_bg_music3").src = '${wsdc}/voice/message.mp3';
                        }
                        $("#haha3").html(str);
                        var mes = $("#kq_prompt3");
                        mes.slideDown();
                    }
                    
                }
            });
          window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        //重复执行某个方法
        var zfqy3 = window.setInterval(remind3, 200000);
        
        $("#iGetIt3").click(function () {
            var mes1 = $("#kq_prompt3");
            document.getElementById("m_bg_music3").src = '';
            mes1.slideUp();
        });
    </script>
    <script>
        function remind4() {
        	 $("#haha4").html("");
            $.ajax({
                url: "${wsdc}/zfyw/remind?cmd=selectYJZFQYTEMP",
                //async: false,
                success: function (datas) {
                	var data=datas.data;
                    if (data != "") {
                        
                        var str = "";
                        for (var p in data) {
                        	if(p>=10){
                         	   break;
                            }
                                str += data[p].desc+"<p>";
                          
                            document.getElementById("m_bg_music4").src = '${wsdc}/voice/message.mp3';
                        }
                        $("#haha4").html(str);
                        var mes = $("#kq_prompt4");
                        mes.slideDown();
                    }
                    
                }
            });
          window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        //重复执行某个方法
        var zfqy4 = window.setInterval(remind4, 200000);
        
        $("#iGetIt4").click(function () {
            var mes1 = $("#kq_prompt4");
            document.getElementById("m_bg_music4").src = '';
            mes1.slideUp();
        });
    </script>
    
    <script>
        function remind5() {
        	 $("#haha5").html("");
            $.ajax({
                url: "${wsdc}/zfyw/remind?cmd=selectCLGC",
                //async: false,
                success: function (datas) {
                	var data=datas.data;
                    if (data != "") {
                        
                        var str = "";
                        for (var p in data) {
                           if(p>=10){
                        	   break;
                           }
                        	   str += data[p].desc+"<p>";
                           
                                
                          
                            document.getElementById("m_bg_music5").src = '${wsdc}/voice/message.mp3';
                        }
                        $("#haha5").html(str);
                        var mes = $("#kq_prompt5");
                        mes.slideDown();
                    }
                    
                }
            });
          window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        //重复执行某个方法
        var zfqy5 = window.setInterval(remind5, 200000);
        
        $("#iGetIt5").click(function () {
            var mes1 = $("#kq_prompt5");
            document.getElementById("m_bg_music5").src = '';
            mes1.slideUp();
        });
    </script>

</c:if>
</body>
</html>
