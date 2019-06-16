package com.dkd.system.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.Resource;
import com.dkd.system.service.IBaseService;
import com.dkd.utils.page.CurrencyPage;

/**
 * 权限Service接口
 * @author SY
 *
 */

@Service
@Transactional
public interface IResourceService extends IBaseService<Resource> {
	
	CurrencyPage<Resource> treeGrids(CurrencyPage<Resource> page);
	
	List<Resource> allTree(boolean flag);
	
	List<Resource> selectChilds(String parent_id);
	
}
