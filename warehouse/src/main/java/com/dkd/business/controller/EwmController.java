package com.dkd.business.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkd.business.bo.EwmForm;
import com.dkd.business.bo.Hjxxld;
import com.dkd.business.bo.Sbb;
import com.dkd.business.service.HjxxldService;
import com.dkd.business.service.SbbService;
import com.dkd.system.service.IDepartmentService;
import com.dkd.utils.json.JsonResult;

/**
 * 二维码
 * @author jsp
 *
 */
@Controller
@RequestMapping("/ewm")
public class EwmController {
	
	@Autowired
	private SbbService sbbService;
	@Autowired
	private HjxxldService hjxxService;
	@Autowired
	private IDepartmentService departmentService;

	/**
	 * 设备二维码
	 * @return
	 */
	@RequestMapping("/sbewm.do")
	public String querySbEwm() {
		return "business/ewm/sbewm";
	}
	
	/**
	 * 库位二维码
	 * @return
	 */
	@RequestMapping("/hjewm.do")
	public String queryHjEwm() {
		return "business/ewm/hjewm";
	}
	
	/**
	 * 部门二维码
	 * @return
	 */
	@RequestMapping("/bmewm.do")
	public String queryBmEwm() {
		return "business/ewm/bmewm";
	}
	
	/**
	 * 设备二维码信息
	 * 设备id
	 * 品名
	 * 一级分类
	 * @return
	 */
	@RequestMapping(value="/jsonSb.do")
	public String jsonSb(String sbids,Model model) {
		String[] strs = sbids.split(",");
		List<String> list = new ArrayList<String>();
		for(String str : strs) {
			list.add(str);
		}
		List<EwmForm> ewmList = sbbService.selectEwmSb(list);
		model.addAttribute("ewmList", ewmList);
		return "business/ewm/sbewmdy";
	}
	
	
	/**
	 * 货架二维码信息
	 * 
	 * @return
	 */
	@RequestMapping(value="/jsonHj.do")
	public String jsonHj(String hjids,Model model) {
		String[] strs = hjids.split(",");
		List<String> list = new ArrayList<String>();
		for(String str : strs) {
			list.add(str);
		}
		List<EwmForm> ewmList = hjxxService.selectEwmHj(list);
		model.addAttribute("ewmList", ewmList);
		return "business/ewm/hjewmdy";
	}
	
	/**
	 * 部门二维码信息
	 * 
	 * @return
	 */
	@RequestMapping(value="/jsonBm.do")
	public String jsonBm(String bmids,Model model) {
		String[] strs = bmids.split(",");
		List<String> list = new ArrayList<String>();
		for(String str : strs) {
			list.add(str);
		}
		List<EwmForm> ewmList = departmentService.selectEwmBm(list);
		model.addAttribute("ewmList", ewmList);
		return "business/ewm/bmewmdy";
	}
}
