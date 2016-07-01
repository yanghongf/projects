/**
 * @filename CardEncryptForcnlive.java
 *@Copyright: Copyright  (c) cnlive.com 2009
 *@Company: 视讯中国
 *@author:刘基城  E-mail:ljc521521@126.com
 *@version: 1.0
 *@time:Jul 3, 2009
 *@link:cnlive.com
 * 
 */

package com.cnlive.mz.commons;

import java.security.Security;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import com.sun.crypto.provider.SunJCE;

public class EncryptForCnlive {
	private static SecretKey deskey; // 加密准钥 des key
	private static DESKeySpec dks; // 加密des key
	private static SecretKeyFactory keyFactory; // 加密方法 key
	private static String strDESkey = "cnlivecnlive"; // 数据加密key

	/**
	 * 
	 * 静态化加密种值
	 * 
	 */

	static {
		try {
			Security.addProvider(new SunJCE());
			dks = new DESKeySpec(strDESkey.getBytes());
			keyFactory = SecretKeyFactory.getInstance("DES");
			deskey = keyFactory.generateSecret(dks);
		} catch (java.security.NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		} catch (java.lang.Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 数据加密
	 * 
	 * @param src
	 * @return
	 */
	public static String EncryptDES(String src) {
		try {
			Cipher c1 = Cipher.getInstance("DES");
			c1.init(Cipher.ENCRYPT_MODE, deskey);
			byte[] cipherByte = c1.doFinal(src.getBytes());
			return byte2hex(cipherByte);
		} catch (java.security.NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		} catch (javax.crypto.NoSuchPaddingException e2) {
			e2.printStackTrace();
		} catch (java.lang.Exception e3) {
			e3.printStackTrace();
		}
		return null;
	}

	/**
	 * 数据解密
	 * 
	 * @param null
	 * @param dst
	 * @return String
	 */

	public static String DecryptDES(String dst) {
		try {
			Cipher c1 = Cipher.getInstance("DES");
			c1.init(Cipher.DECRYPT_MODE, deskey);
			byte[] clearByte = c1.doFinal(hex2byte(dst));
			return new String(clearByte);
		} catch (java.security.NoSuchAlgorithmException e1) {
			e1.printStackTrace();
			return dst;
		} catch (javax.crypto.NoSuchPaddingException e2) {
			e2.printStackTrace();
			return dst;
		} catch (java.lang.Exception e3) {
			e3.printStackTrace();
			return dst;
		}
	}

	/**
	 * 算法
	 * 
	 * @param str
	 * @return
	 */
	public static String byte2hex(byte[] str) {
		String hs = "";
		String stmp = "";
		for (int i = 0; i < str.length; i++) {
			if (str[i] < 0) {
				hs = hs + "A";
				stmp = Integer.toHexString((-str[i]) & 0XFF);
			} else {
				stmp = Integer.toHexString(str[i] & 0XFF);
			}
			if (stmp.length() == 1)

				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
		}
		return hs;
	}

	/**
	 * 加密算法 function hex2byte
	 * 
	 * @param String
	 * @return
	 */
	public static byte[] hex2byte(String str) {
		int length = 0;
		int index = 0;
		while (index < str.length()) {
			if (str.substring(index, index + 1).equals("A"))
				index += 3;
			else
				index += 2;
			length++;
		}
		/**
		 * 临时变量 type[] b
		 * 
		 */
		byte[] b = new byte[length];
		byte btmp;
		index = 0;
		for (int i = 0; i < length; i++) {
			if (str.substring(index, index + 1).equals("A")) {
				btmp = Byte.parseByte("-" + str.substring(index + 1, index + 3), 16);
				index += 3;
			} else {
				btmp = Byte.parseByte(str.substring(index, index + 2), 16);
				index += 2;
			}
			b[i] = btmp;
		}
		return b;
	}

	public static void main(String[] args) {
		System.out.println(DecryptDES("A26167fA09A02A34A44A1a"));
	}
}
