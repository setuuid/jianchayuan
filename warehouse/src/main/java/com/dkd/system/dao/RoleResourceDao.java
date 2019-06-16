package com.dkd.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dkd.system.bo.RoleResource;

/**
 * 角色资源Dao
 * @author SY
 *
 */

@Repository
public class RoleResourceDao extends BaseDao<RoleResource>{

	public int insertBatch(List<RoleResource> list) {
		return sqlSession.insert("RoleResource.insertBatch", list);
	}
}
