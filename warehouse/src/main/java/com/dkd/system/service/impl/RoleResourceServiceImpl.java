package com.dkd.system.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.RoleResource;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.dao.RoleResourceDao;
import com.dkd.system.service.IRoleResourceService;

/**
 * 角色资源service
 * @author sy
 *
 */

@Service
@Transactional
public class RoleResourceServiceImpl extends BaseServiceImpl<RoleResource> implements IRoleResourceService {
	
	@Resource
	private RoleResourceDao roleResourceDao;

	@Override
	public BaseDao<RoleResource> getDao() {
		return roleResourceDao;
	}
	
}
