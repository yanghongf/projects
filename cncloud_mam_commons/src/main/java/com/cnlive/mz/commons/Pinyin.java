/** 
 *@Description:汉字转换成拼音，提取字符串汉字首字母，提取汉字ASCII
 *@FileName Pinyin.java
 *@Copyright: Copyright  (c) cnlive.com 2009
 *@Company: 视讯中国
 *@time:Jun 23, 2009
 *@link:cnlive.com
 *
 */
package com.cnlive.mz.commons;

import java.io.File;
import java.io.IOException;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import org.apache.commons.io.FileUtils;

public class Pinyin {
	public static void main(String[] args) {
		 try {
			String str=FileUtils.readFileToString( new File("C:/Users/liujicheng/Desktop/url.txt"));
	System.out.println(str.length());
		 } catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void maina(String[] args) {
		int total = 125900;
		int daikuan = 70000;
		System.out.println(total - daikuan);
		System.out.println(daikuan * 0.02);
		double yuegong = (total - daikuan) / 24;
		System.out.println(yuegong);
	}

	public static void main1(String[] args) {
		int total = 125900;
		int dandujiao = 6100 + 6000 + 2500 + 700;
		int zongjia = total + dandujiao;
		double fang[] = new double[] { 0.3, 0.4, 0.5, 0.6 };
		for (int i = 0; i < fang.length; i++) {
			double f = fang[i];
			double shoufu = f * total;
			double daikuan = total - shoufu;
			double yuegong = daikuan / 24;
			System.out.println("车总价：" + zongjia + "  需要单独交：" + dandujiao + "  方案：" + f + "  首付：" + shoufu + "   贷款："
					+ daikuan + "  月供：" + yuegong);
		}
	}

	/**
	 * * 将汉字转换为全拼 * *
	 * 
	 * @param src
	 *            *
	 * @return String
	 */
	public static String getPinYin(String src) {

		char[] ch = null;

		ch = src.toCharArray();

		String[] strArray = new String[ch.length];

		// 设置汉字拼音输出的格式
		HanyuPinyinOutputFormat hpo = new HanyuPinyinOutputFormat();

		hpo.setCaseType(HanyuPinyinCaseType.LOWERCASE);

		hpo.setToneType(HanyuPinyinToneType.WITHOUT_TONE);

		hpo.setVCharType(HanyuPinyinVCharType.WITH_V);

		String str = "";

		int t0 = ch.length;

		try {
			for (int i = 0; i < t0; i++) {
				// 判断是否为汉字字符
				if (Character.toString(ch[i]).matches("[\\u4E00-\\u9FA5]+")) {
					strArray = PinyinHelper.toHanyuPinyinStringArray(ch[i], hpo);// 将汉字的几种全拼都存到t2数组中
					str += strArray[0];// 取出该汉字全拼的第一种读音并连接到字符串t4后
				} else {
					// 如果不是汉字字符，直接取出字符并连接到字符串t4后
					str += Character.toString(ch[i]);
				}
			}
		} catch (BadHanyuPinyinOutputFormatCombination e) {
			e.printStackTrace();
		}
		return str;
	}

	/**
	 * * 提取每个汉字的首字母 *
	 * 
	 * @param str
	 *            *
	 * @return String
	 */
	public static String getPinYinHeadChar(String str) {

		String convert = "";

		for (int j = 0; j < str.length(); j++) {

			char word = str.charAt(j);
			// 提取汉字的首字母
			String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);

			if (pinyinArray != null) {

				convert += pinyinArray[0].charAt(0);

			} else {

				convert += word;
			}
		}
		return convert;
	}

	/**
	 * * 将字符串转换成ASCII码 *
	 * 
	 * @param cnStr
	 *            *
	 * @return String
	 */
	public static String getCnASCII(String cnStr) {

		StringBuffer strBuf = new StringBuffer();
		// 将字符串转换成字节序列
		byte[] bGBK = cnStr.getBytes();

		for (int i = 0; i < bGBK.length; i++) {
			// System.out.println(Integer.toHexString(bGBK[i] & 0xff));
			// 将每个字符转换成ASCII码
			strBuf.append(Integer.toHexString(bGBK[i] & 0xff));
		}
		return strBuf.toString();
	}

}