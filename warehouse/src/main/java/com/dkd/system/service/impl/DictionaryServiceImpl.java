package com.dkd.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.Dictionary;
import com.dkd.system.dao.BaseDao;
import com.dkd.system.dao.DictionaryDao;
import com.dkd.system.service.IDictionaryService;

/**
 * 字典Service接口实现
 * @author sy
 *
 */

@Service
@Transactional
public class DictionaryServiceImpl extends BaseServiceImpl<Dictionary> implements IDictionaryService {
	
	@Resource
	private DictionaryDao dictionaryDao;
	
	@Override
	public BaseDao<Dictionary> getDao() {
		return dictionaryDao;
	}

	
	@Override
	public List<Dictionary> selectByParentId(String dictionary_id) {
		return dictionaryDao.selectByParentId(dictionary_id);
	}

	@Override
	public Dictionary selectByCode(String dictionary_code) {
		return dictionaryDao.selectByCode(dictionary_code);
	}

	@Override
	public List<Dictionary> allTree(boolean flag) {
		
		List<Dictionary> list = new ArrayList<Dictionary>();
		//是否只显示菜单
		if(flag) {
			list = dictionaryDao.selectAll();
		} else {
			list = dictionaryDao.treeGrid();
		}
		
		//list = dictionaryDao.treeGrid();
		
		for(Dictionary dictionary : list) {
			if(null != dictionary.getDictionary_id()) {
				dictionary.setId(dictionary.getDictionary_id());
			}
			if(null != dictionary.getDictionary_name()) {
				dictionary.setText(dictionary.getDictionary_name());
			}
			if(null != dictionary.getParent_id()) {
				dictionary.setPid(dictionary.getParent_id());
			}
		}
		return list;
	}

	@Override
	public void delectById(String id) {
		dictionaryDao.delectByCode(id);
		
	}

	@Override
	public List<Dictionary> selectType(String id) {
		
		return dictionaryDao.selectByParentId(id);
	}


	@Override
	public List<Dictionary> selectChildsByPcode(String dictionary_code) {
		return dictionaryDao.selectChildsByPcode(dictionary_code);
	}


	@Override
	public List<Dictionary> selectChilds(String parent_id) {
		List<Dictionary> list = dictionaryDao.selectChilds(parent_id);
		for (Dictionary dictionary : list) {
			if(null != dictionary.getParent_id()) {
				dictionary.setPid(dictionary.getParent_id());
			}
			dictionary.setId(dictionary.getDictionary_id());
			dictionary.setName(dictionary.getDictionary_name());
			dictionary.setState(dictionary.getState());
		}
		return list;
	}


	@Override
	public List<Dictionary> selectChildsByPid(String dictionary_id) {
		return dictionaryDao.selectChildsByPid(dictionary_id);
	}


	//根据字典名查询数据
	@Override
	public Dictionary selectByName(String dictionary_name) {

		return dictionaryDao.selectByName(dictionary_name);
	}
	
	
}
