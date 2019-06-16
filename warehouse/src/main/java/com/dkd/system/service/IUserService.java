package com.dkd.system.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.User;
import com.dkd.system.service.IBaseService;

/**
 * 用户service
 * @author SY
 *
 */


public interface IUserService extends IBaseService<User> {
	public abstract void updateDepartmentRole(User user);
	public List<User> getUsers(List<String> jhs);
	public User userLogin(String username);
	public int insertUser(User user);
	public int updateUser(User user);
	public List<User> checkUser(User user);
	public User selectUserMenu(String user_id);
}
