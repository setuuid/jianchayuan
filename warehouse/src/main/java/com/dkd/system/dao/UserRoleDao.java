package com.dkd.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dkd.system.bo.RoleResource;
import com.dkd.system.bo.UserRole;

@Repository
public class UserRoleDao extends BaseDao<UserRole> {

	public int insertBatch(List<UserRole> list) {
		return sqlSession.insert("UserRole.insertBatch", list);
	} 
	
	public List<String> selectRoleByUserid(String user_id) {
		return sqlSession.selectList("UserRole.selectRoleByUserid", user_id);
	}
}
