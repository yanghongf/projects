package com.cnlive.mz.commons.sensitive;


public class Test { 
	
    public static void main(String args[]){//测试敏感词过滤             
    	String word = "<br/>太多BB弹的伤单红宇感情怀也许只局限于饲养基地针孔摄像头 荧幕中的情节，主人公尝试着去用某种方式渐渐的很潇洒地释自杀怀那些自己经历的伤感。"
				+ "然后法轮功 我们的扮演的角色就是跟随着主人公的喜红客联盟 怒哀乐而卖血过于牵强的把自己的情感也附加于银幕情节中，然后感动就流泪，"
				+ "难过就躺在某一个人的怀里尽情的阐述心扉或者手机卡黑  火 药的配方复制器一个人一杯红酒一部电影在夜三级片 深人静的晚上，关上电话静静的发呆着。";
        FilteredResult res=WordFilterUtil.filterHtml(word, '*'); 
        System.out.println("优先级："+res.getLevel());//检测到的敏感词中最高优先级的值 0为最小  
        System.out.println("过滤后的："+res.getFilteredContent().toString());//过滤后的字符串  
        System.out.println("敏感词列表："+res.getBadWords());//敏感词列表  
        System.out.println("原始字符串："+res.getOriginalContent());//原始字符串  
                              
        String word1 = "北京,3.上海,3.天津,3.";
        String filePath = "D:/SensitiveWord.txt";
        Test t = new Test();
        boolean b = new WordFilterUtil().writerSensitiveWord(word1);
        System.out.println(b);
    }  
  
} 