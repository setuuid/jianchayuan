package com.dkd.system.bo;

import java.io.Serializable;

import javax.tools.JavaCompiler;

import com.dkd.system.bo.User;

/**
 * 用户信息类
 * @author 陈金铭
 */

public class UserInfo  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userinfo_id ;//用户信息类
	private String realname;//真实姓名
	private String sex;//性别
	private String create_time;//创建时间
	private String last_login_time;//最后登录时间
	private String last_login_ip;//最后登录IP
	private User user;//关联用户 1v1
	
	public String getUserinfo_id() {
		return userinfo_id;
	}
	public void setUserinfo_id(String userinfo_id) {
		this.userinfo_id = userinfo_id;
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
	public String getLast_login_time() {
		return last_login_time;
	}
	public void setLast_login_time(String last_login_time) {
		this.last_login_time = last_login_time;
	}
	public String getLast_login_ip() {
		return last_login_ip;
	}
	public void setLast_login_ip(String last_login_ip) {
		this.last_login_ip = last_login_ip;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
