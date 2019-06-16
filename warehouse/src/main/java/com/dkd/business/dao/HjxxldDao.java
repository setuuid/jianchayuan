package com.dkd.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dkd.business.bo.EwmForm;
import com.dkd.business.bo.Hjxxld;
import com.dkd.system.dao.BaseDao;


/**
 * 部门Dao
 * @author sy
 *
 */

@Repository
public class HjxxldDao extends BaseDao<Hjxxld>{

	public Hjxxld findById(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(this.getDefaultSqlNamespace() + "." + "findById",id);
	}
	
	/**
	 * 批量查询货架信息二维码
	 * @param hjxxid
	 * @return
	 */
	public List<EwmForm> selectEwmHj(List<String> hjxxid) {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectEwmHj", hjxxid);
	}
	
	
}
