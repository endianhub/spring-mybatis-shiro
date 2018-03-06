package com.xh.mybatis.shiro.commons.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * <p>Title: 获取db.properties配置文件里的参数，并进行解密</p>
 * <p>Description: </p>
 * 
 * @author H.Yang
 * @date 2018年3月6日
 *
 */
public final class PropertiesUtil extends PropertyPlaceholderConfigurer {
	private static final String KEY = "D@A4J8%37MO03Z+U";
	private static Map<String, String> ctxPropertiesMap;
	private List<String> decryptProperties;

	@Override
	protected void loadProperties(Properties props) throws IOException {
		super.loadProperties(props);
		try {
			ctxPropertiesMap = new HashMap<String, String>();
			for (Object key : props.keySet()) {
				String keyStr = key.toString();
				String value = props.getProperty(keyStr);
				if (decryptProperties != null && decryptProperties.contains(keyStr)) {
					value = SecurityUtil.decrypt(value, KEY);
					props.setProperty(keyStr, value);
				}
				ctxPropertiesMap.put(keyStr, value);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param decryptPropertiesMap
	 *            the decryptPropertiesMap to set
	 */
	public void setDecryptProperties(List<String> decryptProperties) {
		this.decryptProperties = decryptProperties;
	}

	/**
	 * Get a value based on key , if key does not exist , null is returned
	 * 
	 * @param key
	 * @return
	 */
	public static String getString(String key) {
		try {
			return ctxPropertiesMap.get(key);
		} catch (MissingResourceException e) {
			return null;
		}
	}

	/**
	 * 根据key获取值
	 * 
	 * @param key
	 * @return
	 */
	public static int getInt(String key) {
		return Integer.parseInt(ctxPropertiesMap.get(key));
	}

	/**
	 * 根据key获取值
	 * 
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static int getInt(String key, int defaultValue) {
		String value = ctxPropertiesMap.get(key);
		if (StringUtils.isBlank(value)) {
			return defaultValue;
		}
		return Integer.parseInt(value);
	}

	/**
	 * 根据key获取值
	 * 
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static boolean getBoolean(String key, boolean defaultValue) {
		String value = ctxPropertiesMap.get(key);
		if (StringUtils.isBlank(value)) {
			return defaultValue;
		}
		return new Boolean(value);
	}

	public static void main(String[] args) throws Exception {
		String value = "jdbc:mysql://localhost:3306/spring_shiro?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&useSSL=false";
		String encrypt = SecurityUtil.encrypt(value, KEY);
		System.out.println(encrypt);
		System.out.println(SecurityUtil.decrypt(encrypt, KEY));

	}
}
