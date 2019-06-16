package com.dkd.system.bo;

import java.io.Serializable;
import java.util.Set;

import com.dkd.system.bo.Department;
import com.dkd.system.bo.Resource;
import com.dkd.system.util.annotation.GetAttributeName;

/**
 * 角色权限
 * @author SY
 *
 */

public class Role implements Serializable{
	
	////@GetAttributeName(attributeName="角色id")
	private String role_id;//角色id
	////@GetAttributeName(attributeName="角色名称")
	private String role_name;//角色名称
	////@GetAttributeName(attributeName="是否删除")
	private int isDel;//标记删除
	private Set<Resource> resources;//资源集合 1vN
	//@GetAttributeName(attributeName="是否选中")
	private boolean checked;//是否被选中
	private Department department;//关联部门 1v1
	//@GetAttributeName(attributeName="角色类型")
	private String role_level;//0:终极管理员,1:子管理员,2:普通用户
	private String seq;//排序
	//@GetAttributeName(attributeName="备注")
	private String description;//备注
	
	private String resourceIds;//权限id
	private String resourceNames;//权限名称
	
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public int getIsDel() {
		return isDel;
	}
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	public Set<Resource> getResources() {
		return resources;
	}
	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getRole_level() {
		return role_level;
	}
	public void setRole_level(String role_level) {
		this.role_level = role_level;
	}
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getResourceIds() {
		return resourceIds;
	}
	public void setResourceIds(String resourceIds) {
		this.resourceIds = resourceIds;
	}
	public String getResourceNames() {
		return resourceNames;
	}
	public void setResourceNames(String resourceNames) {
		this.resourceNames = resourceNames;
	}
	
	
}
