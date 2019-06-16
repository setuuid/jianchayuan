package com.dkd.system.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.UserRole;
import com.dkd.system.service.IBaseService;

@Service
@Transactional
public interface IUserRoleService extends IBaseService<UserRole>{


	List<String> selectRoleByUserid(String user_id);


	


}
