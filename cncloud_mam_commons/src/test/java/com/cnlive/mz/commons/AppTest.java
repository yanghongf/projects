package com.cnlive.mz.commons;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.httpclient.NameValuePair;

import com.cnlive.mz.commons.net.HttpReq;

/**
 * Unit test for simple App.
 */
public class AppTest {

	public static void main(String[] args) {

		Calendar cal = Calendar.getInstance();
		String start = "2015-01-01";
		String end = "2015-12-31";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dEnd = null;
		Date dBegin = null;
		try {
			dBegin = sdf.parse(start);
			dEnd = sdf.parse(end);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<Date> lDate = findDates(dBegin, dEnd);
		for (Date date : lDate) {
			String data = sdf.format(date);
			int number = new Random().nextInt(1000) + 1;
			NameValuePair[] param = { new NameValuePair("ACTIONID", "7"), new NameValuePair("AJAX", "AJAX-TRUE"),
					new NameValuePair("CATALOGID", "1803"), new NameValuePair("txtQueryDate", data),
					new NameValuePair("REPORT_ACTION", "search"), new NameValuePair("TABKEY", "tab1") };
			String url = "http://www.szse.cn/szseWeb/FrontController.szse?randnum=" + number;
			String str = HttpReq.postRequestWidthResult(url, param);
			if (str.contains("没有找到符合条件的数据")) {
				
			}else{
			String part1 = str.substring(str.indexOf("股票总市值（元）"));
			String p = "</td><td  class='cls-data-td'  align='right' >";
			String part2 = part1.substring(part1.indexOf(p) + p.length());
			String part3 = part2.substring(0, part2.indexOf("</td><td"));
			//System.out.println(part1);
			//System.out.println(part2);
			System.out.println(part3+"		"+data);
			}
		}



	}

	public static List<Date> findDates(Date dBegin, Date dEnd) {
		List lDate = new ArrayList();
		lDate.add(dBegin);
		Calendar calBegin = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calBegin.setTime(dBegin);
		Calendar calEnd = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calEnd.setTime(dEnd);
		// 测试此日期是否在指定日期之后
		while (dEnd.after(calBegin.getTime())) {
			// 根据日历的规则，为给定的日历字段添加或减去指定的时间量
			calBegin.add(Calendar.DAY_OF_MONTH, 1);
			lDate.add(calBegin.getTime());
		}
		return lDate;
	}
	
	private void aa() {
		// TODO Auto-generated method stub
String a="http://query.sse.com.cn/marketdata/tradedata/queryTradingByProdTypeData.do?jsonCallBack=jsonpCallback21566&searchDate=2016-03-21&prodType=gp&_=1458638750206";
	}
}
