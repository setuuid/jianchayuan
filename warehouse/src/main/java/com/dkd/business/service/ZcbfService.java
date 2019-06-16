package com.dkd.business.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.system.bo.User;
import com.dkd.system.service.IBaseService;
@Service
@Transactional
public interface ZcbfService extends IBaseService<Crkjlb> {

	int editZcbf(Crkjlb crkjlb, User user);

	Crkjlb editShow(String crkid);

	OutWarehouseForm selectShowBycrk(String crkid);

	int deletezcbf(String crkid);

	void deleteIsdel(String crkid);
	
}
