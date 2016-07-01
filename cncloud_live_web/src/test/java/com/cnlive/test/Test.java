package com.cnlive.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.cnlive.mz.commons.net.HttpReq;

public class Test {

	public static void main(String[] args) {
//		String mediaId="123";
//		String title="hha";
//		String sid="234";
//		//String url = "https://mobile.cnlive.com/CnliveMobile/hd/applyChatRoomId.action?mediaId="+mediaId+"&title="+title+"&sid=?"+sid;
//		String url = "https://mobile.cnlive.com/CnliveMobile/hd/applyChatRoomId.action";
//	    //String chat_room_id = HttpReq.getRequestWidthResult(url);
//	    System.out.println(sendGet(url));
		String live = "rtmp://cnlive01.rtmplive.ks-cdn.com/live/498122_a9fdb367c6054edc9d2035dc237d28aa";
		int index = live.lastIndexOf("/");
		System.out.println(index);
		String live_url = live.substring(index+1);
		System.out.println(live_url);
	}
	
	public static String toGMTString(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss z", Locale.UK);
		df.setTimeZone(new java.util.SimpleTimeZone(0, "GMT"));
		return df.format(date);
	}
	public static String sendGet(String url) {
		String result = "";
		BufferedReader in = null;
		try {
			URL realUrl = new URL(url);
			/*
			 * http header 参数
			 */
			String content_type = "application/json";
			String path = realUrl.getFile();
            String date = toGMTString(new Date());
			// 2.计算 HMAC-SHA1
			// 打开和URL之间的连接
			URLConnection connection = realUrl.openConnection();
			System.out.println(connection);
			// 设置通用的请求属性
			// 建立实际的连接
			// 定义 BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			System.out.println("发送GET请求出现异常！" + e);
			e.printStackTrace();
		}
		// 使用finally块来关闭输入流
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
