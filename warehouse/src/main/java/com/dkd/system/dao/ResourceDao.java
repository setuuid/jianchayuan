package com.dkd.system.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dkd.system.bo.Resource;

/**
 * 权限Dao
 * @author SY
 *
 */

@Repository
public class ResourceDao extends BaseDao<Resource>{
	
	public List<Resource> treeGrid(Map<String, Object> map) {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectTreeGrid",map);
	}
	
	public List<Resource> allTree(String type) {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "allTree",type);
	}
	
	public List<Resource> selectChilds(String parent_id) {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectChilds",parent_id);
	}
}
