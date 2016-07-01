/**
 * Project Name:cnlive_mam_commons
 * File Name:StringUtils.java
 * Package Name:com.cnlive.mz.commons
 * Date:2015年9月17日上午11:29:50
 * Copyright (c) 2015, cnlive.com All Rights Reserved.
 *
 */

package com.cnlive.mz.commons;

/**
 * TODO: 这里用一句话描述当前类的作用 Date: 2015年9月17日 上午11:29:50 <br/>
 * 
 * @author liujicheng
 * @version V1.0
 * @since JDK 1.6
 */
public class StringTools {
	public static String htmlFormat(String format, Object... args) {
		for (int i = 0; i < args.length; i++) {
			format = format.replace("{" + i + "}", String.valueOf(args[i]));
		}
		return format;
	}
}
