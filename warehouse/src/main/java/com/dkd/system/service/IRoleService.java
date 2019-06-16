package com.dkd.system.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.Role;
import com.dkd.system.form.RoleForm;
import com.dkd.utils.tree.Tree;


/**
 * 角色service
 * @author sy
 *
 */

@Service
@Transactional
public interface IRoleService extends IBaseService<Role> {
	
	public abstract void editRole(RoleForm roleForm);
	
	public abstract Role selectFj(Role role);
	
	public abstract int countFj(Role role);
	
    public abstract Map<String, Object> selectByConditionA(Object object);
    
    public abstract Role selectRoleResource(String id);
    
    public abstract int saveRoleResource(Role role);
    
    public abstract int deleteRoleResource(String role_id);
    
    public abstract List<Tree> selectAllRole();
}
