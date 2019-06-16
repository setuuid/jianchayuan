package com.dkd.business.service;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.system.bo.User;
import com.dkd.system.service.IBaseService;


/**
 * 出库service
 * @author jsp
 *
 */
public interface OutWarehouseService extends IBaseService<Crkjlb>  {

	/**
	 * 新建编辑出库信息
	 * @param crkjlb
	 * @param user
	 * @return
	 */
	public int editOutWarehouse(Crkjlb crkjlb,User user);
	
	public OutWarehouseForm selectShowBycrk(String id);
}
