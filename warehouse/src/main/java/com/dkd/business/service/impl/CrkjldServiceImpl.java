package com.dkd.business.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.Sbb;
import com.dkd.business.dao.CrkjlbDao;
import com.dkd.business.dao.SbbDao;
import com.dkd.business.service.CrkjlbService;
import com.dkd.business.service.SbbService;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.service.impl.BaseServiceImpl;


@Service
@Transactional
public class CrkjldServiceImpl extends BaseServiceImpl<Crkjlb> implements CrkjlbService {

	@javax.annotation.Resource
	private CrkjlbDao crkjlbDao;
	
	@Override
	public BaseDao<Crkjlb> getDao() {
		return crkjlbDao;
	}


}
