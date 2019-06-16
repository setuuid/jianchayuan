package com.dkd.system.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.system.bo.Department;
import com.dkd.system.bo.User;
import com.dkd.system.form.UserInfoForm;
import com.dkd.system.service.IDepartmentService;
import com.dkd.system.service.IRoleService;
import com.dkd.system.service.IUserService;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.page.Page;
import com.dkd.utils.tree.Tree;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
	private IUserService userServiceImpl;
	
	@Resource
	private IDepartmentService departmentService;
	
	@Resource
	private IRoleService roleService;
	
	 /**
     * 跳转用户查询页
     * @return
     */
    @RequestMapping("/query.do")
    public String query() {
    	return "system/user/query";
    }
    
    /**
     * 查询用户
     * @param start
     * @param length
     * @param draw
     * @param username
     * @param realname
     * @param sex
     * @param isUse
     * @return
     */
    @RequestMapping("/querylist.do")
    @ResponseBody
    public JsonResult<User> querylist(@RequestParam (value = "page", required = false) int start,
			@RequestParam(value = "rows",required = false) int length,
			@RequestParam int draw,
			@RequestParam String username,
			@RequestParam String realname,
			@RequestParam String sex,
			@RequestParam String isUse) {
    	
    	JsonResult<User> js = new JsonResult<User>();
    	CurrencyPage<User> cpage = new CurrencyPage<User>();
    	try {
    		cpage.setPageNum(start);
			cpage.setPageSize(length);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("username", username);
    		map.put("realname", realname);
    		map.put("sex", sex);
    		map.put("isUse", isUse);
    		cpage.setQueryTerms(map);
    		CurrencyPage<User> cp = userServiceImpl.queryPage(cpage);
    		List<User> list = cp.getPageInfo().getList();
    		js.createSuccessJsonResult(draw, cp.getPageInfo().getTotal(), list);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult("查询错误");
    	}
    	return js;
    }
    
    /**
     * 查询部门信息
     * @return
     */
    @RequestMapping("/selectDepartment.do")
    @ResponseBody
    public List<Department> selectDepartment() {
    	return departmentService.treeGit();
    }
    
    /**
     * 查询角色信息
     * @return
     */
    @RequestMapping("/selectRole.do")
    @ResponseBody
    public List<Tree> selectRole() {
    	return roleService.selectAllRole();
    }
    
    /**
     * 新建或编辑用户
     * @param user
     * @return
     */
    @RequestMapping("/editUser.do")
    @ResponseBody
    public JsonResult<User> editRole(@RequestBody User user) {
    	JsonResult<User> js = new JsonResult<User>();
    	List<User> list = userServiceImpl.checkUser(user);
    	try {
    		if(null != list && list.size() > 0) {
    			js.createErrorJsonResult("已存在的用户名,请重新输入");
    		} else {
    			if(StringUtils.isEmpty(user.getUser_id())) {
    				userServiceImpl.insertUser(user);
    			} else {
    				userServiceImpl.updateUser(user);
    			}
    			js.createSuccessJsonResult("添加成功");
    		}
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
    public JsonResult<User> editShow(@RequestParam(value="id") String id) {
    	JsonResult<User> js = new JsonResult<User>();
    	try {
    		User user = userServiceImpl.selectByPk(id);
    		js.createSuccessJsonResult(user);
    	} catch (Exception e) {
    		e.printStackTrace();
			js.createErrorJsonResult(e.getMessage());
    	}
    	return js;
    }
    
    /**
     * 删除用户信息
     * @param id
     * @return
     */
    @RequestMapping("/deleteUser.do")
    @ResponseBody
    public JsonResult<User> deleteUser(@RequestParam(value="id") String id) {
    	JsonResult<User> js = new JsonResult<User>();
    	try {
    		userServiceImpl.delete(id);
    		js.createSuccessJsonResult("删除成功");
    	} catch (Exception e) {
    		e.printStackTrace();
			js.createErrorJsonResult(e.getMessage());
    	}
    	return js;
    }
    
    /**
     * 验证用户
     * @param user
     * @return
     */
    @RequestMapping("/checkUser.do")
    @ResponseBody
    public JsonResult<User> checkUser(@RequestBody User user) {
    	JsonResult<User> js = new JsonResult<User>();
    	try {
    		List<User> list = userServiceImpl.checkUser(user);
    		if(null != list && list.size() > 0) {
    			js.createErrorJsonResult("用户名已存在");
    		} else {
    			js.createSuccessJsonResult();
    		}
    		
    	} catch (Exception e) {
    		e.printStackTrace();
			js.createErrorJsonResult(e.getMessage());
    	}
    	return js;
    }
    
    @RequestMapping("/searchry")
	public String searchry() {
		return "wf/designer/searchry";
	}
	
	@RequestMapping("/searchdgry")
	public String searchdgry() {
		return "wf/designer/searchdgry";
	}

}
