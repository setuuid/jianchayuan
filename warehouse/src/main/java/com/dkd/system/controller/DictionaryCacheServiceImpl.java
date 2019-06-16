package com.dkd.dkdbpm.web.system;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkd.system.bo.Dictionary;
import com.dkd.system.service.IDictionaryService;

@Component
public class DictionaryCacheServiceImpl {

	private static IDictionaryService dictionaryService;
	private static Map<String,Map<String,String>> dicMap = null;
	private static Map<String,Dictionary> runMap = new HashMap<String, Dictionary>();
	
	@Autowired
	public static void setSysLogService(IDictionaryService dictionaryService) {
		DictionaryCacheServiceImpl.dictionaryService = dictionaryService;
	}
	
	/**
	 * 启动spring后执行
	 */
	//@PostConstruct
	public static synchronized void loadDicMap() {
		dicMap = new HashMap<String, Map<String, String>>();
		String rootPareat = "0";
		List<Dictionary> list = dictionaryService.selectAll();
		for (Dictionary dictionary : list) {
			String parentid = dictionary.getParent_id();
			if (!rootPareat.equals(parentid)) {
				continue;
			}
			runMap.put(dictionary.getDictionary_id(), dictionary);
			String code = dictionary.getDictionary_code();
			dicMap.put(code, new LinkedHashMap<String, String>());
		}
		for (Dictionary dictionary : list) {
			String parent = dictionary.getParent_id();
			if (rootPareat.equals(parent)) {
				continue;
			}
			Dictionary parentDictionary = runMap.get(parent);
			if (parentDictionary == null)
				continue;
			String group = parentDictionary.getDictionary_code();
			String code = dictionary.getDictionary_code();
			String name = dictionary.getDictionary_name();
			if (!dicMap.containsKey(group))
				continue;
			dicMap.get(group).put(code, name);
		}
		System.out.println(111);
		runMap.clear();
	}
	
	/**
	 * 获取名称
	 * @param group
	 * @param code
	 * @return
	 */
	public static String getDicName(String group, String code) {
		if (dicMap == null)
			loadDicMap();
		if (dicMap.containsKey(group)) {
			Map<String, String> map = dicMap.get(group);
			if (map.containsKey(code))
				return map.get(code);
		}
		return "";
	}
}
