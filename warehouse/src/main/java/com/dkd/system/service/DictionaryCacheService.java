package com.dkd.system.service;

import java.util.Map;

/**
 * 
 * 字典缓存服务
 *
 */
public interface DictionaryCacheService {

	public void loadDicMap(); 
	
	public String getDicName(String group, String code);
	
	public Map<String, String> getMapByGroup(String group);
}
