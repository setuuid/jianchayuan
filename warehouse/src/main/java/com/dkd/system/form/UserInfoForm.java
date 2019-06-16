package com.dkd.system.form;

import com.dkd.system.bo.User;


/**
 * 用户信息form
 * @author SY
 *
 */

public class UserInfoForm implements java.io.Serializable {
	
	private String userinfo_id ;//用户信息id
	private String user_id;//用户id
	private String realname;//真实姓名
	private String sex;//性别
	private String create_time;//创建时间
	private String last_login_time;//最后登录时间
	private String last_login_ip;//最后登录IP
	private String username;//用户名
	private String isUse;//使用状态
	private String department_code;//部门编码
	private String pageNow;//当前页
	private User user;//关联用户 1v1
	private String newPassWord;//新密码
	private String password;
	private String department_id;
	private String department_name;
	private String userip;
	private String zpid;
	private String ukey;
	private String zwmc;
	private String isld;
	private String isxz;
	private String isrzqx;
	private String isyjld;
	private String isdcsxld;
	private String pageSize;
	public String getUserinfo_id() {
		return userinfo_id;
	}
	public void setUserinfo_id(String userinfo_id) {
		this.userinfo_id = userinfo_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getIsUse() {
		return isUse;
	}
	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}
	public String getDepartment_code() {
		return department_code;
	}
	public void setDepartment_code(String department_code) {
		this.department_code = department_code;
	}
	public String getPageNow() {
		return pageNow;
	}
	public void setPageNow(String pageNow) {
		this.pageNow = pageNow;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getNewPassWord() {
		return newPassWord;
	}
	public void setNewPassWord(String newPassWord) {
		this.newPassWord = newPassWord;
	}
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserip() {
		return userip;
	}
	public void setUserip(String userip) {
		this.userip = userip;
	}
	
	public String getUkey() {
		return ukey;
	}
	public void setUkey(String ukey) {
		this.ukey = ukey;
	}
	public String getZpid() {
		return zpid;
	}
	public void setZpid(String zpid) {
		this.zpid = zpid;
	}
	public String getZwmc() {
		return zwmc;
	}
	public void setZwmc(String zwmc) {
		this.zwmc = zwmc;
	}
	public String getIsld() {
		return isld;
	}
	public void setIsld(String isld) {
		this.isld = isld;
	}
	public String getIsxz() {
		return isxz;
	}
	public void setIsxz(String isxz) {
		this.isxz = isxz;
	}
	public String getIsrzqx() {
		return isrzqx;
	}
	public void setIsrzqx(String isrzqx) {
		this.isrzqx = isrzqx;
	}
	public String getIsyjld() {
		return isyjld;
	}
	public void setIsyjld(String isyjld) {
		this.isyjld = isyjld;
	}
	public String getIsdcsxld() {
		return isdcsxld;
	}
	public void setIsdcsxld(String isdcsxld) {
		this.isdcsxld = isdcsxld;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	
}
