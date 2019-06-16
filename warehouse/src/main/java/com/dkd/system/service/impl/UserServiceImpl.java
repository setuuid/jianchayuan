package com.dkd.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.User;
import com.dkd.system.bo.UserRole;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.dao.UserDao;
import com.dkd.system.dao.UserRoleDao;
import com.dkd.system.service.IUserService;
import com.dkd.utils.uuid.UUIDGenerator;

/**
 * 用户service
 * @author SY
 *
 */

@Service
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User>implements IUserService {

	@Resource
	private UserDao userDao;
	
	@Resource
	private UserRoleDao userRoleDao;
	
	@Override
	public BaseDao<User> getDao() {
		return userDao;
	}

	@Override
	public void updateDepartmentRole(User user) {
		userDao.updateDepartmentRole(user);
		
	}

	@Override
	public List<User> getUsers(List<String> jhs) {
		// TODO Auto-generated method stub
		return userDao.getUsers(jhs);
	}

	@Override
	public User userLogin(String username) {
		// TODO Auto-generated method stub
		return userDao.userLogin(username);
	}

	/**
	 * 添加用户
	 */
	@Override
	public int insertUser(User user) {
		//保存用户信息
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		user.setUser_id(UUIDGenerator.getUUID());
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		user.setPassword(md5.encodePassword("1111",null));
		user.setCreate_time(sdf.format(new Date()));
		//保存用户角色表
		List<UserRole> list = new ArrayList<UserRole>();
		String[] rolesid = user.getRolesids();
		if(null != rolesid && rolesid.length > 0) {
			for(String str : rolesid) {
				UserRole userRole = new UserRole();
				userRole.setUser_id(user.getUser_id());
				userRole.setRole_id(str);
				list.add(userRole);
			}
		}
		if(null != list && list.size() > 0) {
			userRoleDao.insertBatch(list);
		}
		return userDao.insert(user);
	}

	@Override
	public int updateUser(User user) {
		userDao.update(user);
		//编辑用户角色
		List<UserRole> list = new ArrayList<UserRole>();
		String[] rolesid = user.getRolesids();
		if (null != rolesid && rolesid.length > 0) {
			for (String str : rolesid) {
				UserRole userRole = new UserRole();
				userRole.setUser_id(user.getUser_id());
				userRole.setRole_id(str);
				list.add(userRole);
			}
		}
		userRoleDao.delete(user.getUser_id());
		if(null != list && list.size() > 0) {
			userRoleDao.insertBatch(list);
		}
		return 0;
	}
	
	public List<User> checkUser(User user) {
		return userDao.checkUser(user);
	}

	@Override
	public User selectUserMenu(String user_id) {
		return userDao.selectUserMenu(user_id);
	}
}
