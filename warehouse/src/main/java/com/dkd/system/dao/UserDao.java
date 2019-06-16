package com.dkd.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dkd.system.bo.Role;
import com.dkd.system.bo.User;

/**
 * 用户dao
 * @author SY
 *
 */

@Repository
public class UserDao extends BaseDao<User>{
	
	/**
	 * 登录
	 * @param username
	 * @return
	 */
	
	public User userLogin(String username) {
		return sqlSession.selectOne("User.userLogin", username);
	}
	
	public User userLoginByUkey(String ukey) {
		return sqlSession.selectOne("User.userLoginByUkey", ukey);
	}
	
	public void updateDepartmentRole(User user){
		 sqlSession.update("User.updateDepartmentRole",user);
	}

	public List<User> getUsers(List<String> jhs) {
		// TODO Auto-generated method stub
		 return sqlSession.selectList("User.getUsersByJhs",jhs);
	}
	
	public List<User> checkUser(User user) {
		 return sqlSession.selectList("User.checkUser",user);
	}
	
	public User selectUserMenu(String user_id) {
		return sqlSession.selectOne("User.selectUserMenu", user_id);
	}
}
