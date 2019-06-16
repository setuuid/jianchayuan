
//获取下拉选文本
function getName(obj,name){
	var selectIndex = obj.selectedIndex;//获得是第几个被选中了
	var selectText = obj.options[selectIndex].text; //获得被选中的项目的文本
	if(selectText=="请选择"){
		var tr = $(obj).parent().parent();
		tr.find("input[name='"+name+"']").val("");
	}else{
		var tr = $(obj).parent().parent();
		tr.find("input[name='"+name+"']").val(selectText);
	}
}
//全选
$("#checkAll").click(function(){ 
	if(this.checked){ 
		$("input[name='ids']").each(function(){this.checked=true;}); 
	}else{ 
		$("input[name='ids']").each(function(){this.checked=false;}); 
	} 
});
//查看编辑
$("#modifyBtu").click(function(){
	var j=0;
	var a=0;
	$("input[name='ids']").each(function(){
		if(this.checked){
			j++;
			a=$(this).val();
		}
	});
	if(j==0){
		alert("请至少选择一项修改！");
	}else if(j>1){
		alert("只能选择一项修改！");
	}else{
		window.location.href = $(this).val()+ a;
	}
});
//删除
$("#deleteBtu").click(function(){
	var j=0;
	var idValues = '';
	$("input[name='ids']").each(function(){
		if(this.checked){
			j++;
			idValues += $(this).val() + ",";
		}
	});
	if(j==0){
		alert("请至少选择一项删除！");
	}else{
		var v = window.confirm('确定要删除当前记录吗？');
		if(v){
			window.location.href = $(this).val()+ idValues;
		}
	}	
});
//时间空间清空
$('button[name="clearBegin"]').click(function(){
	$(this).parent().parent().children(":first").val("");
});
$('button[name="clearEnd"]').click(function(){
	$(this).parent().parent().children(":first").val("");
});