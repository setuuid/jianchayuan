package com.dkd.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.system.bo.Role;
import com.dkd.system.bo.User;
import com.dkd.system.form.RoleForm;
import com.dkd.system.service.IRoleService;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.page.Page;
import com.dkd.utils.uuid.UUIDGenerator;

/**
 * 角色管理Contoller
 *
 * @author sy
 */

@Controller
@RequestMapping(value = "/role")
public class RoleContoller {

	@Resource
	private IRoleService roleService;


	/**
	 * 跳转角色查询页
	 * 
	 * @return
	 */
	@RequestMapping("/query.do")
	public String query() {
		return "system/role/query";
	}
	
	/**
	 * 角色授权页
	 * @return
	 */
	@RequestMapping("/roleGrant.do")
	public String roleGrant(String id) {
		return "system/role/roleGrant";
	}
	
	/**
	 * 角色列表查询
	 * @param start
	 * @param length
	 * @param draw
	 * @param role_name
	 * @param role_level
	 * @return
	 */
	@RequestMapping("/querylist.do")
    @ResponseBody
	public JsonResult<Role> querylist(@RequestParam (value = "page", required = false) int start,
			@RequestParam(value = "rows",required = false) int length,
			@RequestParam int draw,
			@RequestParam String role_name,
			@RequestParam String role_level) {
		JsonResult<Role> js = new JsonResult<Role>();
		RoleForm roleForm = new RoleForm();
		roleForm.setRole_name(role_name);
		roleForm.setRole_level(role_level);
		roleForm.setPageSize(length+"");
		roleForm.setPageNow(start+"");
		CurrencyPage<Role> cpage = new CurrencyPage<Role>();
    	try {
    		cpage.setPageNum(start);
			cpage.setPageSize(length);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("role_name", role_name);
    		map.put("role_level", role_level);
    		cpage.setQueryTerms(map);
    		CurrencyPage<Role> cp = roleService.queryPage(cpage);
    		List<Role> list = cp.getPageInfo().getList();
    		js.createSuccessJsonResult(draw, cp.getPageInfo().getTotal(), list);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult("查询错误");
    	}
    	return js;
	}
	
	/**
	 * 新建角色或编辑
	 * @param role
	 * @return
	 */
	@RequestMapping("/editRole.do")
    @ResponseBody
	public JsonResult<Role> editRole(@RequestBody Role role) {
		JsonResult<Role> js = new JsonResult<Role>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
    	String userid = user.getUser_id();
		try {
			if(!StringUtils.isEmpty(role.getRole_id())) {
				roleService.edit(role, role.getRole_id());
			} else {
				role.setRole_id(UUIDGenerator.getUUID());
				roleService.insert(role);
			}
			js.createSuccessJsonResult("添加成功");
		} catch (Exception e) {
			e.printStackTrace();
			js.createErrorJsonResult(e.getMessage());
		}
		return js;
	}
	
	/**
	 * 删除角色信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteRole.do")
    @ResponseBody
	public JsonResult<Role> deleteRole(String id) {
		JsonResult<Role> js = new JsonResult<Role>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
    	String userid = user.getUser_id();
		try {
			Role role = roleService.selectByPk(id);
			roleService.delete(id);
			js.createSuccessJsonResult("删除成功");
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
    public JsonResult<Role> editShow(@RequestParam(value="id") String id) {
    	User user = (User) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
    	String userid = user.getUser_id();
    	JsonResult<Role> js = new JsonResult<Role>();
    	try {
    		Role role = roleService.selectByPk(id);
    		JSONObject jb = JSONObject.fromObject(role);
    		js.createSuccessJsonResult(role);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
       return js;
    }
    
    /**
     * 查询角色与资源权限
     * @param id
     * @return
     */
    @RequestMapping(value="selectRoleResource.do",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult<Role> selectRoleResource(@RequestParam(value="id") String id) {
    	JsonResult<Role> js = new JsonResult<Role>();
    	try {
    		Role role = roleService.selectRoleResource(id);
    		js.createSuccessJsonResult(role);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
    	return js;
    }
    
    /**
     * 保存资源权限
     * @param role
     * @return
     */
    @RequestMapping(value="saveRoleResource.do",method = RequestMethod.POST) 
    @ResponseBody
    public JsonResult<Role> saveRoleResource(@RequestBody Role role) {
    	JsonResult<Role> js = new JsonResult<Role>();
    	try {
    		roleService.saveRoleResource(role);
    		js.createSuccessJsonResult("授权成功!");
    	} catch (Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
    	return js;
    }
	
    @RequestMapping("/searchrole")
	public String searchrole() {
		return "wf/designer/searchrole";
	}

}
