package com.dkd.system.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.system.bo.Dictionary;
import com.dkd.system.bo.User;
import com.dkd.system.form.DictionaryForm;
import com.dkd.system.service.IDictionaryService;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.page.Page;
import com.dkd.utils.uuid.UUIDGenerator;

/**
 * 字典管理Contoller
 *
 * @author sy
 */

@Controller
@RequestMapping(value = "/dictionary")
public class DictionaryContoller {

	@Resource
    private IDictionaryService dictionaryService;

 
    /**
     * 跳转字典查询页
     * @return
     */
    @RequestMapping("/dictionary.do")
    public String query() {
    	return "system/dictionary/query";
    }
    /**
     * 跳转字典副查询页
     * @return
     */
     @RequestMapping("/typequery.do")
    public String query1(String id,Model model) {
    	model.addAttribute("id", id);
    	return "system/dictionary/typequery";
    }

     /**
      * 查询字典
     * @return
     */
     @RequestMapping("/querylist.do")
     @ResponseBody
 	public JsonResult<Dictionary> querylist(@RequestParam (value = "page", required = false) int start,
 			@RequestParam(value = "rows",required = false) int length,
 			@RequestParam int draw,
 			@RequestParam String dictionary_name,
 			@RequestParam String id
 			) {
    	 JsonResult<Dictionary> js = new JsonResult<Dictionary>();
     	 CurrencyPage<Dictionary> cpage = new CurrencyPage<Dictionary>();
     	try {
     		cpage.setPageNum(start);
 			cpage.setPageSize(length);
 			Map<String,Object> map = new HashMap<String,Object>();
 			map.put("dictionary_name", dictionary_name);
     		cpage.setQueryTerms(map);
     		CurrencyPage<Dictionary> cp = dictionaryService.queryPage(cpage);
     		List<Dictionary> list = cp.getPageInfo().getList();
     		for(Dictionary dictionary : list) {
     			if(null != dictionary.getParent_id()) {
     				dictionary.setPid(dictionary.getParent_id());
				}
     			dictionary.setId(dictionary.getDictionary_id());
     			dictionary.setName(dictionary.getDictionary_name());
     			dictionary.setState(dictionary.getState());
     		}
     		js.createSuccessJsonResult(draw, cp.getPageInfo().getTotal(), list);
     	} catch(Exception e) {
     		e.printStackTrace();
     		js.createErrorJsonResult("查询错误");
     	}
     	return js;
 	}
    
     /**
      * 查询子类
      * @param start
      * @param length
      * @param draw
      * @param resource_name
      * @param id
      * @return
      */
	@RequestMapping("/selectChilds.do")
	@ResponseBody
	public List<Dictionary> selectChilds(
			@RequestParam(value = "page", required = false) int start,
			@RequestParam(value = "rows", required = false) int length,
			@RequestParam int draw, @RequestParam String dictionary_name,
			@RequestParam String id) {

		return dictionaryService.selectChilds(id);
	}
    
    /**
     * 副页面
     * 列表显示
     * @return
     */
    @RequestMapping("/queryNode.do")
    @ResponseBody
    public List<Dictionary> queryNode(String id) {
    	return dictionaryService.selectByParentId(id);
    }
    
    /**
     * @param paramsid
     * @return
     * 父级
     */
    @RequestMapping("/queryNodeParent.do")
    @ResponseBody
    public List<Dictionary> queryNodeParent(String paramsid) {
    	
    	return dictionaryService.selectByParentId(paramsid);
    }
  
     
     /**
      * 查询类型
     * @return
     */
    @RequestMapping("/selectType.do")
     @ResponseBody
     public List<Dictionary> selectType(String id) {
     	return dictionaryService.selectType(id);
     }
     
     /**
      * 删除字典
      * @param id
      * @return
      */
    @RequestMapping("/deleteDictionary.do")
    @ResponseBody
    public JsonResult<Dictionary> deleteDictionary(String id) {
    	JsonResult<Dictionary> js = new JsonResult<Dictionary>();
    	try {
    		dictionaryService.delete(id);
    		js.createSuccessJsonResult("删除成功");
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
       return js;
    }
    
     /**
      * 新建字典
      * @param id
      * @param pid
      * @return
      */
    @RequestMapping("/editDictionary.do")
    @ResponseBody
    public JsonResult<Dictionary> editDictionary(@RequestBody Dictionary dictionary) {
    	JsonResult<Dictionary> js = new JsonResult<Dictionary>();
    	try {
    		if(StringUtils.isEmpty(dictionary.getParent_id())) {
    			dictionary.setParent_id("0");
    		}
    		if(StringUtils.isEmpty(dictionary.getDictionary_order())) {
    			dictionary.setDictionary_order(0);
    		}
    		if(StringUtils.isEmpty(dictionary.getIsDel())) {
    			dictionary.setIsDel(0);
    		}
    		//不等于空.插入数据
    		if(!StringUtils.isEmpty(dictionary.getDictionary_id())) {
    			dictionaryService.edit(dictionary, dictionary.getDictionary_id());
    			js.createSuccessJsonResult("修改成功");
    		} else {
    			dictionary.setDictionary_id(UUIDGenerator.getUUID());
    			dictionaryService.insert(dictionary);
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
    public JsonResult<Dictionary> editShow(@RequestParam(value="id") String id) {
    	JsonResult<Dictionary> js = new JsonResult<Dictionary>();
    	try {
    		Dictionary dictionary =dictionaryService.selectByPk(id);
    		js.createSuccessJsonResult(dictionary);
    	} catch(Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
       return js;
    }
 
 	@RequestMapping("/selectChildsByPcode.do")
 	@ResponseBody
 	public JsonResult<Dictionary> selectChildsByPcodeJson(String code) {
 		JsonResult<Dictionary> js = new JsonResult<Dictionary>();
 		List<Dictionary> list = new ArrayList<Dictionary>();
 		if(org.apache.commons.lang.StringUtils.isNotEmpty(code)) {
 			list = dictionaryService.selectChildsByPcode(code);
 		} else {
 			list = dictionaryService.selectAll();
 		}
 		js.createSuccessJsonResult(list);
 		return js;
 	}
 	
 	
 	 @RequestMapping("/allTreeGrid.do")
     @ResponseBody
     public List<Dictionary> allTreeGrid(boolean flag) {
     	return dictionaryService.allTree(flag);
     }
 	 
 	 
 	 @RequestMapping("/selectChildsByPcodemini.do")
 	 @ResponseBody
 	 public List<Dictionary> selectChildsByPcode(String code) {
 		List<Dictionary> list = new ArrayList<Dictionary>();
 		if(org.apache.commons.lang.StringUtils.isNotEmpty(code)) {
 			list = dictionaryService.selectChildsByPcode(code);
 		} else {
 			list = dictionaryService.selectAll();
 		}
 		return list;
 	 }
 	 
 	/**
 	 * 根据id查询子集
 	 * @param id
 	 * @return
 	 */
 	@RequestMapping("/selectChildsByPid.do")
	@ResponseBody
 	public List<Dictionary> selectChildsByPid(String id) {
 		return dictionaryService.selectChildsByPid(id);
 	}
	
}
