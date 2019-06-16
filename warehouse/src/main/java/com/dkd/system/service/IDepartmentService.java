package com.dkd.system.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.business.bo.EwmForm;
import com.dkd.system.bo.Department;
import com.dkd.system.service.IBaseService;
import com.dkd.utils.page.CurrencyPage;

/**
 * 部门Service接口
 * @author sy
 *
 */

@Service
@Transactional
public interface IDepartmentService extends IBaseService<Department> {
	
	
	public CurrencyPage<Department> treeGrids(CurrencyPage<Department> page);
	
	public abstract List<Department>selectByParentId(String department_id);
	
	/**
	 * 查询父级
	 * @param parent_id
	 * @return
	 */
	List<Department> selectChilds(String parent_id);
	
	public abstract Department selectByDeptname(String deptname);
	
	public abstract Department selectByID(String id);

	public abstract List<Department> allTree(boolean flag);

	public abstract List<Department> treeGit();
	
	/**
	 * 查询部门二维码信息
	 * @param bmids
	 * @return
	 */
	public List<EwmForm> selectEwmBm(List<String> bmids);
}
