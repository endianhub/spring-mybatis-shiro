package com.xh.mybatis.shiro.commons.utils;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 * <p>Title: 数据加密辅助类(默认编码UTF-8)</p>
 * <p>Description: </p>
 * 
 * @author H.Yang
 * @date 2018年3月6日
 *
 */
public final class SecurityUtil {

	/**
	 * 采用AES用户指定密钥的方式进行解密，密钥需要与加密时指定的密钥一样<br>
	 * 根据相应的解密算法、指定的密钥和需要解密的文本进行解密，返回解密后的文本内容
	 * 
	 * @param info:要加密的内容
	 * @param key：这个key可以由用户自己指定
	 *            注意AES的长度为16位,DES的长度为8位
	 * @return
	 * @throws Exception
	 */
	public static String decrypt(String info, String key) throws Exception {
		try {
			// 判断Key是否正确
			if (key == null) {
				throw new Exception("Key为空null");
			}
			// 判断采用AES加解密方式的Key是否为18位
			if (key.length() != 16) {
				throw new Exception("Key长度不是18位");
			}
			byte[] raw = key.getBytes("ASCII");
			SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec);
			byte[] encrypted1 = hex2byte(info);
			try {
				byte[] original = cipher.doFinal(encrypted1);
				String originalString = new String(original);
				return originalString;
			} catch (Exception e) {
				throw e;
			}
		} catch (Exception ex) {
			throw ex;
		}
	}

	/**
	 * 采用AES指定密钥的方式进行加密<br>
	 * 根据相应的加密算法、指定的密钥、源文件进行加密，返回加密后的文件
	 * 
	 * @param info:要加密的内容
	 * @param key：这个key可以由用户自己指定
	 *            注意AES的长度为16位,DES的长度为8位
	 * @return
	 * @throws Exception
	 */
	public static String encrypt(String info, String key) throws Exception {
		// 判断Key是否正确
		if (key == null) {
			throw new Exception("Key为空null");
		}
		// 判断采用AES加解密方式的Key是否为18位
		if (key.length() != 16) {
			throw new Exception("Key长度不是18位");
		}
		byte[] raw = key.getBytes("ASCII");
		SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
		byte[] encrypted = cipher.doFinal(info.getBytes());
		return byte2hex(encrypted);
	}

	/**
	 * 十六进制字符串转化为2进制
	 * 
	 * @param hex
	 * @return
	 */
	public static byte[] hex2byte(String strhex) {
		if (strhex == null) {
			return null;
		}
		int l = strhex.length();
		if (l % 2 == 1) {
			return null;
		}
		byte[] b = new byte[l / 2];
		for (int i = 0; i != l / 2; i++) {
			b[i] = (byte) Integer.parseInt(strhex.substring(i * 2, i * 2 + 2), 16);
		}
		return b;
	}

	/**
	 * 将二进制转化为16进制字符串
	 * 
	 * @param b
	 *            二进制字节数组
	 * @return String
	 */
	public static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1) {
				hs = hs + "0" + stmp;
			} else {
				hs = hs + stmp;
			}
		}
		return hs.toUpperCase();
	}

	/**
	 * 测试
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		SecurityUtil securityUtil = new SecurityUtil();
		String source = "admini";

		// 生成一个AES算法的密匙
		String key = "4253H45G3JHG5384";
		try {
			// 生成一个AES算法的密匙
			String strc = securityUtil.encrypt(source, key);
			System.out.println("AES加密后为:" + strc);
			// 使用这个密匙解密
			String strd = securityUtil.decrypt(strc, key);
			System.out.println("AES解密后为：" + strd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
