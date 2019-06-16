package com.dkd.business.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.dkd.business.bo.EwmForm;
import com.dkd.business.bo.Sbb;
import com.dkd.business.dao.SbbDao;
import com.dkd.business.form.ReadExcel;
import com.dkd.business.service.SbbService;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.service.impl.BaseServiceImpl;
import com.dkd.utils.page.CurrencyPage;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Transactional
public class SbbServiceImpl extends BaseServiceImpl<Sbb> implements SbbService {

	@javax.annotation.Resource
	private SbbDao sbbDao;
	
	@Override
	public BaseDao<Sbb> getDao() {
		return sbbDao;
	}
	
	
	@Override
	public CurrencyPage<Sbb> treeGrids(CurrencyPage<Sbb> page) {
		try {
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			List<Sbb> list = sbbDao.treeGrids(page.getQueryTerms());
			PageInfo<Sbb> pageInfo = new PageInfo<Sbb>(list);
			page.setPageInfo(pageInfo);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public void editSbxx(Sbb sbb){
		try {
			sbbDao.editSbxx(sbb);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public String selectMaxNo(String lx){
		String MaxNo="";
		String no="";
		Map<String,Object> map = new HashMap<String, Object>();
		if(lx.equals("1")){
			map.put("lx", "%sb%");
			MaxNo=sbbDao.selectMaxNo(map);
			if(MaxNo==null){
				MaxNo="sb0001";
			}else{
				no=MaxNo.substring(2, 6);
				int i=Integer.parseInt(no);
				MaxNo="sb"+ String.format("%04d", i+1);
			}
		}else{
			map.put("lx", "%hc%");
			MaxNo=sbbDao.selectMaxNo(map);
			if(MaxNo==null){
				MaxNo="hc0001";
			}else{
				no=MaxNo.substring(2, 6);
				int i=Integer.parseInt(no);
				MaxNo="hc"+ String.format("%04d", i+1);
			}
		}
		return MaxNo;
	}


	@Override
	public List<Sbb> selectSbCombobox(Map<String, Object> map) {
		return sbbDao.selectSbCombobox(map);
	}


	@Override
	public List<EwmForm> selectEwmSb(List<String> sbids) {
		return sbbDao.selectEwmSb(sbids);
	}


	@Override
	public int updateOutWarehouse(Sbb sbb) {
		return sbbDao.updateOutWarehouse(sbb);
	}

	
	@Override
	public Sbb selectShow(String id){
		return sbbDao.selectShow(id);
	}


	@Override
	public boolean batchImport(String name, MultipartFile file) {
		 boolean b = false;
	        //创建处理EXCEL
	        ReadExcel readExcel=new ReadExcel();
		 	
	        //解析excel，获取客户信息集合。
	        List<Sbb> customerList = readExcel.getExcelInfo(name ,file);

	        if(customerList != null){
	            b = true;
	        }
	        //迭代添加客户信息（注：实际上这里也可以直接将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
	        for(Sbb customer:customerList){
	        	sbbDao.insert(customer);  //customerDoImpl.addCustomers(customer);
	        }
	        return b;
	}
	
	/**
	 * 导出条件查询
	 */
	@Override
	public List<Sbb> exportfindsbb(String pm, Date beginDate, Date endDate,
			String yjfl, String ejfl, String sjfl,String cwply) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pm", pm);
		map.put("beginDate", beginDate);
		map.put("endDate", endDate);
		map.put("yjfl",yjfl);
		map.put("ejfl", ejfl);
		map.put("sjfl", sjfl);
		map.put("wply", cwply);
		return sbbDao.treeGrids(map);
	}
}
