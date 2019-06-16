package com.dkd.system.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dkd.system.bo.Role;

/**
 * 角色dao
 * @author SY
 *
 */

@Repository
public class RoleDao extends BaseDao<Role>{
	
	public Role selectFj(Role role){
		return sqlSession.selectOne("Role.selectFj",role);
	}
	
	public int countFj(Role role){
		return sqlSession.selectOne("Role.countFj",role);
	}
	public List<Role> selectByConditionA(Map<String, Object> map) {
		return sqlSession.selectList("Role.selectByConditionA", map);  
	}
	
	public Role selectRoleResource(String id) {
		return sqlSession.selectOne("Role.selectRoleResource",id);
	}
		
}
