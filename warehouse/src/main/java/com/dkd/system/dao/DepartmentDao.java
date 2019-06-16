package com.dkd.system.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dkd.business.bo.EwmForm;
import com.dkd.system.bo.Department;


/**
 * 部门Dao
 * @author sy
 *
 */

@Repository
public class DepartmentDao extends BaseDao<Department>{
	
	/**
	 * 查询父级
	 * @param parent_id
	 * @return
	 */
	public List<Department> selectChilds(String parent_id) {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectChilds",parent_id);
	}
	
	
	/**
	 * @param map
	 * @return
	 */
	public List<Department> treeGrids(Map<String, Object> map) {
		
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectTreeGrid",map);
		//return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectByCondition",map);
	}
	
	
	public List<Department>selectByParentId(String department_id){
		return sqlSession.selectList("Department.selectByParentId",department_id);
	}
	
	public Department selectByCode(String department_code){
		return sqlSession.selectOne("Department.selectByCode",department_code);
	}
	
	public Department selectByID(String department_id){
		return sqlSession.selectOne("Department.selectByID",department_id);
	}


	public Department selectByDeptname(String deptname) {
		return sqlSession.selectOne("Department.selectByDeptname",deptname);
	}

	/**
	 * @return
	 */
	public List<Department> treeGrid() {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectTreeGrid");
	}
	
	/**
	 * @return
	 */
	public List<Department> allTree() {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "allTree");
	}
	
	/**
	 * 查询部门二维码信息
	 * @param bmids
	 * @return
	 */
	public List<EwmForm> selectEwmBm(List<String> bmids) {
		return sqlSession.selectList(this.getDefaultSqlNamespace() + "." + "selectEwmBm", bmids);
	}
}
