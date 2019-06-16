package com.dkd.business.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.Hjxxld;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.business.bo.Sbb;
import com.dkd.business.service.HjxxldService;
import com.dkd.business.service.OutWarehouseService;
import com.dkd.business.service.SbbService;
import com.dkd.system.bo.Department;
import com.dkd.system.bo.User;
import com.dkd.utils.json.JsonResult;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.uuid.UUIDGenerator;

/**
 * 耗材领用controller
 * @author jsp
 *
 */
@Controller
@RequestMapping(value = "/outwarehouse")
public class OutWarehouseController {


	@Autowired
	private OutWarehouseService outWarehouseService;
	@Autowired
	private SbbService sbbService;
	@Autowired
	private HjxxldService hjxxService;
	
	/**
	 * 跳转耗材领用管理列表
	 * @return
	 */
	@RequestMapping(value = "/hclyquery.do")
	public String hclyquery() {
		return "business/outwarehouse/hclyquery";
	}
	
	/**
	 * 跳转设备领用管理列表
	 * @return
	 */
	@RequestMapping(value = "/sblyquery.do")
	public String sblyquery() {
		return "business/outwarehouse/sblyquery";
	}
	
	/**
	 * 跳转资产调出管理列表
	 * @return
	 */
	@RequestMapping(value = "/zctcquery.do")
	public String zctcquery() {
		return "business/outwarehouse/zctcquery";
	}
	
	/**
	 * 根据 类型 状态 查询出库信息
	 * @param start
	 * @param length
	 * @param draw
	 * @param yjfl	一级分类
	 * @param ejfl	二级分类
	 * @param sjfl	三级分类
	 * @param pm	品名
	 * @param czsj	操作时间
	 * @param sldw	申领单位
	 * @param zt	状态 	1.入库 2.出库
	 * @param lx	类型	1.设备 2.耗材
	 * @param wply	物品来源 1.自产 2.暂存
	 * @param gh	新增归还状态,用来判断
	 * @return
	 */
	@RequestMapping(value = "/querylist.do")
	@ResponseBody
	public JsonResult<Crkjlb> querylist(@RequestParam (value = "page", required = false) int start,
			@RequestParam(value = "rows",required = false) int length,
			@RequestParam int draw,
			@RequestParam String yjfl,
			@RequestParam String ejfl,
			@RequestParam String sjfl,
			@RequestParam String pm,
			@RequestParam String sldw,
			@RequestParam String zt,
			@RequestParam String lx,
			@RequestParam String wply,
						  String gh,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date beginDate,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
		JsonResult<Crkjlb> js = new JsonResult<Crkjlb>();
		CurrencyPage<Crkjlb> cpage = new CurrencyPage<Crkjlb>();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			cpage.setPageNum(start);
			cpage.setPageSize(length);
			map.put("yjfl", yjfl);
			map.put("ejfl", ejfl);
			map.put("sjfl", sjfl);
			map.put("pm", pm);
			map.put("sldw", sldw);
			map.put("zt", zt);
			map.put("lx", lx);
			map.put("wply", wply);
			map.put("beginDate", beginDate);
			map.put("endDate", endDate);
			if(org.apache.commons.lang.StringUtils.isNotEmpty(gh)) {
				map.put("gh", gh);
			}
			cpage.setQueryTerms(map);
			CurrencyPage<Crkjlb> cp = outWarehouseService.queryPage(cpage);
			js.createSuccessJsonResult(draw, cp.getPageInfo().getTotal(), cp.getPageInfo().getList());
		} catch(Exception e) {
			e.printStackTrace();
			js.createErrorJsonResult("查询错误,请联系管理员");
		}
		
		return js;
		
	}
	
	
	/**
	 * 新建编辑出库信息
	 * @param crkjlb
	 * @return
	 */
	@RequestMapping("/editoutwarehouse.do")
    @ResponseBody
    public JsonResult<Crkjlb> editOutwarehouse(@RequestBody Crkjlb crkjlb) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	JsonResult<Crkjlb> js = new JsonResult<Crkjlb>();
    	try {
			int result = outWarehouseService.editOutWarehouse(crkjlb, user);
			if(result > 0) {
				js.createSuccessJsonResult("保存成功");
			}
    	} catch (Exception e) {
    		e.printStackTrace();
    		js.createErrorJsonResult(e.getMessage());
    	}
    	return js;
    }
	
	/**
	 * 编辑查看出库记录
	 * @param crkid
	 * @return
	 */
	@RequestMapping("/editShow.do")
    @ResponseBody
	public JsonResult<Crkjlb> editShow(String crkid) {
		JsonResult<Crkjlb> js = new JsonResult<Crkjlb>();
		Crkjlb crkjlb = outWarehouseService.selectByPk(crkid);
		js.createSuccessJsonResult(crkjlb);
		return js;
	}
	
	/**
	 * 删除出库记录
	 * @param crkid
	 * @return
	 */
	@RequestMapping("/deleteOutWarehouse.do")
    @ResponseBody
	public JsonResult<Crkjlb> deleteOutWarehouse(String crkid) {
		JsonResult<Crkjlb> js = new JsonResult<Crkjlb>();
		try {
			//删除出库记录时候,需要将删除数据反填回设备
			Crkjlb crkjl = outWarehouseService.selectByPk(crkid);
			Sbb sbb = sbbService.selectByPk(crkjl.getSbid());
			sbb.setSl(sbb.getSl() + crkjl.getLysl());
			int sresult = sbbService.updateOutWarehouse(sbb);
			if(sresult > 0) {
				int oresult = outWarehouseService.delete(crkid);
				if(oresult > 0) {
					js.createSuccessJsonResult("删除成功");
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			js.createErrorJsonResult("删除失败");
		}
		return js;
	}
	
	/**
	 * 
	 * @param crkid
	 * @return
	 */
	@RequestMapping("/show.do")
	@ResponseBody
	public JsonResult<OutWarehouseForm> show(String crkid,Model model) {
		JsonResult<OutWarehouseForm> js = new JsonResult<OutWarehouseForm>();
		OutWarehouseForm  ohf = outWarehouseService.selectShowBycrk(crkid);
		js.createSuccessJsonResult(ohf);
		return js;
	}
}
