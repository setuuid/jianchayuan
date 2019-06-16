package com.dkd.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.UserRole;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.dao.UserRoleDao;
import com.dkd.system.service.IUserRoleService;

@Service
@Transactional
public class UserRoleServiceImpl extends BaseServiceImpl<UserRole> implements IUserRoleService {

	@Resource
	private UserRoleDao userRoleDao;
	
	@Override
	public BaseDao<UserRole> getDao() {
		// TODO Auto-generated method stub
		return userRoleDao;
	}

	@Override
	public List<String> selectRoleByUserid(String user_id) {
		return userRoleDao.selectRoleByUserid(user_id);
	}
	

}
