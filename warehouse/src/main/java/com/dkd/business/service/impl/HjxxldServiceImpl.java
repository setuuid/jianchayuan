package com.dkd.business.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.business.bo.EwmForm;
import com.dkd.business.bo.Hjxxld;
import com.dkd.business.dao.HjxxldDao;
import com.dkd.business.service.HjxxldService;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.service.impl.BaseServiceImpl;


@Service
@Transactional
public class HjxxldServiceImpl extends BaseServiceImpl<Hjxxld> implements HjxxldService {

	@javax.annotation.Resource
	private HjxxldDao hjxxldDao;
	
	@Override
	public BaseDao<Hjxxld> getDao() {
		return hjxxldDao;
	}

	@Override
	public Hjxxld findById(String id) {
		// TODO Auto-generated method stub
		return hjxxldDao.findById(id);
	}

	@Override
	public List<EwmForm> selectEwmHj(List<String> hjxxid) {
		return hjxxldDao.selectEwmHj(hjxxid);
	}


}
