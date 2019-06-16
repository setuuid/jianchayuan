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
var treeObj;
	var setting = {
			data:{
				simpleData:{
					enable:true,
					idKey:"id",
					pIdKey:"parentId",
					rootPId:null
					
				}
			},
			check: {
				enable: true
				
			},
			view:{
				showLine:true,
				showIcon:true
			}
			
	};
	
	 function loadTree (url) {
        $.post(url, null, function (data) {
            var json = eval("(" + data + ")");
            json.push({
                "id": 0,
                "parentId": -1, 
                "name": "结构树型图", 
                "open": "true", 
               
                iconOpen:"../resources/plugins/ztree/css/zTreeStyle/img/diy/1_open.png", 
                iconClose:"../resources/plugins/ztree/css/zTreeStyle/img/diy/1_close.png"
               
            });
            treeObj=$.fn.zTree.init($("#tree"), setting, json);
        });
    }


	 		$(document).ready(function(){
	 	          loadTree("../" + '${initTreeUrl}');
	 		});
	 		var userid='${userid}';
	 		function GetCheckedAll() {
	 	        var nodes = treeObj.getCheckedNodes(true);
	 	        var idValues = '';
	 	        if (nodes.length == 0) {
	 	            alert("没有可配置的权限！");
	 	           preventDefault();
	 	        }
				var t=false,f=false;
	 	        if(nodes.length>1000){
	 	        	t=window.confirm('您配置的部门权限超过1000个，将会设置您为市局权限？');
					f=true;
	 	        }
				if(t){
					treeObj.checkAllNodes(true);
					nodes = treeObj.getCheckedNodes(true);
					
				}
				if(f&&!t){
					preventDefault();
				}
				
	 	        for (var i = 0; i < nodes.length; i++) {
	 	            if (i == nodes.length - 1) {
	 	                idValues += nodes[i].id;
	 	            } else {
	 	                if (nodes[i].id == '0') {
	 	                    continue;
	 	                } else {
	 	                    idValues += nodes[i].id + ",";
	 	                }
	 	            }
	 	        }
	 	        
	 	        var v = window.confirm('确定配置部门权限吗？');
	 	        if (v) {
	 	             idValues;
	 	            $.ajax({
	 	                type: "POST",
	 	                url: "${wsdc}/department/saveDepartmentRole.do",
	 	                data: {departmentIds:idValues,userid:userid},
	 	                async: false,
	 	                success: function (data) {
	 	                    alert(data);
	 	                   // window.location = "${wsdc}/role/query.do";
	 	                }
	 	            });
	 	        }
	 	    }
  </SCRIPT>
  
 <BODY>

                            <button type="submit" class="btn btn-primary btn-xs"
                                    onClick="GetCheckedAll()">
                                <span class="glyphicon glyphicon-save"></span> 保 存
                            </button>
                           
                  
      
   <ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
        
  
	
 </BODY>