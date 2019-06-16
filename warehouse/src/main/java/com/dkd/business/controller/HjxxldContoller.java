package com.dkd.business.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.business.bo.Hjxxld;
import com.dkd.business.service.HjxxldService;
import com.dkd.system.service.IDictionaryService;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.uuid.UUIDGenerator;


/**
 * 部门管理Contoller
 *
 * @author sy
 */

@Controller
@RequestMapping(value = "/hjxxld")
public class HjxxldContoller {

	@Autowired
	private HjxxldService hjxxldService;
	
	@Autowired
	private IDictionaryService dictionaryService;
	/**
	 * 货架接口
	 * @return
	 */
	@RequestMapping("/selectHjCombobox.do")
    @ResponseBody
	public List<Hjxxld> selectHjCombobox() {
		return hjxxldService.selectAll();
	}
	/**
	 * 跳转货架查询页
	 * @return
	 */
	@RequestMapping(value = "/query.do")
	public String hclyquery() {
		return "business/hjxxld/hjxxldquery";
	}
	/**
	 * 查询货架信息
	 * @return
	 * 展示列表
	 */
	@RequestMapping(value="/queryList.do")
	@ResponseBody
	public JsonResult<Hjxxld> queryList(@RequestParam (value = "page", required = false) int start,
			@RequestParam(value = "rows",required = false) int length,
			@RequestParam int draw,
			@RequestParam String name,
			@RequestParam String ckmc,
			@RequestParam String hjbm,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date beginDate,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate
			) {
		JsonResult<Hjxxld> js = new JsonResult<Hjxxld>();
		CurrencyPage<Hjxxld> cpage = new CurrencyPage<Hjxxld>();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			map.put("name", name);
			map.put("ckmc", ckmc);
			map.put("hjbm", hjbm);
			map.put("beginDate", beginDate);
			map.put("endDate", endDate);
			cpage.setPageNum(start);
			cpage.setPageSize(length);
			cpage.setQueryTerms(map);
			CurrencyPage<Hjxxld> cp = hjxxldService.queryPage(cpage);
			js.createSuccessJsonResult(draw, cp.getPageInfo().getTotal(), cp.getPageInfo().getList());
		} catch(Exception e) {
			e.printStackTrace();
			js.createErrorJsonResult("查询错误,请联系管理员");
		}
		return js;
	}
	/**
	 * 删除方法
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/deletehjxxld.do")
	@ResponseBody
	public JsonResult<Hjxxld> deletehjxxld(String id) {
		JsonResult<Hjxxld> js = new JsonResult<Hjxxld>();
		try {
			int result = hjxxldService.delete(id);
			if(result > 0) {
				js.createSuccessJsonResult("删除成功");
			}
		} catch(Exception e) {
			e.printStackTrace();
			js.createErrorJsonResult("删除失败");
		}
		return js;
	}
	/**
	 * 查询方法
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/editShow.do")
	@ResponseBody
	public JsonResult<Hjxxld> editShow(String id) {
		Hjxxld selectByPk = hjxxldService.findById(id);
		JsonResult<Hjxxld> js = new JsonResult<Hjxxld>();
		js.createSuccessJsonResult(selectByPk);
		return js;
	}
	/**
	 * 保存方法
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/save.do")
	@ResponseBody
	public String save(@RequestBody Hjxxld hjxxld) {
		int i;
		hjxxld.setIsdel("N");
		hjxxld.setCjsj(new Date());
		if(StringUtils.isEmpty(hjxxld.getHjxxid()) ){
			hjxxld.setHjbm(UUIDGenerator.getUUID());
			hjxxld.setHjxxid(UUIDGenerator.getUUID());
			i = hjxxldService.insert(hjxxld);
		}else{
			i = hjxxldService.update(hjxxld);
		}
		if(i>0){
			return "0";//成功
		}else{
			return "";//失败
		}
	}
	
}
