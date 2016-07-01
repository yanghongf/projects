package com.cnlive.mz.commons.net;

import java.io.File;
import java.net.URL;

import org.apache.commons.io.FileUtils;

public class HttpUtils {

	public String downloadHttpUrl(String url, String dir) {
		String fileName = getFileNameFromUrl(url);
		try {
			URL httpurl = new URL(url);
			File f = new File(dir + fileName);
			FileUtils.copyURLToFile(httpurl, f);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return dir + fileName;
	}

	public String getFileNameFromUrl(String url) {
		String name = new Long(System.currentTimeMillis()).toString() + ".X";
		int index = url.lastIndexOf("/");
		if (index > 0) {
			name = url.substring(index + 1);
			if (name.trim().length() > 0) {
				return name;
			}
		}
		return name;
	}
}
