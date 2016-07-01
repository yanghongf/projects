package com.cnlive.mz.commons.sys;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.logging.Logger;

import org.apache.commons.lang.SystemUtils;

public class CmdCommand {

	static Logger logger = Logger.getLogger(CmdCommand.class.getName());

	public static void main(String[] args) throws Exception {

		CmdCommand executeCmdCommand = new CmdCommand();
		if (SystemUtils.IS_OS_LINUX) {
			// executeCmdCommand.callCmd("ls -al");

		} else if (SystemUtils.IS_OS_WINDOWS) {
			executeCmdCommand.callCmd("ls -al");
		} else {
			System.out.println("不支持的OS");
		}

	}

	public class ExecuteException extends Exception {

		public ExecuteException() {
			super();
		}

		public ExecuteException(String arg0) {
			super(arg0);
		}

	}

	public class UnHandledOSException extends Exception {

		public UnHandledOSException() {
			super();
		}

		public UnHandledOSException(String arg0) {
			super(arg0);
		}

	}

	public String callCmd(String cmd) throws InterruptedException, UnHandledOSException, ExecuteException {
		if (SystemUtils.IS_OS_LINUX) {
			try {
				// 使用Runtime来执行command，生成Process对象
				Process process = Runtime.getRuntime().exec(new String[] { "/bin/sh", "-c", cmd });
				int exitCode = process.waitFor();
				// 取得命令结果的输出流
				InputStream is = process.getInputStream();
				// 用一个读输出流类去读
				InputStreamReader isr = new InputStreamReader(is);
				// 用缓冲器读行
				BufferedReader br = new BufferedReader(isr);
				String line = null;
				StringBuilder sb = new StringBuilder();
				while ((line = br.readLine()) != null) {
					System.out.println(line);
					sb.append(line);
				}
				is.close();
				isr.close();
				br.close();
				return sb.toString();
			} catch (java.lang.NullPointerException e) {
				System.err.println("NullPointerException " + e.getMessage());
			} catch (java.io.IOException e) {
				System.err.println("IOException " + e.getMessage());
			}
			throw new ExecuteException(cmd + "执行出错！");
		}

		if (SystemUtils.IS_OS_WINDOWS) {
			Process process;
			try {
				// process = new ProcessBuilder(cmd).start();
				String[] param_array = cmd.split("[\\s]+");
				ProcessBuilder pb = new ProcessBuilder(param_array);
				process = pb.start();
				/* process=Runtime.getRuntime().exec(cmd); */
				int exitCode = process.waitFor();
				InputStream is = process.getInputStream();
				InputStreamReader isr = new InputStreamReader(is);
				BufferedReader br = new BufferedReader(isr);
				String line;
				StringBuilder sb = new StringBuilder();

				while ((line = br.readLine()) != null) {
					System.out.println(line);
					sb.append(line);
				}
				is.close();
				isr.close();
				br.close();
				return sb.toString();
			} catch (IOException e) {
				e.printStackTrace();
			}
			throw new ExecuteException(cmd + "执行出错！");
		}

		throw new UnHandledOSException("不支持本操作系统");
	}

}