package com.cnlive.mz.commons;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;

/**
 * 文件MD5生成公共类
 * 
 * @author zk
 * @version 1.0
 */

public class CnliveMD5 {
	public static void main(String[] args) {
		String a = CnliveMD5.digest("3540160567818082250431075");
	System.out.println(a);
	}

	public static char[] hexChar = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	/**
	 * 输入文件路径，经过MD5算法加密后返回文件的md5
	 * 
	 * @param fileName
	 * @return
	 */
	public static String getHash(String fileName) {
		String M = "";
		try {
			InputStream fis = new FileInputStream(fileName);
			byte[] buffer = new byte[1024];
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			int numRead = 0;
			while ((numRead = fis.read(buffer)) > 0) {
				md5.update(buffer, 0, numRead);
			}
			fis.close();
			M = toHexString(md5.digest());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return M;
	}

	/**
	 * 输入文件路径，经过MD5算法加密后返回文件的md5
	 * 
	 * @param fileName
	 * @return
	 */
	public static String getHashHttp(String fileUrl) {
		String M = "";
		URL url = null;
		URLConnection connection = null;
		InputStream fis = null;
		try {
			url = new URL(fileUrl);
			connection = url.openConnection();
			fis = connection.getInputStream();
			byte[] buffer = new byte[1024];
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			int numRead = 0;
			while ((numRead = fis.read(buffer)) > 0) {
				md5.update(buffer, 0, numRead);
			}
			M = toHexString(md5.digest());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return M;
	}

	/**
	 * 把字节数组转换为字符串返回
	 * 
	 * @param b
	 * @return
	 */
	public static String toHexString(byte[] b) {
		StringBuilder sb = new StringBuilder(b.length * 2);
		for (int i = 0; i < b.length; i++) {
			sb.append(hexChar[(b[i] & 0xf0) >>> 4]);
			sb.append(hexChar[b[i] & 0x0f]);
		}
		return sb.toString();
	}

	/**
	 * 用于将输入的字符串经过MD5算法加密后返回结果 inString 输入的字符串 outString 输出的结果
	 * 
	 * @param inString
	 * @return
	 */
	public static String digest(String inString) {
		String outString = null;
		try {
			java.security.MessageDigest alg = java.security.MessageDigest.getInstance("MD5");
			alg.update(inString.getBytes());
			byte[] digest = alg.digest();
			outString = byte2hex(digest);
		} catch (java.security.NoSuchAlgorithmException ex) {
			ex.printStackTrace();
		}
		return outString.toLowerCase();
	}

	/**
	 * 用于将二行制转字符串
	 */
	private static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
			if (n < b.length - 1)
				hs = hs + "";
		}
		return hs.toUpperCase();
	}
}
