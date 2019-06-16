package com.dkd.system.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.User;
import com.dkd.system.bo.UserInfo;
import com.dkd.system.form.UserInfoForm;

/**
 * 用户信息service
 * @author SY
 *
 */

@Service
@Transactional
public interface IUserInfoService extends IBaseService<UserInfo> {
	
	public abstract void editUser(UserInfoForm userInfoForm,User currentUser);

	public abstract void deleteUser(String primaryID,User currentUser,String user_id);
	
}
