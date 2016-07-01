package com.cnlive.mz.commons.file;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.TreeMap;

import javax.imageio.ImageIO;

import com.sun.jimi.core.Jimi;

public class FileUtil {
	public static void main(String[] args) {
		System.out.println(getExcelFile("D:/image/"));
	}

	/**
	 * 返回最新修改的文件
	 * 
	 * @param path
	 * @return
	 */
	public static File getDescFile(String path, String suffix) {
		TreeMap<Long, File> tm = new TreeMap<Long, File>();
		File subFile[] = new File(path).listFiles();
		for (int i = 0; i < subFile.length; i++) {
			File file = subFile[i];
			if (file.getName().endsWith(suffix)) {
				Long tempLong = new Long(file.lastModified());
				tm.put(tempLong, file);
			}
		}
		if (tm.size() > 0) {
			return tm.get(tm.lastKey());
		} else {
			return null;
		}
	}

	public static String getExcelFile(String contractPath) {
		File file = new File(contractPath);
		if (file.exists()) {
			FilenameFilter filter = new FilenameFilter() {
				public boolean accept(File dir, String name) {
					// TODO Auto-generated method stub
					if (name.endsWith(".xls"))
						return true;
					if (name.endsWith(".xlsx"))
						return true;
					return false;
				}
			};
			File datas[] = file.listFiles(filter);
			for (File data : datas) {
				return data.getAbsolutePath();
			}
		}
		return null;
	}

	/**
	 * 字符串写入到文件
	 * 
	 * @param path
	 */
	public static void stringToTxt(String path, String content) {
		createFolderT(path);
		FileOutputStream outSTr = null;
		BufferedOutputStream Buff = null;
		try {
			outSTr = new FileOutputStream(new File(path));
			Buff = new BufferedOutputStream(outSTr);
			Buff.write(content.getBytes());
			Buff.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				Buff.close();
				outSTr.close();
			} catch (Exception e) {
				e.printStackTrace();
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

	public static void createFolderT(String outputpath) {
		try {
			if (outputpath.contains("/")) {
				outputpath = outputpath.substring(0, outputpath.lastIndexOf("/"));
			} else {
				outputpath = outputpath.substring(0, outputpath.lastIndexOf("\\"));
			}
			if (outputpath != null) {
				File f = new File(outputpath);
				if (!f.exists()) {
					f.mkdirs();
				}
			}
		} catch (Exception e) {
			File f = new File(outputpath);
			f.mkdirs();
		}
	}

	// 获取图片信息
	public static String getImagePro(String imagePath) {
		int wideth = 0;
		int height = 0;
		String param = "";
		if (imagePath.endsWith("png")) {
			Image img = Jimi.getImage(imagePath);
			wideth = img.getWidth(null);
			height = img.getHeight(null);
		} else {
			try {
				File file = new File(imagePath); // 读入文件
				BufferedImage src = ImageIO.read(file);
				wideth = src.getWidth(null); // 得到源图宽
				height = src.getHeight(null); // 得到源图长
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		param = wideth + "/" + height;
		System.out.println(param);
		return param;
	}
}
