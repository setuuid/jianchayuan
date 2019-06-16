package com.dkd.business.service.impl;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.business.bo.Sbb;
import com.dkd.business.dao.CrkjlbDao;
import com.dkd.business.dao.SbbDao;
import com.dkd.business.dao.StorageDao;
import com.dkd.business.service.OutWarehouseService;
import com.dkd.business.service.ZcbfService;
import com.dkd.system.bo.User;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.service.impl.BaseServiceImpl;
import com.dkd.utils.uuid.UUIDGenerator;
@Service
@Transactional
public class ZcbfServiceImpl extends BaseServiceImpl<Crkjlb> implements ZcbfService {

	@javax.annotation.Resource
	private CrkjlbDao crkjlbDao;
	@javax.annotation.Resource
	private SbbDao sbbDao;
	@javax.annotation.Resource
	private OutWarehouseService outWarehouseService;
	@javax.annotation.Resource
	private StorageDao storageDao;
	public BaseDao<Crkjlb> getDao() {
		return crkjlbDao;
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, rollbackFor = Exception.class)
	public int editZcbf(Crkjlb crkjlb,User user) {
		int result = 0;
		//设备信息
		Sbb sbb = sbbDao.selectByPk(crkjlb.getSbid());
		if(StringUtils.isEmpty(crkjlb.getCrkid())){
			crkjlb.setCrkid(UUIDGenerator.getUUID());
			crkjlb.setCzr(user.getUsername());
			crkjlb.setCzsj(new Date());
    		result = getDao().insert(crkjlb);
    		if("7".equals(crkjlb.getZt())&&result>0){
    			String sbid = crkjlb.getSbid();
    			int newsl = (sbb.getSl())-(crkjlb.getLysl());
    			//更新数量操作
    			result = sbbDao.updateSbSl(sbid,newsl);
    			return result;
    		}
		}else{
			crkjlb.setCzr(user.getUsername());
			crkjlb.setCzsj(new Date());
			int initSl = (crkjlbDao.selectByPk(crkjlb.getCrkid()).getLysl())+(sbb.getSl());
			result = getDao().update(crkjlb);
			if("7".equals(crkjlb.getZt())&&result>0){
    			String sbid = crkjlb.getSbid();
    			int lysl = crkjlb.getLysl();//更新后的报废数量
    			int newsl=initSl-lysl;
    			result = sbbDao.updateSbSl(sbid,newsl);//更新数量操作
    			return result;
			}
		}
		return result;
	}
	@Override
	public Crkjlb editShow(String crkid) {
		// TODO Auto-generated method stub
		return crkjlbDao.selectByPk(crkid);
	}
	@Override
	public OutWarehouseForm selectShowBycrk(String crkid) {
		// TODO Auto-generated method stub
		return crkjlbDao.selectShowBycrk(crkid);
	}
	@Override
	public int deletezcbf(String crkid) {
		// TODO Auto-generated method stub
		Crkjlb selectByPk = crkjlbDao.selectByPk(crkid);
		int lysl = selectByPk.getLysl();//当前的报废数量
		String sbid = selectByPk.getSbid();
		Sbb selectByPk2 = sbbDao.selectByPk(sbid);
		int sl = selectByPk2.getSl();
		int oldsl=sl+lysl;
		return sbbDao.updatesl(sbid,oldsl);
	}
	@Override
	public void deleteIsdel(String crkid) {
		// TODO Auto-generated method stub
		storageDao.delete(crkid);
	}
}
