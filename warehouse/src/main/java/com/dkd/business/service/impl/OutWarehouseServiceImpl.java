package com.dkd.business.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.business.bo.Sbb;
import com.dkd.business.dao.CrkjlbDao;
import com.dkd.business.dao.SbbDao;
import com.dkd.business.service.OutWarehouseService;
import com.dkd.system.bo.User;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.service.impl.BaseServiceImpl;
import com.dkd.utils.bean.BeanUtils;
import com.dkd.utils.uuid.UUIDGenerator;

@Service
@Transactional
public class OutWarehouseServiceImpl extends BaseServiceImpl<Crkjlb> implements OutWarehouseService {

	@Resource
	private CrkjlbDao crkjlbDao;
	@Resource
	private SbbDao sbbDao;
	
	
	@Override
	public BaseDao<Crkjlb> getDao() {
		return crkjlbDao;
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, rollbackFor = Exception.class)
	public int editOutWarehouse(Crkjlb crkjlb,User user) {
		int result = 0;
		//设备信息
		Sbb sbb = sbbDao.selectByPk(crkjlb.getSbid());
		if(StringUtils.isEmpty(crkjlb.getCrkid())){
			crkjlb.setCrkid(UUIDGenerator.getUUID());
			crkjlb.setCzr(user.getUsername());
			crkjlb.setCzsj(new Date());
    		result = getDao().insert(crkjlb);
    		if(result > 0) {
    			//判断是否为设备领用(状态出库,类型为设备)
    			if("2".equals(crkjlb.getZt()) && "1".equals(crkjlb.getLx())) {
    				sbb.setIsly("Y");
    			}
    			sbb.setSl(sbb.getSl() - crkjlb.getLysl());
    			sbbDao.updateOutWarehouse(sbb);
    		}
		}else{
			//编辑时计算领用数量
			Crkjlb oldCrkjl = crkjlbDao.selectByPk(crkjlb.getCrkid());
			crkjlb.setCzr(user.getUsername());
			crkjlb.setCzsj(new Date());
			result = getDao().update(crkjlb);
			if(result > 0) {
				//判断是否为设备领用(状态出库,类型为设备)
    			if("2".equals(crkjlb.getZt()) && "1".equals(crkjlb.getLx())) {
    				sbb.setIsly("Y");
    			}
				sbb.setSl((oldCrkjl.getLysl() + sbb.getSl()) - crkjlb.getLysl());
				sbbDao.updateOutWarehouse(sbb);
			}
		}
		return result;
	}


	@Override
	public OutWarehouseForm selectShowBycrk(String id) {
		return crkjlbDao.selectShowBycrk(id);
	}


	

}
