package com.dkd.utils.page;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.github.pagehelper.PageInfo;

/**
 * 通用Page
 * @author jsp
 *
 */
public class CurrencyPage<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 查询条件
	 */
	private Map<String, Object> queryTerms = new HashMap<String, Object>();
	
	/**
	 * 查询结果page对象 包含结果集合
	 */
	private PageInfo<T> pageInfo;
	
	/** 
	 * 默认页码
	 */
	private static final int DEFAULT_PAGE_NUM = 1;
	
	/**
	 * 默认每页记录数
	 */
	private static final int DEFAULT_PAGE_SIZE = 10;

	/**
	 * 当前页码
	 */
	private int pageNum = DEFAULT_PAGE_NUM;

	/**
	 * 当前每页记录数
	 */
	private int pageSize = DEFAULT_PAGE_SIZE;

	public Map<String, Object> getQueryTerms() {
		return queryTerms;
	}

	public void setQueryTerms(Map<String, Object> queryTerms) {
		this.queryTerms = queryTerms;
	}

	public PageInfo<T> getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo<T> pageInfo) {
		this.pageInfo = pageInfo;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public static int getDefaultPageNum() {
		return DEFAULT_PAGE_NUM;
	}

	public static int getDefaultPageSize() {
		return DEFAULT_PAGE_SIZE;
	}
	
	@Override
	public String toString() {
		String toString = String.valueOf(this.getPageNum()) + String.valueOf(this.getPageSize());
		StringBuilder sb = new StringBuilder(toString);
		for(Map.Entry<String, Object> entry : queryTerms.entrySet()) {    
			if (entry.getValue() != null) {
				sb.append(entry.getValue().toString());
			}	
		} 
		return sb.toString();
	}

}
