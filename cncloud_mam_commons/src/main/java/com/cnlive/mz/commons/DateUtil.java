/**
 * Project Name:cnlive_mam_commons
 * File Name:DateUtil.java
 * Package Name:com.cnlive.mz.commons
 * Date:2015年8月4日下午1:47:33
 * Copyright (c) 2015, cnlive.com All Rights Reserved.
 *
 */

package com.cnlive.mz.commons;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/**
 * TODO: 日期转换工具类 <br/>
 * Date: 2015年8月4日 下午1:47:33 <br/>
 * 
 * @author liujicheng
 * @version V1.0
 * @since JDK 1.6
 */
public class DateUtil {

	public static String toString(Date date) {
		String time = ""; // 设置时间
		if (date != null) {
			TimeZone tz = TimeZone.getTimeZone("GMT+8:00");// 显示格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 格式化时间
			sdf.setTimeZone(tz);// 设置区域
			time = sdf.format(date); // 获取字符串，传递给time
		}
		return time;// 返回时间
	}

	/**
	 * 返回固定yyyy-MM-dd格式日期 date类型
	 * 
	 * @return
	 */
	public static Date toDate(String strDate) {
		Date date = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static Date formatSringtoDate(String str) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = format1.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		str = format1.format(date);
		return date;
	}

	public static String getDays(String format) {
		String time = ""; // 设置时间
		Date date = new Date();// 声明时间类
		TimeZone tz = TimeZone.getTimeZone("GMT+8:00");// 显示格式
		SimpleDateFormat sdf = new SimpleDateFormat(format); // 格式化时间
		sdf.setTimeZone(tz);// 设置区域
		time = sdf.format(date); // 获取字符串，传递给time
		return time;// 返回时间
	}

	public static String getDefaultDay() {
		String time = ""; // 设置时间
		Date date = new Date();// 声明时间类
		TimeZone tz = TimeZone.getTimeZone("GMT+8:00");// 显示格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 格式化时间
		sdf.setTimeZone(tz);// 设置区域
		time = sdf.format(date); // 获取字符串，传递给time
		return time;// 返回时间
	}

	public String timeTran8(String oldtime) {
		String time = "";
		TimeZone tz = TimeZone.getTimeZone("GMT+8:00");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setTimeZone(tz);
		Date date = null;
		try {
			date = sdf.parse(oldtime);
			// 判断日期是否小于当前，如果小于当前，日期设定为当前日期
			Date today = sdf.parse(getDays("yyyy-MM-dd"));
			if (date.before(today)) {
				time = sdf.format(today);
			} else {
				time = sdf.format(date);
			}
		} catch (ParseException e) {
			time = oldtime;
		}
		return time;
	}

	public String timeTran20(String oldtime) {
		String time = "";
		TimeZone tz = TimeZone.getTimeZone("GMT+8:00");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(tz);
		Date date = null;
		try {
			date = sdf.parse(oldtime);
			// 判断日期是否小于当前，如果小于当前，日期设定为当前日期
			Date today = sdf.parse(getDefaultDay());
			if (date.before(today)) {
				time = sdf.format(today);
			} else {
				time = sdf.format(date);
			}
		} catch (ParseException e) {
			time = oldtime;
		}
		return time;
	}

}
