package com.cnlive.mz.live.common;

import java.util.Calendar;

/**
 * 当前项目公共类
 * 
 * @author liujicheng
 *
 */
public class LiveUtils {
	public static String SESSION_KEY_NAME = "userName";
	public static String SESSION_KEY_ID = "userId";

	public static String SESSION_ROLE_ID = "roleId";
	public static String UPLOAD_TEMP_PATH="";
	public static void main(String[] args) {
		String s = new LiveUtils().getRecentMonths();
		System.out.println(s);
	}

	public static String getRecentMonths() {
		int month = Calendar.getInstance().get(Calendar.MONTH);
		StringBuffer sb = new StringBuffer();
		if (month < 12) {
			month = month + 1;
		}
		for (int i = 1; i <= month; i++) {
			String m = "'" + i + "月" + "'";
			sb.append(m);
			if (i != month) {
				sb.append(",");
			}
		}
		return sb.toString();
	}

}
