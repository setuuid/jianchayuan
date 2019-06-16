package com.dkd.system.service.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.Department;
import com.dkd.system.bo.Resource;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.dao.ResourceDao;
import com.dkd.system.service.IResourceService;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.page.PageUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 权限Service接口实现
 * @author sy
 *
 */

@Service
@Transactional
public class ResourceServiceImpl extends BaseServiceImpl<Resource> implements IResourceService {
	
	@javax.annotation.Resource
	private ResourceDao resourceDao;

	@Override
	public BaseDao<Resource> getDao() {
		return resourceDao;
	}

	/**
	 * 分页查询所有资源
	 */
	@Override
	public CurrencyPage<Resource> treeGrids(CurrencyPage<Resource> page) {
		try {
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			List<Resource> list = resourceDao.treeGrid(page.getQueryTerms());
			for (Resource resource : list) {
				if(null != resource.getParent_id()) {
					resource.setPid(resource.getParent_id());
				}
				resource.setId(resource.getResource_id());
				resource.setName(resource.getResource_name());
				resource.setState(resource.getStatus());
			}
			PageInfo<Resource> pageInfo = new PageInfo<Resource>(list);
			page.setPageInfo(pageInfo);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 查询所有资源
	 */
	@Override
	public List<Resource> allTree(boolean flag) {
		List<Resource> list = new ArrayList<Resource>();
		//是否只显示菜单
		if(flag) {
			list = resourceDao.allTree("RESOURCE_TYPE_MENU");
		} else {
			list = resourceDao.allTree("");
		}
		for(Resource resource : list) {
			if(null != resource.getResource_id()) {
				resource.setId(resource.getResource_id());
			}
			if(null != resource.getResource_name()) {
				resource.setText(resource.getResource_name());
			}
			if(null != resource.getParent_id()) {
				resource.setPid(resource.getParent_id());
			}
		}
		return list;
	}

	@Override
	public List<Resource> selectChilds(String parent_id) {
		List<Resource> list = resourceDao.selectChilds(parent_id);
		for (Resource resource : list) {
			if(null != resource.getParent_id()) {
				resource.setPid(resource.getParent_id());
			}
			resource.setId(resource.getResource_id());
			resource.setName(resource.getResource_name());
			resource.setState(resource.getStatus());
		}
		return list;
	}
}
