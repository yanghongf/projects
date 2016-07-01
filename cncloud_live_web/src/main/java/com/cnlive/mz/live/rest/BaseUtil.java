package com.cnlive.mz.live.rest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import com.cnlive.mz.commons.net.HttpReq;

import sun.misc.BASE64Encoder;

public class BaseUtil {

	private static final String ENCODING = "UTF-8";

	// AccessKey、SecretKey
	private static final String SECRET_KEY = "UIWPYVeaV8kq2vWImDkLBvWs/pwmTJVF9MCNHDsC";
	private static final String ACCESS_KEY = "fWUN8KDtJZJGo0ArQ4qo";

	/*
	 * 计算MD5+BASE64
	 */
	public static String MD5Base64(String s) {
		if (s == null)
			return null;
		String encodeStr = "";
		byte[] utfBytes = s.getBytes();
		MessageDigest mdTemp;
		try {
			mdTemp = MessageDigest.getInstance("MD5");
			mdTemp.update(utfBytes);
			byte[] md5Bytes = mdTemp.digest();
			BASE64Encoder b64Encoder = new BASE64Encoder();
			encodeStr = b64Encoder.encode(md5Bytes);
		} catch (Exception e) {
			throw new Error("Failed to generate MD5 : " + e.getMessage());
		}
		return encodeStr;
	}

	/*
	 * 哈希计算 HMAC-SHA1 base64
	 */
	public static String HMACSha1(String data, String key) {
		String result;
		try {
			SecretKeySpec signingKey = new SecretKeySpec(key.getBytes(), "HmacSHA1");
			Mac mac = Mac.getInstance("HmacSHA1");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(data.getBytes());
			// result = new String(Base64.encodeBase64(rawHmac, false), ENCODING);
			// result = (new BASE64Encoder()).encode(rawHmac);
			result = new String(Base64.encodeBase64(rawHmac), ENCODING);
		} catch (Exception e) {
			throw new Error("Failed to generate HMAC : " + e.getMessage());
		}
		return result;
	}

	/**
	 * 获取当前前一天的时间戳
	 * 
	 * @return
	 */
	public static String getTimestamp() {
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		Date date = null;
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, +1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String motoday = sdf.format(calendar.getTime());
			date = df.parse(motoday);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		long timestamp = cal.getTimeInMillis();
		System.out.println("------timestamp-----" + timestamp);
		return String.valueOf(timestamp);

	}

	/**
	 * 签名算法:signature 字符串格式，由三部分组成：GET+”\n”+Expire+”\n”+Resource 2016 0602171212
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String signature(String streamName) throws UnsupportedEncodingException {

		String method = "GET";
		String expire = BaseUtil.getTimestamp();
		String app = "live";
		String methodadd = "add";
		String name = streamName;
		app = java.net.URLEncoder.encode(app, "utf-8");
		methodadd = java.net.URLEncoder.encode(methodadd, "utf-8");
		name = java.net.URLEncoder.encode(name, "utf-8");
		System.out.println(expire + "---expire----");
		String Resource = "app=" + app + "&method=" + methodadd + "&name=" + name;
		// Resource = java.net.URLEncoder.encode(Resource, "utf-8");
		String stringToSign = method + "\n" + expire + "\n" + Resource;
		System.out.println("--stringToSign--" + stringToSign);
		// 2.计算 HMAC-SHA1
		String signature = HMACSha1(stringToSign, SECRET_KEY);
		System.out.println("---signature---" + signature);
		signature = java.net.URLEncoder.encode(signature, "utf-8");
		return signature;
	}

	public static String signature(String methodName, String streamName) throws UnsupportedEncodingException {

		String method = "GET";
		String expire = BaseUtil.getTimestamp();
		String app = "live";
		app = java.net.URLEncoder.encode(app, "utf-8");
		methodName = java.net.URLEncoder.encode(methodName, "utf-8");
		streamName = java.net.URLEncoder.encode(streamName, "utf-8");
		System.out.println(expire + "---expire----");
		String Resource = "app=" + app + "&method=" + methodName + "&name=" + streamName;
		// Resource = java.net.URLEncoder.encode(Resource, "utf-8");
		String stringToSign = method + "\n" + expire + "\n" + Resource;
		System.out.println("--stringToSign--" + stringToSign);
		// 2.计算 HMAC-SHA1
		String signature = HMACSha1(stringToSign, SECRET_KEY);
		System.out.println("---signature---" + signature);
		signature = java.net.URLEncoder.encode(signature, "utf-8");
		return signature;
	}

	public static String UUid() {

		String uuid = UUID.randomUUID().toString();
		uuid = uuid.replaceAll("-", "");
		return uuid;
	}

	public static String getAccessKey() {
		return ACCESS_KEY;
	}

	public static int random_7(int number) {
		int x = (int) (Math.random() * 10);
		for (int i = 0; i < number; i++) {
			String num = Math.random() * 10 + "";
		}
		return x;
	}

	/*
	 * 等同于javaScript中的 new Date().toUTCString();
	 */
	public static String toGMTString(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss z", Locale.UK);
		df.setTimeZone(new java.util.SimpleTimeZone(0, "GMT"));
		return df.format(date);
	}

	/*
	 * 发送POST请求
	 */
	public static String sendPost(String url, String body, String ak_id, String ak_secret) {
		PrintWriter out = null;
		BufferedReader in = null;
		String result = "";
		try {
			URL realUrl = new URL(url);

			/*
			 * http header 参数
			 */
			String method = "POST";
			String accept = "json";
			String content_type = "application/json";
			String path = realUrl.getFile();
			String date = toGMTString(new Date());

			// 1.对body做MD5+BASE64加密
			String bodyMd5 = MD5Base64(body);
			String stringToSign = method + "\n" + accept + "\n" + bodyMd5 + "\n" + content_type + "\n" + date + "\n"
					+ path;
			// 2.计算 HMAC-SHA1
			String signature = HMACSha1(stringToSign, ak_secret);
			// 3.得到 authorization header
			String authHeader = "Dataplus " + ak_id + ":" + signature;

			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();
			// 设置通用的请求属性
			conn.setRequestProperty("accept", accept);
			conn.setRequestProperty("content-type", content_type);
			conn.setRequestProperty("date", date);
			conn.setRequestProperty("Authorization", authHeader);
			// 发送POST请求必须设置如下两行
			conn.setDoOutput(true);
			conn.setDoInput(true);
			// 获取URLConnection对象对应的输出流
			out = new PrintWriter(conn.getOutputStream());
			// 发送请求参数
			out.print(body);
			// flush输出流的缓冲
			out.flush();
			// 定义BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			System.out.println("发送 POST 请求出现异常！" + e);
			e.printStackTrace();
		}
		// 使用finally块来关闭输出流、输入流
		finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}

	/*
	 * GET请求
	 */

	public static String sendGet(String url, String ak_id, String ak_secret) {
		String result = "";
		BufferedReader in = null;
		try {
			URL realUrl = new URL(url);
			/*
			 * http header 参数
			 */
			// String method = "GET";
			// String Expire = "1436976000";
			// String Resource =
			// "nonce=4e1f2519c626cbfbab1520c255830c26&public=0&vdoid=12345";
			// String content_type = "application/json";
			// String path = realUrl.getFile();
			// String date = toGMTString(new Date());
			// // 1.对body做MD5+BASE64加密
			// // String bodyMd5 = MD5Base64(body);
			// String stringToSign = method + "\n" + Expire + "\n" + Resource;
			// // 2.计算 HMAC-SHA1
			// String signature = HMACSha1(stringToSign, ak_secret);
			// // 3.得到 authorization header
			// String authHeader = "Dataplus " + ak_id + ":" + signature;
			// 打开和URL之间的连接
			URLConnection connection = realUrl.openConnection();
			// 设置通用的请求属性
			// connection.setRequestProperty("accept", "json");
			// connection.setRequestProperty("content-type", content_type);
			// connection.setRequestProperty("date", date);
			// connection.setRequestProperty("Authorization", authHeader);
			// 建立实际的连接
			connection.connect();
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

	public static void main(String[] args) throws Exception {
		// 发送POST请求示例
		/*
		 * String ak_id = "fWUN8KDtJZJGo0ArQ4qo"; // 用户ak String ak_secret =
		 * "UIWPYVeaV8kq2vWImDkLBvWs/pwmTJVF9MCNHDsC"; // 用户ak_secret String url
		 * = "https://kmr-cn-beijing.ksyun.com"; String body =
		 * "{\"param1\": \"GET\n1436976000\nnonce=4e1f2519c626cbfbab1520c255830c26&public=0&vdoid=12345\", \"param2\":\"fWUN8KDtJZJGo0ArQ4qo\"}"
		 * ; System.out.println("response body:" + sendPost(url, body, AK_ID,
		 * AK_SECRET));
		 */

		Date date = new Date();
		System.out.println(toGMTString(date));
		String hh = HMACSha1("GET\n1436976124\nnonce=4e1f2519c626cbfbab1520c255830c26&public=1&vdoid=1",
				"fWUN8KDtJZJGo0ArQ4qo");
		String hhhh = MD5Base64(hh);
		System.out.println(hh);
		System.out.println("..............");

		// String str = signature();
		// System.out.println(str);//L2muBoImPzyvwyzfBtGXEu+wRNE=

		// 发送GET请求
		String url1 = "http://cnlive.dashboard.ks-cdn.com/blacklist?signature=iDPKaesXXW3A26CScNyjpNkzxZs%3D&accesskey=I3TC8a4xboPUMe5xlp22&expire=1483200000&app=live&method=add&stream=310166_863";
		System.out.println("response body:" + sendGet(url1, ACCESS_KEY, SECRET_KEY));

		// long d = getTimestamp();
		// System.out.println(d);

		// String str = signature();
		// System.out.println(str);//L2muBoImPzyvwyzfBtGXEu+wRNE=
		/*
		 * // 发送GET请求 String ak_id1 = "fWUN8KDtJZJGo0ArQ4qo"; //用户ak String
		 * ak_secret1 = "UIWPYVeaV8kq2vWImDkLBvWs/pwmTJVF9MCNHDsC"; //
		 * 用户ak_secret String url1 =
		 * "http://cnlive.uplive.ks-cdn.com?signature=L2muBoImPzyvwyzfBtGXEu+wRNE=&accesskey=fWUN8KDtJZJGo0ArQ4qo&expire=1436976000&method=add&app=live&name=498122_57";
		 * System.out.println("response body:" +sendGet(url1, ak_id1,
		 * ak_secret1));
		 */
		// long d = getTimestamp();
		// System.out.println(d);

	}
}
