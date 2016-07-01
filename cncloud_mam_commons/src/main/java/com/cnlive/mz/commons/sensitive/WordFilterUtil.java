package com.cnlive.mz.commons.sensitive;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

public class WordFilterUtil {
	
	public static String word_path="/usr/local/SensitiveWord.txt";
	private static Node tree = new Node();
	static {
		InputStream is = null;
		try {
			is = new FileInputStream(new File(word_path));
			InputStreamReader reader = new InputStreamReader(is, "GBK");
			Properties prop = new Properties();
			prop.load(reader);
			Enumeration en = prop.propertyNames();
			while (en.hasMoreElements()) {
				String word = (String) en.nextElement();
				insertWord(word, Integer.valueOf(prop.getProperty(word).trim()).intValue());
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			if (is != null) {
				try {
					is.close();
				} catch (IOException e1) {
					e.printStackTrace();
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			if (is != null) {
				try {
					is.close();
				} catch (IOException e2) {
					e.printStackTrace();
				}
			}
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	//保存敏感词到map集合
	  public Map<String,String> sensitiveWord(String str){
		  Map<String,String> wordAndLevel = new HashMap<String,String>();
		  String[] sensitiveWords=str.trim().split("\\.");
		  String s="";
		  for(int i =0;i<sensitiveWords.length;i++){
			  s=sensitiveWords[i];
			  String[] sensi = s.split(",");
			  wordAndLevel.put(sensi[0].trim(), sensi[sensi.length-1].trim());
		  }
		  return wordAndLevel;
	  }
	  
	  public Map<String,String> sensitiveWordFromFile(String filePath){
		  Map<String,String> sensitiveWord = new HashMap<String,String>();
		  try {
			List<String> list = FileUtils.readLines(new File(filePath),"GBK");
			for(String s:list){
				if(StringUtils.isNotEmpty(s.trim())){
					String[] arr = s.split("=");
					sensitiveWord.put(arr[0], arr[1]);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		  return sensitiveWord;
	  }
	  
	  public boolean writerSensitiveWord(String wo){
		  Map<String,String> sensitiveWordMap = sensitiveWord(wo);
		  Map<String,String> sensitiveWordFromFileMap = sensitiveWordFromFile(word_path);
		  List<String> temp = new ArrayList<String>();
		  List<String> sensitiveList = new ArrayList<String>();
		  for(String s:sensitiveWordMap.keySet()){
			  sensitiveList.add(s);
			  for(String s1:sensitiveWordFromFileMap.keySet()){
				  if(s1.equals(s)){
					  temp.add(s);
				  }
			  }
		  }
		  sensitiveList.removeAll(temp);
		  for(int i = 0;i<sensitiveList.size();i++){
			  String key = sensitiveList.get(i);
			  String value = sensitiveWordMap.get(key);
			  String word = key+"="+value;
			  sensitiveList.set(i, word);
		  }
		  try {
			FileUtils.writeLines(new File(word_path), "GBK",sensitiveList,true);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		  return false;
	  }
	  
	  
	

	private static void insertWord(String word, int level) {
		Node node = tree;
		for (int i = 0; i < word.length(); i++) {
			node = node.addChar(word.charAt(i));
		}
		node.setEnd(true);
		node.setLevel(level);
	}

	private static boolean isPunctuationChar(String c) {
		String regex = "[\\pP\\pZ\\pS\\pM\\pC]";
		Pattern p = Pattern.compile(regex, 2);
		Matcher m = p.matcher(c);
		return m.find();
	}

	private static PunctuationOrHtmlFilteredResult filterPunctation(String originalString) {
		StringBuffer filteredString = new StringBuffer();
		ArrayList<Integer> charOffsets = new ArrayList();
		for (int i = 0; i < originalString.length(); i++) {
			String c = String.valueOf(originalString.charAt(i));
			if (!isPunctuationChar(c)) {
				filteredString.append(c);
				charOffsets.add(Integer.valueOf(i));
			}
		}
		PunctuationOrHtmlFilteredResult result = new PunctuationOrHtmlFilteredResult();
		result.setOriginalString(originalString);
		result.setFilteredString(filteredString);
		result.setCharOffsets(charOffsets);
		return result;
	}

	private static PunctuationOrHtmlFilteredResult filterPunctationAndHtml(String originalString) {
		StringBuffer filteredString = new StringBuffer();
		ArrayList<Integer> charOffsets = new ArrayList();
		int i = 0;
		for (int k = 0; i < originalString.length(); i++) {
			String c = String.valueOf(originalString.charAt(i));
			if (originalString.charAt(i) == '<') {
				for (k = i + 1; k < originalString.length(); k++) {
					if (originalString.charAt(k) == '<') {
						k = i;
					} else {
						if (originalString.charAt(k) == '>') {
							break;
						}
					}
				}
				i = k;
			} else if (!isPunctuationChar(c)) {
				filteredString.append(c);
				charOffsets.add(Integer.valueOf(i));
			}
		}
		PunctuationOrHtmlFilteredResult result = new PunctuationOrHtmlFilteredResult();
		result.setOriginalString(originalString);
		result.setFilteredString(filteredString);
		result.setCharOffsets(charOffsets);
		return result;
	}

	private static FilteredResult filter(PunctuationOrHtmlFilteredResult pohResult, char replacement) {
		StringBuffer sentence = pohResult.getFilteredString();
		ArrayList<Integer> charOffsets = pohResult.getCharOffsets();
		StringBuffer resultString = new StringBuffer(pohResult.getOriginalString());
		StringBuffer badWords = new StringBuffer();
		int level = 0;
		Node node = tree;
		int start = 0;
		int end = 0;
		for (int i = 0; i < sentence.length(); i++) {
			start = i;
			end = i;
			node = tree;
			for (int j = i; j < sentence.length(); j++) {
				node = node.findChar(sentence.charAt(j));
				if (node == null) {
					break;
				}
				if (node.isEnd()) {
					end = j;
					level = node.getLevel();
				}
			}
			if (end > start) {
				for (int k = start; k <= end; k++) {
					resultString.setCharAt(((Integer) charOffsets.get(k)).intValue(), replacement);
				}
				if (badWords.length() > 0) {
					badWords.append(",");
				}
				badWords.append(sentence.substring(start, end + 1));
				i = end;
			}
		}
		FilteredResult result = new FilteredResult();
		result.setOriginalContent(pohResult.getOriginalString());
		result.setFilteredContent(resultString.toString());
		result.setBadWords(badWords.toString());
		result.setLevel(Integer.valueOf(level));
		return result;
	}

	public static String simpleFilter(String sentence, char replacement) {
		StringBuffer sb = new StringBuffer();
		Node node = tree;
		int start = 0;
		int end = 0;
		for (int i = 0; i < sentence.length(); i++) {
			start = i;
			end = i;
			node = tree;
			for (int j = i; j < sentence.length(); j++) {
				node = node.findChar(sentence.charAt(j));
				if (node == null) {
					break;
				}
				if (node.isEnd()) {
					end = j;
				}
			}
			if (end > start) {
				for (int k = start; k <= end; k++) {
					sb.append(replacement);
				}
				i = end;
			} else {
				sb.append(sentence.charAt(i));
			}
		}
		return sb.toString();
	}

	public static FilteredResult filterText(String originalString, char replacement) {
		return filter(filterPunctation(originalString), replacement);
	}

	public static FilteredResult filterHtml(String originalString, char replacement) {
		return filter(filterPunctationAndHtml(originalString), replacement);
	}

	private static class PunctuationOrHtmlFilteredResult {
		private String originalString;
		private StringBuffer filteredString;
		private ArrayList<Integer> charOffsets;

		public String getOriginalString() {
			return this.originalString;
		}

		public void setOriginalString(String originalString) {
			this.originalString = originalString;
		}

		public StringBuffer getFilteredString() {
			return this.filteredString;
		}

		public void setFilteredString(StringBuffer filteredString) {
			this.filteredString = filteredString;
		}

		public ArrayList<Integer> getCharOffsets() {
			return this.charOffsets;
		}

		public void setCharOffsets(ArrayList<Integer> charOffsets) {
			this.charOffsets = charOffsets;
		}
	}

}