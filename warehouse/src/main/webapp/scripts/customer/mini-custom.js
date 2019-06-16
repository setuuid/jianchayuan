ParamsJson={is_Template_loaded:false,editor_js_loaded:false,related_Template_loaded:false};

/**
 * 加载模版。
 */
function includeFormTemplate(){
	if(ParamsJson.is_Template_loaded) return;
	var url=__rootPath +"/scripts/customer/template.html";
	var fileContent=$.getFile(url);
	var jqTemplate=$("#formTemplate");
	if(jqTemplate.length==0){
		$("body").append(fileContent);
		ParamsJson.is_Template_loaded=true;
	}
}

//设置左分隔符为 <#
baidu.template.LEFT_DELIMITER='<#';
//设置右分隔符为 #>
baidu.template.RIGHT_DELIMITER='#>';

var baiduTemplate=baidu.template;


if (!window.UserControl) window.UserControl = {};


/**
 * 附件控件
 * <div id="file1" name="file1" class="upload-panel" isone="false" sizelimit="50"
        style="width:auto;" isDown="false" isPrint="false" readOnly="true"
   value=''></div> 
   获取数据：
   mini.get("file1").getValue();
   设置数据：
   var val=[{"fileId":"1","fileName":"a.doc","totalBytes":22016},{"fileId":"2","fileName":"1.png","totalBytes":130476}];
   mini.get("file1").setValue(val);
   
   isDown:是否允许下载
   isPrint:是否显示打印
   readOnly:是否只读
 */
UserControl.UploadPanel = function () {
    UserControl.UploadPanel.superclass.constructor.call(this);
	this.initComponents();
	this.bindEvents()
}

mini.extend(UserControl.UploadPanel, mini.Panel, {
    uiCls: 'upload-panel',
    formField:true,
    files:{},
    readOnly:false,
    required:false,
    initComponents: function () {
    	//加载模版到页面。
    	includeFormTemplate();
    	var html="<a name='upload' class='mini-button' iconCls='icon-upload' >上传</a>" +
    			"<a name='clean' class='mini-button' iconCls='icon-clear' >清空</a>";
    	
    	this.clearData();
    	
    	this.set({
    		showHeader:false,
    		showToolbar:true,
    		showFooter:false,
    		toolbar:html
    	});    
    },
    
    bindEvents: function () {
        this.uploadBtn = mini.getByName('upload', this);
        this.cleanBtn = mini.getByName('clean',this);
        var that = this;
       
        this.uploadBtn.on('click', function (e) {
        	_UploadDialogShowFile({
				from:'SELF',
				types:that.fileType,
				single:false,
				onlyOne:that.isone,
				sizelimit:that.sizelimit,
				showMgr:false,
				callback:function(files){
					that.setUploadFile(files);
				}
			});
        });
        this.cleanBtn.on('click', function (e) {
        	that.cleanFile();
        });   
        
    },
    set: function (kv) {
        var value = kv.value;
        delete kv.value;
        UserControl.UploadPanel.superclass.set.call(this,kv);
        if (!mini.isNull(value)) {
            this.setValue(value);
        }
    },
    /**
     * 返回数据。
     */
    getValue: function () {
    	var tmp=this.getFiles();
    	if(tmp.length==0) return "";
        return mini.encode(tmp);
    },
    
    /**
     * 转换文件
     */
    convertFile:function(upFile){
    
    	var obj={fileId:upFile.fileId,fileName:upFile.fileName,totalBytes:upFile.totalBytes};
    	return obj;
    },
    /**
     * 设置上传文件。
     */
    setUploadFile:function(upFiles){
    	var tmpfiles=this.getFiles();
    	for(var i=0;i<upFiles.length;i++){
    		var upFile=upFiles[i];
    		var file=this.convertFile(upFile);
    		var fileName=file.fileName;
    		if(!this.isFileExist(fileName)){
    			tmpfiles.push(file);
    		}
    	}
    	
    	this.displayFile();
    },
    
    
    /**
     * 显示文件。
     */
    displayFile:function(){
    	
    	this.getBodyEl().innerHTML="";
    	var html=this.getHtmls();
    	this.set({
    		body:html
    	});
    	this.bindRemove();
    	
    	
    },
    /**
     * 处理单个文件删除。
     */
    bindRemove:function(){
    	var parent=$(this.el);
    	var buttons=$(".removeFile", parent);
    	var self_=this;
    	for(var i=0;i<buttons.length;i++){
    		var btn=$(buttons[i]);
    		btn.bind("click",function(e){
    			var el=$(e.currentTarget);
    			var parentLi=$(e.currentTarget).closest("li");
    			var fileId=parentLi.attr("id").replace("li_","");
    			var files=self_.getFiles();
    			for(var j=0;j<files.length;j++){
    				if(fileId==files[j].fileId){
    					files.splice(j,1);
    				}
    			}
    			//加载。
    			self_.displayFile();
    		})
    		
    	}
    },
    /**
     * 判断文件是否存在。
     */
    isFileExist:function(fileName){
    	var tmpfiles=this.getFiles();
    	for(var j=0;j<tmpfiles.length;j++){
			if(fileName==tmpfiles[j].fileName){
				return true;
			}
		}
    	return false;
    },
    /**
     * 清除数据。
     */
    clearData:function(){
    	this.files[this.uid]=[];
    },
    /**
     * 设置数据。
     */
    setData:function(val){
    	this.files[this.uid]=val;
    },
    /**
     * 获取这个控件的数据。
     */
    getFiles:function(){
    	var tmp=this.files[this.uid];
    	return tmp;
    },
    /**
     * 清除文件
     */
    cleanFile:function(){
    	this.clearData();
    	var body=this.getBodyEl();
    	body.innerHTML="";
    },
    /**
     * 返回HTML
     */
    getHtmls:function(){
    	var tmpfiles=this.getFiles();
    	if(!tmpfiles || tmpfiles.length==0) return "";
    	var write=!this.readOnly;
    	var data={"list":tmpfiles,isDown:this.isDown,isPrint:this.isPrint,
    			ctxPath:__rootPath,write:write,enableOpenOffice:_enable_openOffice};
    	
    	var html=baiduTemplate('uploadFile',data);
    	return html;
    },
    setIsDown: function (value) {
        this.isDown=value;
    },
    setIsPrint: function (value) {
        this.isPrint=value;
    },
    setIsone: function (value) {
        this.isone=value;
    },
    setSizelimit:function (value) {
        this.sizelimit=value;
    },
    setFileType:function (value) {
        this.fileType=value;
    },
    /**
     * 是否只读。
     */
    setReadOnly: function (value) {
    	this.readOnly=value;
    	if(!value) return;
    	this.displayFile();
    	
		this.set({
			showHeader:false,
    		showFooter:false,
    		showToolbar:false,
    		toolbar:""
		})
    },
    /**
     * 设置数据。
     */
    setValue:function(val){
    	if(!val) val="[]";
    	if((typeof val)=="string"){
    		this.setData(mini.decode(val));
    	}
    	else{
    		this.setData(val);
    	}
    	this.displayFile();
    },
    getAttrs: function (el) {
        var attrs = UserControl.UploadPanel.superclass.getAttrs.call(this, el);
        mini._ParseBool(el, attrs,
            ["isPrint","isDown","readOnly","isone"]
        );
        mini._ParseString(el, attrs,
                ["sizelimit","fileType","value"]
            );
        return attrs;
    }
});

mini.regClass(UserControl.UploadPanel, "uploadPanelControl");


/**
 * 用户选择控件。
 * <input id="file1" name="file1" class="mini-user" 
 *       style="width:auto;"  readOnly="true" single="true"
 *  value='' />
 *  
 *  属性：
 *  single ：是否单选
 *  
 */
UserControl.MiniUser = function () {

    UserControl.MiniUser.superclass.constructor.call(this);
    
    this.initComponents();
    this.bindEvents();
}

mini.extend(UserControl.MiniUser, mini.ButtonEdit, {
    uiCls: 'mini-user',
    single: true,
       initComponents: function () {
    	var el=this.getEl();
    	el.className="mini-buttonedit icon-user-button";
    },
    bindEvents: function () {
        this.on('buttonclick', _UserButtonClick);
    },
    setSingle: function (value) {
    	this.single=value;
    },
    getAttrs: function (el) {
        var attrs = UserControl.MiniUser.superclass.getAttrs.call(this, el);
        mini._ParseBool(el, attrs,["single"]);
        return attrs;
    }
});

mini.regClass(UserControl.MiniUser, "userControl");

/**
 * 用户组选择控件。
 * <div id="group" name="group" class="mini-group" 
        style="width:auto;" single="true" showDim="true" ></div>   
    single:是否为单选
    showDim: 是否显示维度。
    dimId: 维度ID
 */
UserControl.MiniGroup = function () {

    UserControl.MiniGroup.superclass.constructor.call(this);
    
    this.initComponents();
    this.bindEvents();
}

mini.extend(UserControl.MiniGroup, mini.ButtonEdit, {
    uiCls: 'mini-group',
    single: true,
       initComponents: function () {
    	var el=this.getEl();
    	el.className="mini-buttonedit icon-group-button";
    },
    showDim:false,
    dimId:"",
    bindEvents: function () {
        this.on('buttonclick', _GroupButtonClick);
    },
    setSingle: function (value) {
    	this.single=value;
    },
    setShowDim:function(val){
    	this.showDim=val;
    },
    getShowDim:function(){
    	return this.showDim;
    },
    setDimId:function(val){
    	this.dimId=val;
    },
    getAttrs: function (el) {
        var attrs = UserControl.MiniGroup.superclass.getAttrs.call(this, el);
        mini._ParseString(el, attrs,["dimId"]);
        mini._ParseBool(el, attrs, ["single","showDim"]);
        return attrs;
    }
});

mini.regClass(UserControl.MiniGroup, "groupControl");

/**
 * 部门选择控件。
 * <div id="group" name="group" class="mini-dep" 
        style="width:auto;" single="true" ></div>   
    single:是否为单选按钮。
  
 */
UserControl.MiniDepartMent = function () {

    UserControl.MiniDepartMent.superclass.constructor.call(this);
    
    this.initComponents();
    this.bindEvents();
}

mini.extend(UserControl.MiniDepartMent, mini.ButtonEdit, {
    uiCls: 'mini-dep',
    single: true,
       initComponents: function () {
    	var el=this.getEl();
    	el.className="mini-buttonedit icon-dep-button";
    },
    bindEvents: function () {
        this.on('buttonclick', _DepButtonClick);
    },
    setSingle: function (value) {
    	this.single=value;
    },
    
    getAttrs: function (el) {
        var attrs = UserControl.MiniDepartMent.superclass.getAttrs.call(this, el);
        mini._ParseBool(el, attrs, ["single"]);
        return attrs;
    }
});

mini.regClass(UserControl.MiniDepartMent, "depControl");

/**
 * 富文本框。
 * <div id="group" name="group" class="mini-ueditor" 
 *       style="width:auto;" readOnly="true" >初始值设置</div>
 * 属性：
 * readOnly：是否只读	       
 *  
 */
UserControl.MiniUEditor = function () {

    UserControl.MiniUEditor.superclass.constructor.call(this);
    
    this.initComponents();
    this.bindEvents();
}

mini.extend(UserControl.MiniUEditor, mini.Panel, {
    uiCls: 'mini-ueditor',
    formField:true,
    editor:null,
    readOnly:false,
    value:"",
    initComponents: function () {
    	
    	var el=this.getEl();
    	var body=this.getBodyEl();
    	body.id=this.uid +"_body";
	    this.set({
       		showHeader:false,
       		showToolbar:false,
       		showFooter:false
        });
	    
	  //加载UEDITOR.JS。
	    if(!ParamsJson.editor_js_loaded){
	    	var aryUrl=[
	    	         __rootPath+"/scripts/ueditor/ueditor-form.config.js" ,
	    	         __rootPath+"/scripts/ueditor/ueditor.all.min.js",
	    	         __rootPath+"/scripts/ueditor/lang/zh-cn/zh-cn.js" ];
	    	$.getScripts({urls: aryUrl });
	    	ParamsJson.editor_js_loaded=true;
	    }
	   this.loadEditor();
    },    
    /**
     * 加载编辑器。
     */
    loadEditor:function(){
    	var id=this.uid +"_body";
    	var self=this;
    	
    	
		setTimeout(function(){
			
			var bodyEl=self.getBodyEl();
			
    		var val=bodyEl.innerHTML;
			if(self.readOnly){
				$("#" + id).html(val);
	    	}
	    	else{
	    		var bodyEl=self.getBodyEl();
	    		
	    		var	parent=$(bodyEl).closest(".mini-panel");
        		var width=parent.width();
        		var height=parent.height();
        		
        		
        		var val=bodyEl.innerHTML;
        		$(bodyEl).css("overflow","hidden");
        		bodyEl.innerHTML="";
        		self.editor= UE.getEditor(id);
        		self.editor.addListener("ready", function () {
        			
        			//调整编辑器高度
        			var editor=$(".edui-editor",parent);
        			var toolBar=$(".edui-editor-toolbarbox",parent);
        			var iframe=$(".edui-editor-iframeholder",parent);
        			var toolBarHeight= 70;
        	
        			editor.width(width-8);
        			editor.height(height-6);
        			iframe.width(width-8);
        			iframe.height(height-toolBarHeight-30);
        			self.editor.setContent(val);
            	});
	    	}
    	},10);
    },
    
    setReadOnly:function(val){
    	this.readOnly=val;
    },
    setValue:function(val){
    	this.value=val;
    	if(this.editor && this.readOnly !="true"){
    		this.editor.setContent(val);
    	}
    },
    getValue:function(){
    	if(!this.readOnly){
    		this.value= this.editor.getContent();
    	}
    	return this.value;
    },
   
    bindEvents: function () {
    },
    getAttrs: function (el) {
        var attrs = UserControl.MiniUEditor.superclass.getAttrs.call(this, el);
        mini._ParseBool(el, attrs,["readOnly"]);
        return attrs;
    }
    
});

mini.regClass(UserControl.MiniUEditor, "mini-editor");

/**
 * 图片控件。
 * <div id="group" name="group" class="mini-img"   style="width:auto;" value="图片ID" >初始值设置</div>
 * 属性：
 * value：{imgtype:'upload',val:""}     
 *    imgtype:
 *    upload: 上传
 *    url:直接填写URL
 * readOnly： 只读
 */
UserControl.MiniImg = function () {

    UserControl.MiniImg.superclass.constructor.call(this);
    
    this.initComponents();
    this.bindEvents();
}

mini.extend(UserControl.MiniImg, mini.Panel, {
    uiCls: 'mini-img',
    formField:true,
    readOnly:false,
    imgtype:"upload",
    value:"",
    initComponents: function () {
    	includeFormTemplate();
    	
    	var data={ctxPath:__rootPath};
    	var html=baiduTemplate('imgFile',data);
    	this.set({
    		showHeader:false,
    		showToolbar:true,
    		showFooter:false,
    		body:html
    	});
    },    
    setReadOnly:function(val){
    	console.info("setReadOnly");
    	this.readOnly=val;
    },
    setImgtype:function(val){
		if(val=="url"){
			var body=this.getBodyEl();
			var bodyContainer=$(body);
			var showBigPic=$(".showBigPic",bodyContainer);
			showBigPic.remove();
		}
    	this.imgtype=val;
    },
    /**
     * 设置值
     */
    setVal:function(val){
    	var str=mini.encode( {imgtype:this.imgtype,val:val});
    	this.setValue(str);
    },
    setValue:function(val){
    	this.value=val;
    	if(val){
    		var obj=mini.decode(val);
    		var body=this.getBodyEl();
    		var bodyContainer=$(body);
    		var uploadFile=$(".upload-file",bodyContainer);
    		var imgVal=obj.val;
    		if(obj.imgtype=="upload"){
    			uploadFile.attr('src', __rootPath+'/sys/core/file/imageView.do?thumb=true&fileId=' + imgVal);
    		}
    		else{
    			if(imgVal.startWith("http")){
    				uploadFile.attr('src', imgVal);
    			}
    			else{
    				uploadFile.attr('src', __rootPath + imgVal);
    			}
    		}
    		
    	}
    },
    getValue:function(){
    	return this.value;
    },
   
    bindEvents: function () {
    	var self=this;
    	setTimeout(function(){
    		if(self.readOnly) return;
    		
    		var body=self.getBodyEl();
    		var bodyContainer=$(body);
    		
    		var uploadFile=$(".upload-file",bodyContainer);
    		var showBigPic=$(".showBigPic",bodyContainer);
    		var showButton=$(".showButton",bodyContainer);
    		
    		var t;
    		uploadFile.on('click', function() {
    			var img = this;
    			if(self.imgtype=="upload"){
    				_UserImageDlg(true, function(imgs) {
        				if (imgs.length == 0) return;
        				
        				var json={imgtype:'upload'};
        				json.val= imgs[0].fileId;
        				
        				self.setValue(mini.encode(json));
        			});
    			}
    			else{
    				_OpenWindow({
    					url:__rootPath+'/scripts/ueditor/dialogs/custom/imgurl.jsp',
    					height:200,
    					width:500,
    					title:"填写图片路径",
    					onload: function () {       //弹出页面加载完成
    				        var iframe = this.getIFrameEl(); 
    				        var val=self.getValue();
    				        if(!val) return;
    				        var json=mini.decode(val);
    				        iframe.contentWindow.setUrl(json.val); 
    				    },
    					ondestroy:function(action){
    						if(action!='ok')return;
    						var iframe = this.getIFrameEl();
    			            //获取选中、编辑的结果
    			            var url = iframe.contentWindow.getUrl();
    			            var json={imgtype:'url',val:url};
    			            self.setValue(mini.encode(json));
    					}
    				});
    			}
    			
    		});
    		uploadFile.on('mouseover', function() {
    			clearTimeout(t);
    			showBigPic.show();
    		});
    		uploadFile.on('mouseout', function() {
    			t = setTimeout(function(){
    					showBigPic.hide();
    				},2000);
    		});
    		showButton.on('click',function(){
    			var fileValue = mini.decode(self.value);
    			var id = fileValue.val;
    			this.setAttribute("href",this.getAttribute("href1")+id);
    		});
    		
    	})
    	
    },
    getAttrs: function (el) {
        var attrs = UserControl.MiniImg.superclass.getAttrs.call(this, el);
        mini._ParseBool(el, attrs,["readOnly"]);
        mini._ParseString(el, attrs,["imgtype","val"]);
        return attrs;
    }
    
});

mini.regClass(UserControl.MiniImg, "imgControl");


/**
 * 月份控件。
 */
UserControl.MiniMonth = function () {

    UserControl.MiniMonth.superclass.constructor.call(this);
    
    this.initComponents();
    this.bindEvents();
}

mini.extend(UserControl.MiniMonth, mini.MonthPicker, {
    uiCls: 'mini-month',
    initComponents: function () {
    },
    bindEvents: function () {
      
    }
  
});

mini.regClass(UserControl.MiniMonth, "monthControl");


/**
 * 时间控件
 */
UserControl.MiniTime = function () {

    UserControl.MiniTime.superclass.constructor.call(this);
    
    this.initComponents();
    this.bindEvents();
}

mini.extend(UserControl.MiniTime, mini.TimeSpinner, {
    uiCls: 'mini-time',
    initComponents: function () {
    },
    bindEvents: function () {
    }
  
});

mini.regClass(UserControl.MiniTime, "timeControl");


UserControl.MiniForm = function () {

    UserControl.MiniForm.superclass.constructor.call(this);
    
    this.initComponents();
    this.bindEvents();
}

mini.extend(UserControl.MiniForm, mini.Panel, {
    uiCls: 'mini-form',
    formField:true,
    value:"",
    initComponents: function () {
    },
    bindEvents: function () {
    },
    getValue:function(){
    	var body=this.getBodyEl();
    	var obj={};
    	$("input",$(body)).each(function(){
    		var o=$(this);
    		obj[o.attr("name")]=o.val();
    	})
    	return JSON.stringify(obj);
    },
    setValue:function(val){
    	if(!val) return;
    	this.value=val;
    }
    
  
});

mini.regClass(UserControl.MiniForm, "formControl");


/**
 * <input name="solution" class="mini-relatedsolution" 
 * plugins="mini-relatedsolution" label="solution" solutionname="一个流程" 
 * solution="2400000012319374" chooseitem="single" mwidth="0" wunit="px" mheight="0" hunit="%" style=""/>
 */
UserControl.MiniRelatedSolution = function () {

    UserControl.MiniRelatedSolution.superclass.constructor.call(this);
    this.initComponents();
    this.bindEvents();
}



mini.extend(UserControl.MiniRelatedSolution, mini.Panel, {
    uiCls: 'mini-relatedsolution',
    formField:true,
    files:{},
    readOnly:false,
    required:false,
    initComponents: function () {
    	//加载模版到页面。
    	if(ParamsJson.related_Template_loaded) return;
    	var url=__rootPath +"/scripts/customer/relatedSolutionPanelTemplate.html";
    	var fileContent=$.getFile(url);
    	var jqTemplate=$("#relatedSolutionTemplate");
    	if(jqTemplate.length==0){
    		$("body").append(fileContent);
    		ParamsJson.related_Template_loaded=true;
    	}
    	
    	var html="<a name='relatedInstance' class='mini-button' iconCls='icon-upload' >选择实例</a>" +
    			"<a name='clean' class='mini-button' iconCls='icon-clear' >清空</a>";
    	
    	this.clearData();
    	
    	this.set({
    		showHeader:false,
    		showToolbar:true,
    		showFooter:false,
    		toolbar:html
    	});    
    },
    
    bindEvents: function () {
        this.relatedInstanceBtn = mini.getByName('relatedInstance', this);
        this.cleanBtn = mini.getByName('clean',this);
        var that = this;
       
        this.relatedInstanceBtn.on('click', function (e) {
        	_RelatedSolutionButtonClick(that,{callback:function(insts){
				that.setInstance(insts);
			}});
        });
        this.cleanBtn.on('click', function (e) {
        	that.cleanInst();
        });   
        
    },
    /**
     * 返回数据。
     */
    getValue: function () {
    	var tmp=this.getInsts();
    	if(tmp.length==0) return "";
        return mini.encode(tmp);
    },
    
    /**
     * 转换成实例对象
     */
    convertInstance:function(inst){
    
    	var obj={instId:inst.instId,subject:inst.subject};
    	return obj; 
    },
    /**
     * 设置实例。
     */
    setInstance:function(upFiles){
    	var tmpfiles=this.getInsts();
    	for(var i=0;i<upFiles.length;i++){
    		var upFile=upFiles[i];
    		var file=this.convertInstance(upFile);
    		var subject=file.subject;
    		if(!this.isInstExist(subject )){
    			tmpfiles.push(file);
    		}
    	}
    	this.displayInst();
    },
    
    
    /**
     * 显示实例。
     */
    displayInst:function(){
    	this.getBodyEl().innerHTML="";
    	var html=this.getHtmls();
    	this.set({
    		body:html
    	});
    	this.bindRemove();
    	
    	
    },
    /**
     * 处理单个实例删除。
     */
    bindRemove:function(){
    	var buttons=mini.getsbyName("removeInstance", this);
    	var self_=this;
    	for(var i=0;i<buttons.length;i++){
    		var btn=buttons[i];
    		btn.on('click', function (e) {
    			var btnObj=e.sender;
    			var el=btnObj.el;
    			var parentLi=$(el).closest("li");
    			var instId=parentLi.attr("id").replace("li_","");
    			var files=self_.getInsts();
    			for(var j=0;j<files.length;j++){
    				if(instId==files[j].instId){
    					files.splice(j,1);
    				}
    			}
    			//加载。
    			self_.displayInst();
    	    });   
    	}
    },
    /**
     * 判断实例是否已经选择。
     */
    isInstExist:function(fileName){
    	var tmpfiles=this.getInsts();
    	for(var j=0;j<tmpfiles.length;j++){
			if(fileName==tmpfiles[j].fileName){
				return true;
			}
		}
    	return false;
    },
    /**
     * 清除数据。
     */
    clearData:function(){
    	this.files[this.uid]=[];
    },
    /**
     * 设置数据。
     */
    setData:function(val){
    	this.files[this.uid]=val;
    },
    /**
     * 获取这个控件的数据。
     */
    getInsts:function(){
    	var tmp=this.files[this.uid];
    	return tmp;
    },
    setReadOnly: function (value) {
    	this.readOnly=value;
    	if(!value) return;
    	this.displayInst();
    	
		this.set({
			showHeader:false,
    		showFooter:false,
    		showToolbar:false,
    		toolbar:""
		})
    },
    /**
     * 清除所有实例
     */
    cleanInst:function(){
    	this.clearData();
    	var body=this.getBodyEl();
    	body.innerHTML="";
    },
    /**
     * 返回HTML
     */
    getHtmls:function(){
    	
    	var tmpfiles=this.getInsts();
    	var write=!this.readOnly;
    	
    	var data={"list":tmpfiles,ctxPath:__rootPath,write:write};
    	
    	var html=baiduTemplate('relatedInstanceScript',data);
    	return html;
    },
    /**
     * 设置数据。
     */
    setValue:function(val){
    	if(!val) val="[]";
    	if((typeof val)=="string"){
    		this.setData(mini.decode(val));
    	}
    	else{
    		this.setData(val);
    	}
    	this.displayInst();
    },
    setSingle: function (value) {
    	this.single=value;
    },
    getAttrs: function (el) {
        var attrs = UserControl.MiniRelatedSolution.superclass.getAttrs.call(this, el);
        mini._ParseString(el, attrs,["chooseitem","solution"]);
        return attrs;
    }
});

mini.regClass(UserControl.MiniRelatedSolution, "relatedSolutionControl");



