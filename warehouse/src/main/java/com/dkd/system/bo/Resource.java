package com.dkd.system.bo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.dkd.utils.tree.Tree;

/**
 * 资源类
 * @author SY
 *
 */

public class Resource extends Tree implements Serializable{
	
	private String resource_id;//资源id
	private String resource_code;//资源编码
	private String resource_name;//对应的模块名称
	private String type;//资源类型 菜单 功能
	private String valuea;//请求资源
	private Resource resource;//父级资源
	private Integer seq;//排序
	private String resource_icon; // 图标
	//private Integer state; // 状态 0启用 1停用
	private String parent_id;
	private List<Resource> resources = new ArrayList<Resource>();
	private String status;//展开,关闭
	
	
	public String getResource_id() {
		return resource_id;
	}
	public void setResource_id(String resource_id) {
		this.resource_id = resource_id;
	}
	public String getResource_code() {
		return resource_code;
	}
	public void setResource_code(String resource_code) {
		this.resource_code = resource_code;
	}
	public String getResource_name() {
		return resource_name;
	}
	public void setResource_name(String resource_name) {
		this.resource_name = resource_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getValuea() {
		return valuea;
	}
	public void setValuea(String valuea) {
		this.valuea = valuea;
	}
	public Resource getResource() {
		return resource;
	}
	public void setResource(Resource resource) {
		this.resource = resource;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getResource_icon() {
		return resource_icon;
	}
	public void setResource_icon(String resource_icon) {
		this.resource_icon = resource_icon;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public List<Resource> getResources() {
		return resources;
	}
	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	
	
	
	
}
