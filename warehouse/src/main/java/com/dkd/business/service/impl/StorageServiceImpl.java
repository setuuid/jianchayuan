package com.dkd.business.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.business.bo.Sbb;
import com.dkd.business.dao.SbbDao;
import com.dkd.business.dao.StorageDao;
import com.dkd.business.service.StorageService;
import com.dkd.system.bo.User;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.service.impl.BaseServiceImpl;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.uuid.UUIDGenerator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Transactional
public class StorageServiceImpl extends BaseServiceImpl<Crkjlb> implements StorageService {

	@javax.annotation.Resource
	private StorageDao storageDao;
	
	@javax.annotation.Resource
	private SbbDao sbbDao;
	
	@Override
	public BaseDao<Crkjlb> getDao() {
		return storageDao;
	}
	
	@Override
	public void logicDelete(String id) {
		
		storageDao.logicDelete(id);
	}
	
	
	//编辑入库信息
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, rollbackFor = Exception.class)
	public int editOutStorage(Crkjlb crkjlb,User user) {
			int result = 0;
			
			/*if(crkjlb.getLysl()<0){
    			crkjlb.setLysl(0);
    		}*/
			if(StringUtils.isEmpty(crkjlb.getCrkid())){
    			crkjlb.setCrkid(UUIDGenerator.getUUID());
    			crkjlb.setCzr(user.getUsername());
    			crkjlb.setCzsj(new Date());
	    		result = getDao().insert(crkjlb);
	    		
	    		if("7".equals(crkjlb.getZt())&&result>0){
	    			String sbid = crkjlb.getSbid();
	    			int lysl = crkjlb.getLysl();
	    			//更新数量操作
	    			 int updateSbSl = sbbDao.updateSbSl(sbid,lysl);
	    			 return updateSbSl;
	    		}
	    		Sbb sbb = sbbDao.selectByPk(crkjlb.getSbid());
	    		if(result > 0) {
	    			//设备信息
					//当前状态为入库
					sbb.setDqzt(crkjlb.getZt());
					//货架id
					sbb.setHjid(crkjlb.getHjxxid());
					if(crkjlb.getZt().equals("3")|| sbb.getWply().equals("2")) {
						//sbb.setDw(crkjlb.getLydw());
						sbb.setWplydw(crkjlb.getLydw());
						//调入
						//归还
						sbb.setSl(crkjlb.getLysl()+sbb.getSl());
					} else {
						//当前数量
						sbb.setSl(crkjlb.getLysl()+sbb.getSl());
					}
					sbbDao.updateOutWarehouse(sbb);
	    		}
	    		
			}else{//更新
				crkjlb.setCzr(user.getUsername());
				crkjlb.setCzsj(new Date());
				Crkjlb oldcrkjlb = getDao().selectByPk(crkjlb.getCrkid());
				Sbb sbb = sbbDao.selectByPk(crkjlb.getSbid());
				
				//if(sbb.getDqzt().equals("1")){
				//出库完成,更新设备信息
				result = getDao().update(crkjlb);
				if(result > 0) {
					//设备信息
					//当前状态为入库
					sbb.setDqzt(crkjlb.getZt());
					//货架id
					sbb.setHjid(crkjlb.getHjxxid());
					//单位
					//sbb.setDw();
					//设备归还
					if(crkjlb.getZt().equals("3")|| sbb.getWply().equals("2")){
						//sbb.setDw(crkjlb.getLydw());
						sbb.setWplydw(crkjlb.getLydw());
						//调入
						//归还
					}
					sbb.setSl((sbb.getSl()-oldcrkjlb.getLysl()) + crkjlb.getLysl());
					//执行跟新
					sbbDao.updateOutWarehouse(sbb);
				}
			}
			return result;
	
	}
	
	
	//入库分页查询
	@Override
	public CurrencyPage<Crkjlb> queryPageStorage(CurrencyPage<Crkjlb> page) {
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		//Map<String, Object> queryTerms = page.getQueryTerms();
		List<Crkjlb> list = storageDao.selectByConditionStorat(page.getQueryTerms());
		PageInfo<Crkjlb> pageInfo = new PageInfo<Crkjlb>(list);
		page.setPageInfo(pageInfo);
		return page;
		
	}


	
	//查看详情
	@Override
	public OutWarehouseForm selectShowBycrk(String crkid) {
		return storageDao.selectShowBycrk(crkid);
	}
	
	
	//删除入库数据
	@Override
	public void deleteStorage(String id) {
		//先查询
		Crkjlb crkjlb = storageDao.selectByPk(id);
		//更改
		Sbb sbb = sbbDao.selectByPk(crkjlb.getSbid());
		//如果是入库
		if("1".equals(sbb.getDqzt()) ){
			//入库类型
			sbb.setDqzt("");
			//货架
			sbb.setHjid("");
			sbb.setSl(sbb.getSl()-crkjlb.getLysl());
		}else{
			sbb.setSl(sbb.getSl()-crkjlb.getLysl());
		}
			//数量
			/*if(crkjlb.getLysl()>sbb.getSl() && crkjlb.getLysl()-sbb.getSl()>0){
				if(crkjlb.getLysl()-sbb.getSl()>0){
					sbb.setSl(crkjlb.getLysl()-sbb.getSl());
				}
			}else if(crkjlb.getLysl()-sbb.getSl()<0){
				
					sbb.setSl(sbb.getSl()-crkjlb.getLysl());
				}else{
					sbb.setSl(0);
				}*/
			
		sbbDao.update(sbb);
		//删除
		storageDao.delete(id);
		
		
	}

	@Override
	public Crkjlb selectByPkShow(String crkid) {
		//先查询
		Crkjlb crkjlb = storageDao.selectByPk(crkid);
		
		Sbb sbb = sbbDao.selectByPk(crkjlb.getSbid());
		if(crkjlb.getLysl()>0){
			sbb.setSl(crkjlb.getLysl());
		}
		
		
		
		return null;
	}



}
