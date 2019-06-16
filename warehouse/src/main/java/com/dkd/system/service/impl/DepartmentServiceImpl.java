package com.dkd.system.service.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.business.bo.EwmForm;
import com.dkd.system.bo.Department;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.dao.DepartmentDao;
import com.dkd.system.service.IDepartmentService;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.page.PageUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 部门Service接口实现
 * @author CJM
 *
 */

@Service
@Transactional
public class DepartmentServiceImpl extends BaseServiceImpl<Department> implements IDepartmentService{

	@Resource
	private DepartmentDao departmentDao;
	
	@Override
	public BaseDao<Department> getDao() {
		return departmentDao;
	}
	
	
	@Override
	public List<Department>selectByParentId(String department_id){
		if("0".equals(department_id)){
			department_id="120000000000";
		}
		return departmentDao.selectByParentId(department_id);
	}

	

	@Override
	public Department selectByDeptname(String deptname) {
		// TODO Auto-generated method stub
		return departmentDao.selectByDeptname(deptname);
	}

	@Override
	public List<Department> treeGit() {
		
		List<Department> list = departmentDao.selectAll();
		for (Department department : list) {
			
			if(null != department.getParent_id()) {
				department.setPid(department.getParent_id());
			}
			department.setId(department.getDepartment_id());
			department.setName(department.getDepartment_name());
			department.setText(department.getDepartment_name());
		}
		return list;
	}

	/*	*//**
		 * 查询所有资源
		 */
		@Override
		public List<Department> allTree(boolean flag) {
			
			List<Department> list = new ArrayList<Department>();
			//是否只显示菜单
			/*if(flag) {
				list = departmentDao.allTree();
			} else {
				list = departmentDao.treeGrid();
			}*/
			list = departmentDao.selectAll();
			for(Department department : list) {
				if(null != department.getDepartment_id()) {
					department.setId(department.getDepartment_id());
				}
				if(null != department.getDepartment_name()) {
					department.setText(department.getDepartment_name());
				}
				if(null != department.getParent_id()) {
					department.setPid(department.getParent_id());
				}
			}
			return list;
		}


		/**
		 * 分页查询所有资源
		 */
		@Override
		public CurrencyPage<Department> treeGrids(CurrencyPage<Department> page) {
			try {
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				List<Department> list = departmentDao.treeGrids(page.getQueryTerms());
				for (Department department : list) {
					if(null != department.getParent_id()) {
						department.setPid(department.getParent_id());
					}
					department.setId(department.getDepartment_id());
					department.setName(department.getDepartment_name());
					department.setState(department.getState());
				}
				PageInfo<Department> pageInfo = new PageInfo<Department>(list);
				page.setPageInfo(pageInfo);
				return page;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}

		/**
		 * 查询父级
		 */
		@Override
		public List<Department> selectChilds(String parent_id) {
			List<Department> list = departmentDao.selectChilds(parent_id);
			for (Department department : list) {
				if(null != department.getParent_id()) {
					department.setPid(department.getParent_id());
				}
				department.setId(department.getDepartment_id());
				department.setName(department.getDepartment_name());
			}
			return list;
		}


		@Override
		public Department selectByID(String id) {
			
			return departmentDao.selectByID(id) ;
		}


		@Override
		public List<EwmForm> selectEwmBm(List<String> bmids) {
			return departmentDao.selectEwmBm(bmids);
		}


		

		
	}
