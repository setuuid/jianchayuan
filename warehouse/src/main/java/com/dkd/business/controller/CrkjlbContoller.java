package com.dkd.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



/**
 * 出入库记录表Contoller
 * @author lyj
 *
 */
@Controller
@RequestMapping(value = "/crkjlb")
public class CrkjlbContoller {
	
	
	
	
	/**
	 * 查询已入库的库信息
	 * @param wply
	 * @param lx
	 * @param dqzt
	 * @return
	 */
	/*@RequestMapping("/selectSbCombobox.do")
    @ResponseBody
	public List<Sbb> selectSbCombobox(String wply, String lx,String dqzt) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("wply", wply);
		map.put("lx", lx);
		map.put("dqzt", dqzt);
		return sbbService.selectSbCombobox(map);
	}*/

}
