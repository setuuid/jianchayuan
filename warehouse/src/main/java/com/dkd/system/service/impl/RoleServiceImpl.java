package com.dkd.system.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.Department;
import com.dkd.system.bo.Role;
import com.dkd.system.bo.RoleResource;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.dao.RoleDao;
import com.dkd.system.dao.RoleResourceDao;
import com.dkd.system.form.RoleForm;
import com.dkd.system.service.IDepartmentService;
import com.dkd.system.service.IRoleService;
import com.dkd.utils.tree.Tree;
import com.dkd.utils.uuid.UUIDGenerator;

/**
 * 角色service
 * @author sy
 *
 */

@Service
@Transactional
public class RoleServiceImpl extends BaseServiceImpl<Role>implements IRoleService {
	
	@javax.annotation.Resource
	private RoleDao roleDao;
	
	@javax.annotation.Resource
    private IDepartmentService departmentServiceImpl;
	
	@javax.annotation.Resource
	private RoleResourceDao roleResourceDao;

	@Override
	public BaseDao<Role> getDao() {
		return roleDao;
	}
	
	@Override
	public void editRole(RoleForm roleForm) {
		Role role=new Role();
		Department department = departmentServiceImpl.selectByPk(roleForm.getDepartment_id());
		BeanUtils.copyProperties(roleForm,role);
		role.setDepartment(department);
		if(StringUtils.isNotEmpty(roleForm.getRole_id())){	
			roleDao.update(role);
		}else{
			role.setRole_id(UUIDGenerator.getUUID());
			roleDao.insert(role);
		}
	}
	
	@Override
	public Role selectFj(Role role){
		return roleDao.selectFj(role);
	}
	
	@Override
	public int countFj(Role role){
		return roleDao.countFj(role);
	}

	@Override
	public Map<String, Object> selectByConditionA(Object object) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put(object.getClass().getSimpleName(), object);
			
			List<Role> list = roleDao.selectByConditionA(map);
			map.put("list", list);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.toString());
			return null;
		} 
	}

	@Override
	public Role selectRoleResource(String id) {
		Role role = roleDao.selectRoleResource(id);
		return role;
	}

	@Override
	public int saveRoleResource(Role role) {
		List<RoleResource> list = new ArrayList<RoleResource>();
		if(!StringUtils.isEmpty(role.getResourceIds())) {
			String ids = role.getResourceIds();
			String[] strs = ids.split(",");
			for(String str : strs) {
				RoleResource rr = new RoleResource();
				rr.setResource_id(str);
				rr.setRole_id(role.getRole_id());
				list.add(rr);
			}
			roleResourceDao.delete(role.getRole_id());
			roleResourceDao.insertBatch(list);
		} else {
			roleResourceDao.delete(role.getRole_id());
		}
		return 0;
	}

	@Override
	public int deleteRoleResource(String role_id) {
		return 0;
	}

	@Override
	public List<Tree> selectAllRole() {
		List<Role> list = roleDao.selectAll();
		List<Tree> tl = new ArrayList<Tree>();
		for(Role role : list) {
			Tree tree = new Tree();
			if(null != role.getRole_id()) {
				tree.setId(role.getRole_id());
			}
			if(null != role.getRole_name()) {
				tree.setText(role.getRole_name());
			}
			tl.add(tree);
			
		}
		return tl;
	}

}
