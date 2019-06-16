<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/includes.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
			check: {
				enable: true,
				chkStyle: "checkbox",
				chkboxType: { "Y": "p", "Y": "s" } },
			data:{
				simpleData:{
					enable:true,
					idKey:"id",
					pIdKey:"parentId",
					rootPId:null,
					
				}
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
                "id": 0, "parentId": -1, "name": "结构树型图", "open": "true", "target": "_self",iconOpen:"../resources/plugins/ztree/css/zTreeStyle/img/diy/1_open.png", iconClose:"../resources/plugins/ztree/css/zTreeStyle/img/diy/1_close.png"
            });
            treeObj =$.fn.zTree.init($("#tree"), setting, json);
        });
    }

	 		

	 		$(document).ready(function(){
	 	          loadTree("../" + '${initTreeUrl}');
	 		});
	 		 function GetCheckedAll(url) {
	 	        var nodes = treeObj.getCheckedNodes(true);
	 	        var idValues = '';
	 	        if (nodes.length == 0) {
	 	            alert("没有可配置的权限！");
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
	 	        var v = window.confirm('确定配置以下权限吗？');
	 	        if (v) {
	 	            document.getElementById("resource_ids").value = idValues;
	 	            $.ajax({
	 	                type: "POST",
	 	                url: "${wsdc}/role/saveRoleResource.do?roleId=${role_id}",
	 	                data: $('#roleForm').serialize(),
	 	                async: false,
	 	                success: function (data) {
	 	                    alert(data);
	 	                    window.location = "${wsdc}/role/query.do";
	 	                }
	 	            });
	 	        }
	 	    }
  </SCRIPT>
 <BODY style="background-color: white;" >

<div class="container" style="height: 1000px;">
    <div class="row">
        <div class="col-md-12">
            <form:form id="roleForm" name="roleForm" commandName="roleForm"
                       action="" method="post">
                <table class="table table-condensed ">
                    <tr>
                        <td style="text-align: center;"><form:hidden path="role_id"/>
                            <form:hidden path="resource_ids"/>
                            <button type="submit" class="btn btn-primary btn-xs"
                                    onClick="GetCheckedAll()">
                                <span class="glyphicon glyphicon-save"></span> 保 存
                            </button>
                            <a href="${wsdc}/role/query.do" class="btn btn-primary btn-xs"><span
                                    class="glyphicon glyphicon-share-alt"></span> 返 回</a></td>
                    </tr>
                    <tr>
                        <td>
                           <ul id="tree" class="ztree" style="width:330px; overflow:auto;"></ul>
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
    </div>
</div>
 </BODY>

  
