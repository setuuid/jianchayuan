package com.dkd.business.service;

import java.util.List;

import com.dkd.business.bo.EwmForm;
import com.dkd.business.bo.Hjxxld;
import com.dkd.system.service.IBaseService;


/**
 * 
 * @author lyj
 *
 */
public interface HjxxldService extends IBaseService<Hjxxld>  {

	Hjxxld findById(String id);
	
	/**
	 * 批量查询货架信息二维码
	 * @param hjxxid
	 * @return
	 */
	public List<EwmForm> selectEwmHj(List<String> hjxxid);

	
}
