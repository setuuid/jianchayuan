package com.dkd.system.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkd.system.bo.Dictionary;
import com.dkd.system.bo.Resource;
import com.dkd.system.service.IBaseService;

/**
 * 字典Service接口
 * @author SY
 *
 */

@Service
@Transactional
public interface IDictionaryService extends IBaseService<Dictionary>{
	
	public abstract List<Dictionary> selectByParentId(String dictionary_id);
	
	public abstract Dictionary selectByCode(String dictionary_code);
	
	public abstract List<Dictionary> allTree(boolean flag);
	
	public abstract List<Dictionary> selectType(String id);
	
	public abstract void delectById(String id);
	
	public abstract List<Dictionary> selectChildsByPcode(String dictionary_code);
	
	public abstract List<Dictionary> selectChilds(String parent_id);
	
	public abstract List<Dictionary> selectChildsByPid(String dictionary_id);

	public abstract Dictionary selectByName(String dictionary_name);
	
}
