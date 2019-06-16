package com.dkd.business.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.dkd.business.bo.EwmForm;
import com.dkd.business.bo.Sbb;
import com.dkd.system.service.IBaseService;
import com.dkd.utils.page.CurrencyPage;


@Service
@Transactional
public interface SbbService extends IBaseService<Sbb> {
	
	public CurrencyPage<Sbb> treeGrids(CurrencyPage<Sbb> page);
	
	public void editSbxx(Sbb sbb);
	
	public List<Sbb> selectSbCombobox(Map<String,Object> map);
	
	/**
	 * 设备二维码信息
	 * @param sbid
	 * @return
	 */
	public List<EwmForm> selectEwmSb(List<String> sbid);
	
	public String selectMaxNo(String lx);
	
	/**
	 * 反填设备表
	 * @param sbb
	 * @return
	 */
	public int updateOutWarehouse(Sbb sbb);

	
	/**
	 * poi导入数据
	 * @param name
	 * @param file
	 * @return
	 */
	public boolean batchImport(String name, MultipartFile file);

	
	public Sbb selectShow(String id);

	public List<Sbb> exportfindsbb(String pm, Date beginDate, Date endDate,
			String yjfl, String ejfl, String sjfl,String cwply);
}
