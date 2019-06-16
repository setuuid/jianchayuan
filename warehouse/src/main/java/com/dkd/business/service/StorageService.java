package com.dkd.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.Hjxxld;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.business.bo.Sbb;
import com.dkd.system.bo.User;
import com.dkd.system.service.IBaseService;
import com.dkd.utils.page.CurrencyPage;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


/**
 * 入库管理
 * @author lyj
 *
 */
@Service
@Transactional
public interface StorageService extends IBaseService<Crkjlb>  {

	
	/**
	 * 逻辑删除入库信息
	 * @param id
	 */
	public void  logicDelete(String id );
	
	
	
	
	/**
	 *  入库分页列表查询
	 * @param page
	 * @return
	 */
	public CurrencyPage<Crkjlb> queryPageStorage(CurrencyPage<Crkjlb> page);
			

	/**
	 * 编辑入库信息
	 * @param crkjlb
	 * @return
	 */
	public int editOutStorage(Crkjlb crkjlb ,User user);




	/**
	 * 查看详情
	 * @param crkid
	 * @return
	 */
	public OutWarehouseForm selectShowBycrk(String crkid);




	/**
	 * 删除
	 * @param id
	 * @return 
	 */
	public void deleteStorage(String id);




	/**
	 * 编辑
	 * @param crkid
	 * @return
	 */
	public Crkjlb selectByPkShow(String crkid);



}
