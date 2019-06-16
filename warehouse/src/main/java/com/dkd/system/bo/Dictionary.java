package com.dkd.system.bo;

import com.dkd.utils.tree.Tree;

/**
 * 字典类
 * @author sy
 * 
 */

public class Dictionary extends Tree {

	private String dictionary_id;// 字典ID
	private String dictionary_code;// 字典编码
	private String dictionary_name;// 字典名称
	private String parent_id;// 父节点ID
	private int dictionary_order;// 排序
	private int isDel;// 标记删除
	
	public String getDictionary_id() {
		return dictionary_id;
	}
	public void setDictionary_id(String dictionary_id) {
		this.dictionary_id = dictionary_id;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getDictionary_code() {
		return dictionary_code;
	}
	public void setDictionary_code(String dictionary_code) {
		this.dictionary_code = dictionary_code;
	}
	public String getDictionary_name() {
		return dictionary_name;
	}
	public void setDictionary_name(String dictionary_name) {
		this.dictionary_name = dictionary_name;
	}
	public int getDictionary_order() {
		return dictionary_order;
	}
	public void setDictionary_order(int dictionary_order) {
		this.dictionary_order = dictionary_order;
	}
	public int getIsDel() {
		return isDel;
	}
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	
}
