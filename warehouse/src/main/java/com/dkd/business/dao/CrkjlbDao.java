package com.dkd.business.dao;


import org.springframework.stereotype.Repository;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.system.dao.BaseDao;


/**
 * 部门Dao
 * @author sy
 *
 */

@Repository
public class CrkjlbDao extends BaseDao<Crkjlb>{
	
	public OutWarehouseForm selectShowBycrk(String id) {
		return sqlSession.selectOne(this.getDefaultSqlNamespace() + "."+ "selectShowBycrk", id);
	}

	public void updatesl(String crkid, int lysl) {
		// TODO Auto-generated method stub
		
	}

	
}
