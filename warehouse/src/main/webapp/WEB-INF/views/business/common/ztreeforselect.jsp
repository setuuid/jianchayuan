<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="wsdc" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${wsdc}/resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css"></link>
<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/jquery/jquery-1.11.3.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${wsdc}/resources/plugins/ztree/js/jquery.ztree.all-3.5.js"></SCRIPT>

<style>
.ztree li span.button.ico_close{
background-position:-144px 0;
}
.ztree li span.button.ico_open{
background-position:-144px -64px;
}
.ztree li span.button.ico_docu{
background-position:-127px -64px;
}

ul.ztree {background: #fff;overflow-y:scroll;overflow-y:auto;}

</style>

<SCRIPT type="text/javascript" >
	var setting = {
			data:{
				simpleData:{
					enable:true,
					idKey:"id",
					pIdKey:"parentId",
					rootPId:null
				}
			},
			view:{
				showLine:true,
				showIcon:true
			},
			callback:{
				onClick:zTreeOnClick
			}
	};
	
	 function loadTree (url) {
        $.post(url, null, function (data) {
            var json = eval("(" + data + ")");
            json.push({
                "id": 0, "parentId": -1, "name": "结构树型图", "open": "true", "target": "_self",iconOpen:"../resources/plugins/ztree/css/zTreeStyle/img/diy/1_open.png", iconClose:"../resources/plugins/ztree/css/zTreeStyle/img/diy/1_close.png"
            });
            $.fn.zTree.init($("#tree"), setting, json);
        });
    }

	 		function zTreeOnClick(event, treeId, treeNode) {
	 			if(treeNode.id=='0'){
	 				window.alert('不允许选择结构树形图,请重新选择!');
	 				return;
	 			}
	 			if(window.confirm("你确定要选择"+treeNode.name)){
	 			window.returnValue = treeNode.id+","+treeNode.name;
                window.close();}else{
                	 window.close();
                }
	        }

	 		$(document).ready(function(){
	 	          loadTree("../" + '${initTreeUrl}');
	 		});

  </SCRIPT>
  
 <BODY>
	<ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
 </BODY>