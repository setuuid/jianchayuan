var myLayout;
$("body").ready(function(){
	$(function(){ 
		myLayout = $("body").layout({
			applyDefaultStyles: false,//应用默认样式  
		   	north__size:50,//head高度
		   	north__resizable:false,//header不可改变大小
		   	north__closable:false,//header不可关闭 
		    west__size:200,//menu高度
		    west__resizable:false,//menu不可改变大小
		    west__closable:true,//menu不可关闭 
		    south__size:50,//south高度
		    south__resizable:false,//south不可改变大小
		    south__closable:false,//south不可关闭
		    north__spacing_open:0,//上边框的间隙 
		    west__spacing_open:0,//左边框的间隙 
		    south__spacing_open:0,//下边框的间隙  
		    spacing_closed:0,//关闭时边框的间隙  
		    fxName:"drop",//打开关闭的动画效果  
		    fxSpeed:"fast",//动画速度
		    west__initClosed:true,
		    west__onopen_start :function(){
		    	//alert(1311231);
		    }
		});
	});
	
});	
function iFrameHeight() { 
	var ifm= document.getElementById("mainFrame"); 
	var subWeb = document.frames?document.frames["mainFrame"].document:ifm.contentDocument; 
	if(ifm != null && subWeb != null) { 
		ifm.height = 0;
		ifm.height = (subWeb.body.scrollHeight+20)+"px"; 
	} 
} 