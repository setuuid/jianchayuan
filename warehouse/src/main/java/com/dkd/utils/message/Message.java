package com.dkd.system.util.message;

import java.io.InputStream;
import java.util.Properties;

/**
 * 消息工具类
 * @author SY
 *
 */

public class Message {
	
	/**
	 * 根据key读取value
	 * @param key
	 * @return
	 */
	
	public static String readValue(String key) {
		Properties props = new Properties();
        try {
        	InputStream in = Message.class.getClassLoader().getResourceAsStream("messages.properties");
        	props.load(in);
        	String value = props.getProperty (key);
            return value;
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;
        }
	}
	
}
