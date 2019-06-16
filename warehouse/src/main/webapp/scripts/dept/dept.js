   function selectDept(mc,dm){
	   var  iWidth=560; //模态窗口宽度
	   var  iHeight=300;//模态窗口高度
	   var  iTop=(window.screen.height-iHeight-100)/2;
	   var  iLeft=(window.screen.width-iWidth)/2;
	   var returnValue=window.showModalDialog("/web/department/departmentTreeForSelect.do", "newwindow", "dialogHeight:"+iHeight+"px; dialogWidth:"+iWidth+"px; toolbar:no; menubar:no; scrollbars:no; resizable:no; location:no; status:no;left:200px;top:100px;");
	
	   var newArr=new Array();
	   newArr=returnValue.split(",");
	   $("#"+dm).val(newArr[0]);
	   $("#"+mc).val(newArr[1]);
	   
   }
   
   function selectDeptForZbxx(mc,dm,level){
	   alert(level);
	   var  iWidth=560; //模态窗口宽度
	   var  iHeight=300;//模态窗口高度
	   var  iTop=(window.screen.height-iHeight-100)/2;
	   var  iLeft=(window.screen.width-iWidth)/2;
	   var returnValue=window.showModalDialog("/web/department/departmentTreeForZbxx.do?level="+level, "newwindow", "dialogHeight:"+iHeight+"px; dialogWidth:"+iWidth+"px; toolbar:no; menubar:no; scrollbars:no; resizable:no; location:no; status:no;left:200px;top:100px;");
	
	   var newArr=new Array();
	   newArr=returnValue.split(",");
	   $("#"+dm).val(newArr[0]);
	   $("#"+mc).val(newArr[1]);
	   
   }