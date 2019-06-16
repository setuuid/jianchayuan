package com.dkd.system.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.stereotype.Repository;

import com.dkd.system.bo.Department;
import com.dkd.system.bo.Dictionary;
import com.dkd.system.bo.Resource;

/**
 * 字典Dao
 * @author SY
 *
 */

@Repository
public class DictionaryDao extends BaseDao<Dictionary>{
	
	public List<Dictionary> selectByParentId(String dictionary_id){
		return sqlSession.selectList("Dictionary.selectByParentId", dictionary_id);
	}
	
	public Dictionary selectByCode(String dictionary_code){
		return sqlSession.selectOne("Dictionary.selectByCode", dictionary_code);
	}
	
	public Dictionary delectByCode(String dictionary_id){
		return sqlSession.selectOne("Dictionary.delectByCode", dictionary_id);
	}
	
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<Dictionary> treeGrid() {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectTreeGrid");
	}
	
	
	public List<Dictionary> selectChildsByPcode(String dictionary_code){
		return sqlSession.selectList("Dictionary.selectChildsByPcode", dictionary_code);
	}
	
	public List<Dictionary> selectChilds(String parent_id) {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectChilds",parent_id);
	}
	
	public List<Dictionary> selectChildsByPid(String dictionary_id){
		return sqlSession.selectList("Dictionary.selectChildsByPid", dictionary_id);
	}
	
	@Test
	public void selectByName() {
		System.err.println(sqlSession.selectOne("Dictionary.selectByName", "设备资产"));
	}
	
	public Dictionary selectByName(String dictionary_name) {
		
		return sqlSession.selectOne("Dictionary.selectByName", dictionary_name);
	}
	
}
