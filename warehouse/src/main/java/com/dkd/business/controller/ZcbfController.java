package com.dkd.business.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.business.service.HjxxldService;
import com.dkd.business.service.OutWarehouseService;
import com.dkd.business.service.SbbService;
import com.dkd.business.service.ZcbfService;
import com.dkd.system.bo.User;
import com.dkd.utils.json.JsonResult;
@Controller
@RequestMapping(value = "/zcbf")
public class ZcbfController {
	@javax.annotation.Resource
	private OutWarehouseService outWarehouseService;
	@javax.annotation.Resource
	private SbbService sbbService;
	@javax.annotation.Resource
	private HjxxldService hjxxService;
	@javax.annotation.Resource
	private ZcbfService zcbfService;
	
	
	/**
	 * 新建编辑出库信息
	 * @param crkjlb
	 * @return
	 */
	@RequestMapping("/edit.do")
    @ResponseBody
    public JsonResult<Crkjlb> editZcbf(@RequestBody Crkjlb crkjlb) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	JsonResult<Crkjlb> js = new JsonResult<Crkjlb>();
    	try {
    		int result=zcbfService.editZcbf(crkjlb, user);
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
		Crkjlb crkjlb = zcbfService.editShow(crkid);
		js.createSuccessJsonResult(crkjlb);
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
		OutWarehouseForm  ohf = zcbfService.selectShowBycrk(crkid);
		js.createSuccessJsonResult(ohf);
		return js;
	}
	/**
	 * 
	 * @param crkid
	 * @return
	 */
	@RequestMapping("/delete.do")
	@ResponseBody
	public JsonResult<OutWarehouseForm> delete(String crkid,Model model) {
		JsonResult<OutWarehouseForm> js = new JsonResult<OutWarehouseForm>();
		int deletezcbf = zcbfService.deletezcbf(crkid);
		if(deletezcbf>0){
			zcbfService.deleteIsdel(crkid);
		}
		return js.createSuccessJsonResult("删除成功");
	}
}
