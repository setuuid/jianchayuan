package com.dkd.utils.uuid;

public class Common {
	/**
	 * @描述: 根据指定长度格式化数字
	 * @param number 
	 * @param len
	 * @return
	 */
	public static String formatNumber(int number, int len) {
		StringBuffer result = new StringBuffer(len);
		result.append(number);
		for (int i = 0; i < len - String.valueOf(number).length(); i++) {
			result.insert(0, "0");
		}
		return result.toString();
	}
	public static String formatNumber(String str, int len) {
		StringBuffer result = new StringBuffer(len);
		result.append(str);
		for (int i = 0; i < len - str.length(); i++) {
			result.insert(0, "0");
		}
		return result.toString();
	}

}
