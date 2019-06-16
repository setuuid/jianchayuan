package com.dkd.utils.annotation;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import com.dkd.system.bo.Department;
import com.dkd.system.bo.Role;





/**
 * 获取注解属性名称
 * @author jsp
 *
 */
public class AttributeName {
	
	public static void main(String[] args) {
	}
	
	public static Map<Object,Object> escapeChinese(String className,String json) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		Map<Object, Object> map1 = getAttribute(className);
		Map<Object,Object> map2 = toObject(className,json);
		for(Map.Entry<Object, Object> entry1 : map1.entrySet()) {
			for(Map.Entry<Object, Object> entry2 : map2.entrySet()) {
				if(null != entry1 && null != entry2) {
					if(entry1.getKey().equals(entry2.getKey())) {
						map.put(entry1.getValue(),entry2.getValue());
					}
				}
			}
		}
		return map;
	}

	/**
	 * 获取属性及注解值 key:属性名 value:注解名称
	 * @param className
	 * @return
	 */
	public static Map<Object,Object> getAttribute(String className) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		/*try {
			Class<?> Claz = Class.forName(className);
			Object object = Claz.newInstance();
			//获取所有注解及属性
			Field[] fields = object.getClass().getDeclaredFields();
			for(Field field : fields) {
				GetAttributeName annotation = field.getAnnotation(GetAttributeName.class);
				if(null != annotation) {
					map.put(field.getName(), annotation.attributeName());
				}
			}
			return map;
		} catch(Exception e) {
			e.printStackTrace();
			return map;
		}*/
		return map;
	}
	
	
	/**
	 * 处理Json key:属性名 value:值
	 * @param className
	 * @param json
	 * @return
	 */
	public static Map<Object,Object> toObject(String className,String json) {
		//Gson gson = new Gson();
		Map<Object, Object> map = new HashMap<Object, Object>();
		/*try {
			Class<?> Claz = Class.forName(className);
			Object object = Claz.newInstance();
			object  = gson.fromJson(json, Claz);
			if(null != object) {
				map = new org.apache.commons.beanutils.BeanMap(object);  
			}
			return map;
		} catch(Exception e) {
			e.printStackTrace();
			return map;
		}*/
		return map;
	}
	
	
	public static boolean checkType(String type) {
		boolean result = false;
		if(!type.contains("java")) {
			result = true;
		}
		return result;
	}
}
