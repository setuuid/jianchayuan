package com.dkd.system.service;

import java.util.List;
import java.util.Map;

import com.dkd.utils.page.CurrencyPage;

/**
 * 泛型Service接口
 * @author SY
 * @param <T> 实体
 * 
 */

public interface IBaseService<T>  {

	/**
	 * 通用插入实体
	 * @param t
	 * @return
	 */
	
    public abstract int insert(T t);  
    
    /**
     * 通用修改实体
     * @param t
     * @return
     */
    
    public abstract int update(T t);  
    
    /**
     * 通用编辑实体
     * @param t
     * @param primaryKey
     */
    
    public abstract void edit(T t, String primaryKey);
    
    /**
     * 通用删除实体 物理删除
     * @param primaryKey
     * @return
     */
    
    public abstract int delete(String primaryKey); 
    
    /**
     * 通用条件查询
     * @param object 
     * @return
     */
    
    public abstract Map<String, Object> selectByCondition(Object object);
    
    /**
     * 条件查询分页
     * @param page
     * @return
     */
    
//    public abstract Page1<T> queryPage(Page1<T> page);
	
    /**
     * 通用id查询实体
     * @param primaryKey
     * @return
     */
    
	public abstract T selectByPk(String primaryKey);
	
	/**
	 * 通用查询全部
	 * @return
	 */
	
    public abstract List<T> selectAll();
	
    /**
     * 通用统计全部
     * @return
     */
    
	public abstract int countAll();
	
	/**
	 * 通用条件统计
	 * @param object
	 * @return
	 */
	
	public abstract int countByCondition(Object object); 
	
	/**
	 * 通用分页查询
	 * @param page
	 * @return
	 */
	public abstract CurrencyPage<T> queryPage(CurrencyPage<T> page);
    
//	public abstract void convert2Html(String fileName, String outPutFile,Map<String, String> map);
	
}
