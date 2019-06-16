package com.dkd.system.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.RoleResource;
import com.dkd.system.service.IBaseService;

/**
 * 角色资源service
 * @author sy
 *
 */

@Service
@Transactional
public interface IRoleResourceService extends IBaseService<RoleResource> {

}
