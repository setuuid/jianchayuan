package com.dkd.system.controller;

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
import com.dkd.system.form.DepartmentForm;
import com.dkd.system.service.IDepartmentService;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.page.Page;
import com.dkd.utils.uuid.UUIDGenerator;

/**
 * 部门管理Contoller
 *
 * @author sy
 */

@Controller
@RequestMapping(value = "/department")
public class DepartmentContoller {

	@Resource
    private IDepartmentService departmentService;

    /**
     * 跳转部门查询页
     * @return
     */
    @RequestMapping("/department.do")
    public String query() {
    	return "system/department/query";
    }

     /**
      * 查询部门
     * @return
     */
    @RequestMapping("/querylist.do")
     @ResponseBody
     public List<Department> querylist() {
     	return departmentService.treeGit();
     }
    
    /**
     * 查询部门
     * @return
     */
    @SuppressWarnings("unchecked")
	@RequestMapping("/treeGrids.do")
    @ResponseBody
   // @WorkOperationLog(module = "部门管理", paramName = "查询", function= "treeGrids" )
    public JsonResult<Department> treeGrids(@RequestParam (value = "page", required = false) int start,
			@RequestParam(value = "rows",required = false) int length,
			@RequestParam int draw,
			@RequestParam String department_name,
			@RequestParam String id
			) {
    	JsonResult<Department> js = new JsonResult<Department>();
    	CurrencyPage<Department> cpage = new CurrencyPage<Department>();
    	try {
    		cpage.setPageNum(start);
			cpage.setPageSize(length);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("department_name", department_name);
    		map.put("parent_id", id);
    		cpage.setQueryTerms(map);
    		CurrencyPage<Department> cp = departmentService.treeGrids(cpage);
    		List<Department> list = cp.getPageInfo().getList();
    		js.createSuccessJsonResult(draw, cp.getPageInfo().getTotal(), list);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult("查询错误");
    	}
    		return js;
    	  }
    
    
	/**
	 * 
	 * @param start
	 * @param length
	 * @param draw
	 * @param department_name
	 * @param id
	 * @return
	 */
	@RequestMapping("/selectChilds.do")
	@ResponseBody
	public List<Department> selectChilds(
			@RequestParam(value = "page", required = false) int start,
			@RequestParam(value = "rows", required = false) int length,
			@RequestParam int draw, @RequestParam String department_name,
			@RequestParam String id) {

	return departmentService.selectChilds(id);
	}
     
     /**
      * 查询所有
     * @return
     */
    @RequestMapping("/allTreeGrid.do")
     @ResponseBody
     public List<Department> allTreeGrid(boolean flag) {
     	return departmentService.allTree(flag);
     }
     
     /**
      * 删除部门
      * @param id
      * @return
      */
    @RequestMapping("/deleteDepartment.do")
     @ResponseBody
     public JsonResult<Department> deleteDepartment(String id) {
     	JsonResult<Department> js = new JsonResult<Department>();
     	try {
     		departmentService.delete(id);
     		js.createSuccessJsonResult("删除成功");
     	} catch(Exception e) {
     		e.printStackTrace();
     		js.createErrorJsonResult(e.getMessage());
     	}
        return js;
     }
     
     /**
      * 新建部门或编辑
      * @param id
      * @param pid
      * @return
      */
    @RequestMapping("/editDepartment.do")
     @ResponseBody
     public JsonResult<Department> editDepartment(@RequestBody Department department) {
     	JsonResult<Department> js = new JsonResult<Department>();
     	try {
     		if(StringUtils.isEmpty(department.getParent_id())) {
     			department.setParent_id("0");
     		}
     		if(!StringUtils.isEmpty(department.getDepartment_id())) {
     			departmentService.edit(department, department.getDepartment_id());
     		} else {
     			department.setDepartment_id(UUIDGenerator.getUUID());
     			departmentService.insert(department);
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
	    public JsonResult<Department> editShow(@RequestParam(value="id") String id) {
	    	JsonResult<Department> js = new JsonResult<Department>();
	    	try {
	    		Department department =departmentService.selectByID(id);
	    		js.createSuccessJsonResult(department);
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    		js.createErrorJsonResult(e.getMessage());
	    	}
	       return js;
	    }
}
