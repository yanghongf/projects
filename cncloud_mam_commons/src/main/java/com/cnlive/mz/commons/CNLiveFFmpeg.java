package com.cnlive.mz.commons;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CNLiveFFmpeg {

	// 宽度,设置默认值
	private String width;
	// 高度,设置默认值
	private String height;
	// 长度
	private String length;

	private String info;

	private String filePath;

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getInfo() {
		if (info.length() > 1024) {
			info = info.substring(0, 1000);
		}
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	private static String formatTime(String str) {
		str = str.trim();
		String end_s = "-1";
		try {
			String time = "";
			String se = ".0";
			if (str.indexOf(".") != -1) {
				String time_array[] = str.split("\\.");
				time = time_array[0];
				se = "." + time_array[1];
			} else {
				time = str;
			}
			String hs[] = time.split(":");
			String h = hs[0];
			String m = hs[1];
			String s = hs[2];
			long seconds = Integer.parseInt(h) * 3600;
			seconds += Integer.parseInt(m) * 60;
			seconds += Integer.parseInt(s);
			end_s = "";
			if (se.equals(".0")) {
				end_s = String.valueOf(seconds);
			} else {
				end_s = seconds + se;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return end_s;
	}

	public String getMd5() {
		return CnliveMD5.getHashHttp(this.getFilePath());
	}

	public String getSize() {
		HttpURLConnection urlcon = null;
		try {
			URL url = new URL(this.getFilePath());
			urlcon = (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return String.valueOf(urlcon.getContentLength());
	}

	public static void main(String[] args) {
		System.out.println("  Duration: 00:02:00.00, start: 0.740000, bitrate: 19809 kb/s".length());
	}

	public static void getPreviewImg(String inputPath, String outputImgPath) {
		List<String> commend = new java.util.ArrayList<String>();
		commend.add("ffmpeg");
		// commend.add("G:/encoding_tools/ffmpeg.exe");
		commend.add("-ss");
		commend.add("00:00:03");
		commend.add("-i");
		commend.add(inputPath);
		commend.add("-f");
		commend.add("image2");
		commend.add("-vframes");
		commend.add("1");
		commend.add("-y");
		commend.add(outputImgPath);
		// 1. start
		BufferedReader buf = null; // 保存ffmpeg的输出结果流
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commend);
			builder.redirectErrorStream(true);
			Process p = builder.start();
			// read the standard output
			buf = new BufferedReader(new InputStreamReader(p.getInputStream()));
			int ret = p.waitFor();// 这里线程阻塞，将等待外部转换进程运行成功运行结束后，才往下执行
			// 1. end
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (buf != null) {
				try {
					buf.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public CNLiveFFmpeg(String filePath) {
		this.setFilePath(filePath);
		List<String> commend = new java.util.ArrayList<String>();
		commend.add("ffmpeg");
		commend.add("-i");
		commend.add(filePath);
		StringBuffer sb = new StringBuffer();
		// 1. start
		BufferedReader buf = null; // 保存ffmpeg的输出结果流
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commend);
			builder.redirectErrorStream(true);
			Process p = builder.start();
			String line = null;
			buf = new BufferedReader(new InputStreamReader(p.getInputStream()));
			while ((line = buf.readLine()) != null) {
				if (line.contains("Duration:")) {
					String subLength = line.substring(line.indexOf(":") + 1, line.indexOf(","));
					subLength = subLength.trim();
					length = formatTime(subLength);
					sb.append(line);
				}
				if (line.contains("Video:")) {
					this.formatWidthHeight(line);
				}
				if (line.contains("Stream:")) {
					sb.append(line);
				}
				continue;
			}
			int ret = p.waitFor();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (buf != null) {
				try {
					buf.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		this.setInfo(sb.toString());
	}

	private void formatWidthHeight(String line) {
		String subs[] = line.split(",");
		for (int i = 0; i < subs.length; i++) {
			String str = subs[i].trim();
			if (str.contains("x")) {
				String widthStr = str.split("x")[0].trim();
				Pattern pattern = Pattern.compile("[0-9]*");
				Matcher isNum = pattern.matcher(widthStr);
				if (isNum.matches()) {
					int widthInt = Integer.parseInt(widthStr);
					if (widthInt > 175) {
						String heightStr = str.split("x")[1].trim();
						this.setWidth(widthStr);
						if (heightStr.contains("[")) {
							this.setHeight(heightStr.split("\\[")[0].trim());
						} else {
							this.setHeight(heightStr);
						}
					}
				}
			}
		}
	}

	public static String getLength(String inputPath) {
		List<String> commend = new java.util.ArrayList<String>();
		// commend.add("D:/encoding_tools/ffmpeg-20140826-git-96b2ba6-win32-static/bin/ffmpeg.exe");
		commend.add("ffmpeg");
		commend.add("-i");
		commend.add(inputPath);
		String length = "-1";
		// 1. start
		BufferedReader buf = null; // 保存ffmpeg的输出结果流
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commend);
			builder.redirectErrorStream(true);
			Process p = builder.start();
			String line = null;
			// read the standard output
			buf = new BufferedReader(new InputStreamReader(p.getInputStream()));
			StringBuffer sb = new StringBuffer();
			while ((line = buf.readLine()) != null) {
				if (line.contains("Duration:")) {
					String sub_length = line.substring(line.indexOf(":") + 1, line.indexOf(","));
					sub_length = sub_length.trim();
					length = formatTime(sub_length);
				}
				sb.append(line);
				continue;
			}
			int ret = p.waitFor();// 这里线程阻塞，将等待外部转换进程运行成功运行结束后，才往下执行
			// 1. end
			return length;
		} catch (Exception e) {
			// System.out.println(e);
			return "-1";
		} finally {
			if (buf != null) {
				try {
					buf.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
