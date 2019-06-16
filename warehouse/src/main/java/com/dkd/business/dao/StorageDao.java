package com.dkd.business.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dkd.business.bo.Crkjlb;
import com.dkd.business.bo.Hjxxld;
import com.dkd.business.bo.OutWarehouseForm;
import com.dkd.business.bo.Sbb;
import com.dkd.system.bo.Department;
import com.dkd.system.dao.BaseDao;
import com.dkd.utils.page.CurrencyPage;


/**
 * 入库Dao
 * @author sy
 *
 */

@Repository
public class StorageDao extends BaseDao<Crkjlb>{
	
	
	/**
	 * 查询已入库的库存信息
	 * @return
	 */
	public List<Crkjlb> selectCrkjlbAll(){
		
	return sqlSession.selectList("Crkjlb.selectAllExist");
	}
	
	/**
	 * 根据id查询设备信息
	 * @param id 
	 * @return
	 */
	public Sbb selectSbbId(String id){
		
		return sqlSession.selectOne("Sbb.selectSbbId",id);
	}
	
	/**
	 * @param id
	 * @return
	 */
	public Hjxxld selectHjID(String id){
		
		return sqlSession.selectOne("Hjxxld.selectHjId",id);
	}
	
	
	
	/**
	 * 入库分页条件查询
	 * @param map
	 * @return
	 */
	public  List<Crkjlb> selectByConditionStorat(Map<String, Object> map){
	
		return sqlSession.selectList("Crkjlb.selectByConditionStorat",map);

	}
	
	
	/**
	 * 逻辑删除入库表
	 * @param id
	 */
	public void logicDelete(String id){
	sqlSession.selectList("Crkjlb.logicDelete",id);
	}

	public OutWarehouseForm selectShowBycrk(String crkid) {
		return sqlSession.selectOne(this.getDefaultSqlNamespace() + "."+ "selectShowBycrk", crkid);
	}
	

	
	
	
	
	
	
}
