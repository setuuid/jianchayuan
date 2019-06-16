package com.dkd.utils.page;




/**
 * 获得page对象工具
 * @author SY
 *
 */

public class PageUtil {
	
	private Page page = null;//初始为空 用于计算最大值

	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
	/**
	 * 获得page对象 用于分页
	 * @param pageNow
	 * @param totalCount
	 * @return
	 */
	
	public Page getPage(String pageNow,int totalCount,String pageSize){
		if (pageNow != null && Integer.parseInt(pageNow) !=0 && pageSize != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow),Integer.parseInt(pageSize));
		} else {
			if(null != pageNow) {
				page = new Page(totalCount, Integer.parseInt(pageNow),10);		
			} else {
				page = new Page(totalCount, 1,10);	
			}
		}
		return page;
	}
	
}
