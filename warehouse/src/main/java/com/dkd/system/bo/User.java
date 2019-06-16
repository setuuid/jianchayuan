package com.dkd.system.bo;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;

import com.dkd.system.bo.Department;
import com.dkd.system.bo.Resource;
import com.dkd.system.bo.Role;
import com.dkd.system.bo.User;
import com.dkd.system.bo.UserInfo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 用户类
 * @author SY
 *
 */

@SuppressWarnings("deprecation")
public class User implements UserDetails{

	private static final long serialVersionUID = 1L;
	
	private String user_id;//用户id
	private String username;//用户名
	private String password;//密码
	private String realname;//真实姓名
	private String isUse;//是否使用
	private String department_id;
	private String isDel;//是否删除
	private String sex;//性别
	private String create_time;//创建时间
	private String userip;
	private String ism;//密码是否修改过
	private String phone;//联系方式
	private Department department;//关联部门 1v1
	private Set<Role> userRoles = new HashSet<Role>(); //用户角色集合 1vN
	private String[] rolesids;//多角色Id
	
	public String[] getRolesids() {
		return rolesids;
	}
	public void setRolesids(String[] rolesids) {
		this.rolesids = rolesids;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIsUse() {
		return isUse;
	}
	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Set<Role> getUserRoles() {
		return userRoles;
	}
	public void setUserRoles(Set<Role> userRoles) {
		this.userRoles = userRoles;
	}
	
	
	
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
    
	/**
	 * 获取用户下角色的全部资源
	 * @return
	 */
    
    @Override  
    public Collection<GrantedAuthority> getAuthorities() {  
    	Set<GrantedAuthority> autthorities = new HashSet<GrantedAuthority>();
		for (Role role : this.userRoles) {//循环用户的角色
             Set<Resource> resources = role.getResources();//当前角色的全部资源
             for(Resource resource : resources) {  //循环当前角色的全部资源
            	 autthorities.add(new GrantedAuthorityImpl(resource.getResource_code()));//该用户具有的资源编码
             }  
		}
		return autthorities;
    }  

    @Override  
    public boolean equals(Object rhs) {  
	    if (rhs instanceof User)
	    	return username.equals(((User) rhs).username);
	    return false;  
    }  
     
    @Override  
    public int hashCode() {  
    	return username.hashCode();  
    }
	public String getUserip() {
		return userip;
	}
	public void setUserip(String userip) {
		this.userip = userip;
	}
	public String getIsm() {
		return ism;
	}
	public void setIsm(String ism) {
		this.ism = ism;
	}
	
}
