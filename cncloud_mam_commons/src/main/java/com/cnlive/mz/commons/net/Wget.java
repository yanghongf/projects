package com.cnlive.mz.commons.net;

import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import org.apache.commons.io.FileUtils;

/**
 * TODO: 通过url下载文件到本地 Date: 2015年8月25日 下午2:30:17 <br/>
 * 
 * @author liujicheng
 * @version V1.0
 * @since JDK 1.6
 */
public class Wget {
	public static void main(String[] args) {
		String url = "http://221.181.100.64:8088/+cBO4h7E0KLjWvx+30XaGR9XqI4Wg/MibhYDr/YIBh4u3fFOndp+6gpTts3VbRbtf+q2c9lYUTDu2oMl6GO9rOfseUVl634v3fdmX2XzmbaPgL5FxEM7+09u54o3U24w2Vm++En4wZNK6sHTt7QUIaL+x9Vt+wVeZEmbGkDrX6QfSWofXXSPNQESGa1NlWybWMnhJJoA6nuGZwYW7vBB1A==/3003877193_54.mp4.m3u8?ec=1";
		int flag = url.lastIndexOf("/");
		String m3u8_name = url.substring(flag + 1);
		String id = m3u8_name.substring(0, m3u8_name.indexOf("_"));
		String abs_path = url.substring(0, flag);
		System.out.println(abs_path);
		System.out.println(id);
		System.out.println(m3u8_name);
		new Wget().doWget(url, new File("d:/a.m3u8"));
	}

	private static final int DEFAULT_BUFFER_SIZE = 1024 * 4;

	private static final int EOF = -1;

	public boolean doWget(String url, File destination) {
		try {
			URL httpurl = new URL(url);
			FileUtils.copyURLToFile(httpurl, destination);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	public void doGet(String url, File destination) {
		try {
			URL source = new URL(url);
			copyURLToFile(source, destination);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void copyURLToFile(URL source, File destination) {
		InputStream input = null;
		try {
			input = source.openStream();
			FileOutputStream output = openOutputStream(destination);
			try {
				copy(input, output);
				output.close();
			} finally {
				closeQuietly(output);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			closeQuietly(input);
		}

	}

	public long copyLarge(InputStream input, OutputStream output) throws IOException {
		byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
		long count = 0;
		int n = 0;
		while (EOF != (n = input.read(buffer))) {
			output.write(buffer, 0, n);
			count += n;
		}
		return count;
	}

	public int copy(InputStream input, OutputStream output) throws IOException {
		long count = copyLarge(input, output);
		if (count > Integer.MAX_VALUE) {
			return -1;
		}
		return (int) count;
	}

	public FileOutputStream openOutputStream(File file) throws IOException {
		if (file.exists()) {
			if (file.isDirectory()) {
				throw new IOException("File '" + file + "' exists but is a directory");
			}
			if (file.canWrite() == false) {
				throw new IOException("File '" + file + "' cannot be written to");
			}
		} else {
			File parent = file.getParentFile();
			if (parent != null) {
				if (!parent.mkdirs() && !parent.isDirectory()) {
					throw new IOException("Directory '" + parent + "' could not be created");
				}
			}
		}
		return new FileOutputStream(file, false);
	}

	public void closeQuietly(Closeable closeable) {
		try {
			if (closeable != null) {
				closeable.close();
			}
		} catch (IOException ioe) {
			// ignore
		}
	}
}
