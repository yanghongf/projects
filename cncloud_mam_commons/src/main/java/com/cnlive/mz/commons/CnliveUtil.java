package com.cnlive.mz.commons;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;

import com.sun.jimi.core.Jimi;

public class CnliveUtil {

	static final String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";

	public static boolean isEmail(String email) {
		if (StringUtils.isEmpty(email)) {
			return false;
		} else {
			Pattern pattern = Pattern.compile(check);
			Matcher matcher = pattern.matcher(email);
			return matcher.matches();
		}
	}

	public static String getT(String fpath) {
		StringBuffer sb = new StringBuffer();
		BufferedReader br = null;
		FileReader fr = null;
		try {
			fr = new FileReader(fpath);
			br = new BufferedReader(fr);
			String s;
			while ((s = br.readLine()) != null) {
				if (s.contains("StatusCode")) {
					sb.append(s);
					sb.append("\n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	private static final Log LOG = LogFactory.getLog(CnliveUtil.class);
	public static final int PAGE_SIZE = 30;

	public static String getFFmpegPath() {
		if (isWindows()) {
			return Constants.FFMPEG_PATH_WIN;
		} else {
			return Constants.FFMPEG_PATH_LINUX;
		}
	}

	public static void buildTxt(String path, String content) {
		FileOutputStream outSTr = null;
		BufferedOutputStream buff = null;
		try {
			File file = new File(path.substring(0, path.lastIndexOf("/")));
			if (!file.isDirectory()) {
				file.mkdirs();
			}
			outSTr = new FileOutputStream(new File(path));
			buff = new BufferedOutputStream(outSTr);
			buff.write(content.getBytes());
			buff.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				buff.close();
				outSTr.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static boolean isWindows() {
		String serverName = System.getProperty("os.name");
		if (serverName.contains("Windows")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 验证视频文件类型是否合法
	 * 
	 * @param suffix
	 * @return 1：视频<br>
	 *         2:图片<br>
	 *         3:文本文件<br>
	 */
	public static boolean isImage(String suffix) {
		if (Arrays.asList(Constants.IMAGE_FORMAT).contains(suffix)) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isVideo(String suffix) {
		if (Arrays.asList(Constants.VIDEO_FORMAT).contains(suffix)) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isTxt(String suffix) {
		if (Arrays.asList(Constants.TEXT_FORMAT).contains(suffix)) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isOtherFile(String suffix) {
		if (Arrays.asList(Constants.OTHER_FORMAT).contains(suffix)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 获取UUID
	 * 
	 * @return String
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static void main(String[] args) {
		for (int i = 0; i < 10; i++) {
			System.out.println(UUID.randomUUID().toString().replaceAll("-", ""));
		}
	}

	/**
	 * 过滤特殊字符
	 * 
	 * @param str
	 * @return
	 */
	public static String StringFilter(String str) {
		String regEx = "[^a-zA-Z0-9]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		return m.replaceAll("").trim();
	}

	public static String getDayFormat(Date date, String format) {
		String time = ""; // 设置时间
		TimeZone tz = TimeZone.getTimeZone("GMT+8:00");// 显示格式
		SimpleDateFormat sdf = new SimpleDateFormat(format); // 格式化时间
		sdf.setTimeZone(tz);// 设置区域
		time = sdf.format(date); // 获取字符串，传递给time
		return time;// 返回时间

	}

	public static Map jsonObject2Map(JSONObject jsonObject) {
		Map map = new HashMap();
		Iterator<?> it = jsonObject.keys();
		while (it.hasNext()) {// 遍历JSONObject
			String key = (String) it.next().toString();
			String value = jsonObject.getString(key);
			map.put(key, value);
		}
		return map;
	}

	public String getImageSize(long size) {
		float s = Long.valueOf(size).floatValue();
		float d = 1024;
		float ss = s / d;
		DecimalFormat df = new DecimalFormat("0.00");// 格式化小数，不足的补0
		String filesize = df.format(ss);// 返回的是String类型的
		return filesize;
	}

	public static String getImagePro(String imagePath) {
		int width = 0;
		int height = 0;
		String param = "";
		try {
			if (imagePath.endsWith("png")) {
				Image img = Jimi.getImage(imagePath);
				width = img.getWidth(null);
				height = img.getHeight(null);
			} else {
				try {
					File file = new File(imagePath); // 读入文件
					BufferedImage src = ImageIO.read(file);
					width = src.getWidth(null); // 得到源图宽
					height = src.getHeight(null); // 得到源图长
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (width == -1) {
				// 如果png读取出错 采用如下方法再次读取
				Image image;
				try {
					image = ImageIO.read(new File(imagePath));
					width = image.getWidth(null);
					height = image.getHeight(null);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			param = width + "/" + height;
		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println("读取图片信息错误：" + imagePath);
		}
		return param;
	}

	// public static String getImagePro(String imagePath) {
	// int width = 0;
	// int height = 0;
	// File file = new File(imagePath);
	// try {
	// BufferedImage bufferedImage = ImageIO.read(file);
	// // width = bufferedImage.getWidth(null);
	// // height = bufferedImage.getHeight(null);
	// width = bufferedImage.getWidth();
	// height = bufferedImage.getHeight();
	// } catch (IOException e) {
	// //80x60.png
	// if (file.getName().contains("x")) {
	// String base = file.getName().substring(0,file.getName().indexOf("."));
	// String w=base.split("x")[0];
	// String h=base.split("x")[1];
	// width=Integer.parseInt(w);
	// height=Integer.parseInt(h);
	// }
	// //e.printStackTrace();
	// }
	// System.out.println(width + "/" + height);
	// return width + "/" + height;
	// }

	public static String getFileSize(long size) {
		float s = Long.valueOf(size).floatValue();
		float d = 1024;
		float ss = s / d;
		DecimalFormat df = new DecimalFormat("0.00");// 格式化小数，不足的补0
		return df.format(ss);// 返回的是String类型的
	}

	public static String getMinute(String second) {
		int dot = second.indexOf(".");
		if (dot > 1) {
			return second.substring(0, dot + 1);
		} else {

			return second;
		}
	}

	public static String getTxtContent(String fpath) {
		StringBuffer sb = new StringBuffer();
		BufferedReader br = null;
		FileReader fr = null;
		try {
			fr = new FileReader(fpath);
			br = new BufferedReader(fr);
			String s;
			while ((s = br.readLine()) != null) {
				sb.append(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	public static String getDescription(String FilePath) {
		return getTxtContent(FilePath);
	}

	public static List getTxtContents(String fpath) {
		BufferedReader br = null;
		FileReader fr = null;
		List list = new ArrayList();
		try {
			fr = new FileReader(fpath);
			br = new BufferedReader(fr);
			String s;
			int i = 0;
			while ((s = br.readLine()) != null) {
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public static String getVideoPoolColumnName(String fileName) {
		if (fileName.contains(".")) {
			return fileName.substring(0, fileName.indexOf("."));
		} else {
			return "error";
		}
	}

	public static String getFileExtra(String filePath) {
		if (filePath == null || "".equals(filePath)) {
			return "error";
		} else {
			if (filePath.contains(".")) {
				return filePath.substring(filePath.lastIndexOf(".") + 1);
			} else {
				return "err";
			}
		}
	}

	/**
	 * 根据id 进行每两位加一个斜线组成目录的形式
	 * 
	 * @param str
	 * @return
	 */
	public static String subFolder(String str) {
		if (str == null) {
			return "";
		}
		char[] tempChar = str.toCharArray();
		String splitStr = "/";
		String tempStr = "/";
		for (int i = 0; (i < tempChar.length); i++) {
			String s1 = str.valueOf(tempChar[i]);
			if (i > 0 && i % 2 == 0) {
				tempStr = tempStr + splitStr + s1;
			} else {
				tempStr = tempStr + s1;
			}
		}
		if (tempStr.endsWith("/")) {
		} else {
			tempStr = tempStr + "/";
		}
		return tempStr;
	}

	/**
	 * 格式化处理，结果为00/00/00/00/ 8位数字
	 * 
	 * @param name
	 * @param empty
	 * @return
	 */
	public static String formatName(String name, String empty) {
		int length = name.length();
		int limit = 0;
		String temp = "";
		if (length > 5) {
		} else {
			// 对文件名全面进行补 0 处理
			limit = 5 - length;
			for (int i = 1; i <= limit; i++) {
				temp = temp + "0";
			}
		}
		return temp + name;
	}

	/**
	 * 格式化文件名称对小于6为的名称前面进行补0处理
	 * 
	 * @param name
	 * @return
	 */
	public static String formatName(String name) {
		int length = name.length();
		int limit = 0;
		String temp = "";
		if (length > 8) {
		} else {
			// 对文件名全面进行补 0 处理
			limit = 8 - length;
			for (int i = 1; i <= limit; i++) {
				temp = temp + "0";
			}
		}
		return temp + name;
	}

	public static boolean isUpdate(String name) {
		List updateParamter = new ArrayList();
		// 联通
		updateParamter.add("h264_qvga");
		// 电信
		updateParamter.add("300264QVGA");
		// 移动
		updateParamter.add("2_jb");
		// 联通 iPhone

		updateParamter.add("iPhone");
		// 联通NET
		updateParamter.add("bq");

		// 河南联通
		updateParamter.add("480x320_IPHONE");

		updateParamter.add("54");
		if (updateParamter.contains(name)) {
			return true;
		} else {
			return false;
		}
	}

	public boolean validateName() {
		String s = "123as是dqwe__123  rew-traf)gds";
		if (s.replaceAll("[\\u4e00-\\u9fa5]*[()]*[《》]*[a-z]*[A-Z]*\\d*-*_*\\s*", "").length() == 0) {
			return true;
		} else {
			return false;
		}
	}
}