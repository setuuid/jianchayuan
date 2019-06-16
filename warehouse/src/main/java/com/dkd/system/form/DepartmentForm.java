package com.dkd.system.form;

import java.io.Serializable;




public class DepartmentForm implements Serializable{
	private String department_id;// 部门ID
	
	private String department_code;// 部门编码
	
	private String department_name;// 部门名称
	
	private String parent_id;// 父节点ID
	private int department_order;// 排序
	
	private int isDel;// 标记删除
	private String pageNow;//当前页
	
	private String  pageSize;
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_code() {
		return department_code;
	}
	public void setDepartment_code(String department_code) {
		this.department_code = department_code;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public int getDepartment_order() {
		return department_order;
	}
	public void setDepartment_order(int department_order) {
		this.department_order = department_order;
	}
	public int getIsDel() {
		return isDel;
	}
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	public String getPageNow() {
		return pageNow;
	}
	public void setPageNow(String pageNow) {
		this.pageNow = pageNow;
	}
	@Override
	public String toString() {
		return "DepartmentForm [department_id=" + department_id
				+ ", department_code=" + department_code + ", department_name="
				+ department_name + ", parent_id=" + parent_id
				+ ", department_order=" + department_order + ", isDel=" + isDel
				+ ", pageNow=" + pageNow + "]";
	}
	
	
	
}
