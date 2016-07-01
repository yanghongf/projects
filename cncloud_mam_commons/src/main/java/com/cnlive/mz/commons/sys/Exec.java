/**
 * Project Name:cnlive_mam_commons
 * File Name:Exec.java
 * Package Name:com.cnlive.mz.commons.sys
 * Date:2016年4月2日下午4:41:54
 * Copyright (c) 2016, cnlive.com All Rights Reserved.
 *
 */

package com.cnlive.mz.commons.sys;

import java.io.IOException;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.ExecuteException;
import org.apache.commons.exec.ExecuteWatchdog;

/**
 * TODO: 这里用一句话描述当前类的作用 Date: 2016年4月2日 下午4:41:54 <br/>
 * 
 * @author liujicheng
 * @version V1.0
 * @since JDK 1.6
 */
public class Exec {
	public static void main(String[] args) {
		String line = "mstsc";
		CommandLine cmdLine = CommandLine.parse(line);
		DefaultExecutor executor = new DefaultExecutor();
		executor.setExitValue(1);
		ExecuteWatchdog watchdog = new ExecuteWatchdog(60000);
		executor.setWatchdog(watchdog);
		try {
			int exitValue = executor.execute(cmdLine);
		} catch (ExecuteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
