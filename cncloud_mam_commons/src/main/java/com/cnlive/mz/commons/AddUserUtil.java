package com.cnlive.mz.commons;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.SocketException;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.SystemUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPReply;

import com.cnlive.mz.commons.net.HttpReq;
import com.cnlive.mz.commons.sys.CmdCommand;

public class AddUserUtil { 
	
	
	/**
	 * 步骤一： 写入account.txt账号和密码
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public static String getAccountInfo(String username, String password) {
		StringBuffer xmlData = new StringBuffer("");
		xmlData.append(username);
		xmlData.append("\n");
		xmlData.append(password);
		xmlData.append("\n");
		return xmlData.toString();
	}

	/**
	 * 步骤二 ： 写入 /local_root=/mnt/disk1/ftpfile/'媒资系统登录账号，汉字'
	 * 
	 * @param msg
	 * @return
	 */
	public static String getUserConfig(String msg) {
		StringBuffer xmlData = new StringBuffer("");
		xmlData.append(msg);
		return xmlData.toString();
	}

	/**
	 * 步骤一： 将信息写入account.txt文件
	 * 
	 * @param path
	 * @param context
	 */
	public void wirteString(String path, String context) {
		try {
			FileWriter fileWriter = new FileWriter(path, true);
			BufferedWriter writer = new BufferedWriter(fileWriter);
			writer.write(context);
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成随机字符串
	 * 
	 * @param length
	 * @return
	 */
	public static String getRandomString(int length) { // length表示生成字符串的长度
		String base = "abcdefghijklmnopqrstuvwxyz0123456789#%@";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}

	public boolean makeFtpFile(String host, int port, String username, String pwd, String filepath) {
		FTPClient ftpClient = new FTPClient();
		boolean flag = false;
		try {
			ftpClient.connect(host, port);
		} catch (SocketException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		ftpClient.setControlEncoding("utf-8");
		FTPClientConfig conf = new FTPClientConfig(FTPClientConfig.SYST_NT);

		conf.setServerLanguageCode("zh");
		System.out.println("返回码:" + ftpClient.getReplyCode());
		if (FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {
			try {
				if (ftpClient.login(username, pwd)) {
					try {
						String str = new String(filepath);
						flag = ftpClient.makeDirectory(new String(str.getBytes("GBK"), "iso-8859-1"));
						System.out.println("ftp创建文件夹：" + flag);
						ftpClient.changeWorkingDirectory(str);
					} catch (IOException e) {
						System.out.println("连接FTP出错：" + e.getMessage());
					}

				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			ftpClient.disconnect();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return flag;

	}
}
