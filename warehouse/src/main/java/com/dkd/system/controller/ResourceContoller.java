package com.dkd.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.system.bo.Resource;
import com.dkd.system.bo.User;
import com.dkd.system.form.ResourceForm;
import com.dkd.system.service.IResourceService;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.page.Page;
import com.dkd.utils.uuid.UUIDGenerator;

/**
 * 用户管理Contoller
 *
 * @author sy
 */

@Controller
@RequestMapping(value = "/resource")
public class ResourceContoller {

	@javax.annotation.Resource
    private IResourceService resourceService;
	
    /**
     * 跳转用户查询页
     * @return
     */
    @RequestMapping("/resource.do")
    public String query() {
    	return "system/resource/query";
    }
   
    /**
     * 查询资源权限
     * @return
     */
    @SuppressWarnings("unchecked")
	@RequestMapping("/treeGrid.do")
    @ResponseBody
    public JsonResult<Resource> treeGrid(@RequestParam (value = "page", required = false) int start,
			@RequestParam(value = "rows",required = false) int length,
			@RequestParam int draw,
			@RequestParam String resource_name,
			@RequestParam String id
			) {
    	JsonResult<Resource> js = new JsonResult<Resource>();
    	CurrencyPage<Resource> cpage = new CurrencyPage<Resource>();
    	try {
    		cpage.setPageNum(start);
			cpage.setPageSize(length);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("resource_name", resource_name);
    		map.put("parent_id", id);
    		cpage.setQueryTerms(map);
    		CurrencyPage<Resource> cp = resourceService.treeGrids(cpage);
    		List<Resource> list = cp.getPageInfo().getList();
    		js.createSuccessJsonResult(draw, cp.getPageInfo().getTotal(), list);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult("查询错误");
    	}
    	return js;
    }
    
	@RequestMapping("/selectChilds.do")
	@ResponseBody
	public List<Resource> selectChilds(
			@RequestParam(value = "page", required = false) int start,
			@RequestParam(value = "rows", required = false) int length,
			@RequestParam int draw, @RequestParam String resource_name,
			@RequestParam String id) {

		return resourceService.selectChilds(id);
	}
    
    @RequestMapping("/allTreeGrid.do")
    @ResponseBody
    public List<Resource> allTreeGrid(boolean flag) {
    	return resourceService.allTree(flag);
    }
    
    /**
     * 删除资源权限
     * @param id
     * @return
     */
    @RequestMapping("/deleteResource.do")
    @ResponseBody
    public JsonResult<Resource> deleteResource(String id) {
    	JsonResult<Resource> js = new JsonResult<Resource>();
    	User user = (User) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
    	String userid = user.getUser_id();
    	try {
    		resourceService.delete(id);
    		js.createSuccessJsonResult("删除成功");
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
       return js;
    }
    
    /**
     * 新建资源或编辑
     * @param id
     * @param pid
     * @return
     */
    @RequestMapping("/editResource.do")
    @ResponseBody
    //@WorkOperationLog(module = "权限管理", paramName = "编辑", function= "editResource" )
    public JsonResult<Resource> editResource(@RequestBody Resource resource) {
    	JsonResult<Resource> js = new JsonResult<Resource>();
    	User user = (User) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
    	String userid = user.getUser_id();
    	try {
    		if(StringUtils.isEmpty(resource.getParent_id())) {
    			resource.setParent_id("0");
    		}
    		if(!StringUtils.isEmpty(resource.getResource_id())) {
    			
    			resourceService.edit(resource, resource.getResource_id());
    		} else {
    			resource.setResource_id(UUIDGenerator.getUUID());
    			resourceService.insert(resource);
    		}
    		js.createSuccessJsonResult("添加成功");
    	} catch (Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
    	return js;
    }
    
    /**
     * 编辑查看
     * @param id
     * @return
     */
    @RequestMapping(value="editShow.do",method = RequestMethod.GET)
    @ResponseBody
    public JsonResult<Resource> editShow(@RequestParam(value="id") String id) {
    	User user = (User) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
    	String userid = user.getUser_id();
    	JsonResult<Resource> js = new JsonResult<Resource>();
    	try {
    		Resource resource = resourceService.selectByPk(id);
    		JSONObject jb = JSONObject.fromObject(resource);
    		js.createSuccessJsonResult(resource);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
       return js;
    }

  
    

}
