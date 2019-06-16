package com.dkd.business.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;





import com.dkd.business.bo.EwmForm;
import com.dkd.business.bo.Sbb;
import com.dkd.system.dao.BaseDao;

/**
 * 设备Dao
 * @author SY
 *
 */

@Repository
public class SbbDao extends BaseDao<Sbb>{
	
	
	public List<Sbb> treeGrids(Map<String, Object> map) {
		
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectTreeGrid",map);
		//return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectByCondition",map);
	}
	
	public int editSbxx(Sbb sbb) {
		
		return sqlSession.update(this.getDefaultSqlNamespace() + "." + "editSbxx",sbb);
		//return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectByCondition",map);
	}	
	
	public List<Sbb> selectSbCombobox(Map<String, Object> map) {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "."+ "selectSbCombobox", map);
	}


	public String selectMaxNo(Map<String, Object> map){
		return sqlSession.selectOne(this.getDefaultSqlNamespace() + "."+ "selectMaxNo", map);
	}
	


	/**
	 * 入库后更新设备信息
	 * @param sbb
	 * @return
	 */
	public int updateSbb(Sbb sbb) {
		
	return sqlSession.update(this.getDefaultSqlNamespace() + "." + "updateOutWarehouse",sbb);
		
	}	

	/**
	 * 更新反填出库信息状态
	 */
	public int updateOutWarehouse(Sbb sbb) {  
        return sqlSession.update(this.getDefaultSqlNamespace() + "." + "updateOutWarehouse", sbb);  
    } 
	
	/**
	 * 设备二维码信息
	 * @return
	 */
	public List<EwmForm> selectEwmSb(List<String> sbids) {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectEwmSb", sbids);
	}

	/**
	 * 更新设备数量
	 * @param sbid
	 * @param lysl
	 * @return
	 */
	public int updateSbSl(String sbid, int newsl) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("sbid", sbid);
		map.put("newsl", newsl);
		return sqlSession.update(this.getDefaultSqlNamespace() + "." + "updateSbSl", map);
	}

	public int updatesl(String sbid, int oldsl) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("sbid", sbid);
		map.put("oldsl", oldsl);
		return sqlSession.update(this.getDefaultSqlNamespace() + "." + "updatesl", map);
	}
	
	public Sbb selectShow(String id){
		return sqlSession.selectOne(this.getDefaultSqlNamespace() + "."+ "selectShow", id);
	}

	/**
	 * 批量商传文件
	 * @param list
	 * @return
	 */
	public Object insertSave(List<Sbb> list) {
	
		return sqlSession.insert(this.getDefaultSqlNamespace() + "." + "insertSave", list);
	}


	

}
