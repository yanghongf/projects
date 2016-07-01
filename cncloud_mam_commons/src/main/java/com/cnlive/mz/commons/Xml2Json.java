package com.cnlive.mz.commons;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

import org.apache.commons.io.FileUtils;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

public class Xml2Json {
	public static String xml2JSON(String xml) {
		return new XMLSerializer().read(xml).toString();
	}

	public static String json2XML(String json) {
		JSONObject jobj = JSONObject.fromObject(json);
		String xml = new XMLSerializer().write(jobj);
		return xml;
	}

	public static void main(String[] args) {
		String STR_JSON = "";
		try {
			STR_JSON = FileUtils.readFileToString(new File("C:/Users/liujicheng/Desktop/info.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		String json = xml2JSON(STR_JSON);
		System.out.println("json=" + json);
	}
}