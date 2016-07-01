/**
 * Project Name:smart-framework
 * File Name:ApiBean.java
 * Package Name:org.smart4j.framework.mvc.bean
 * Date:2016年5月24日上午9:17:36
 * Copyright (c) 2016, cnlive.com All Rights Reserved.
 *
 */

package org.smart4j.framework.mvc.bean;

import org.smart4j.framework.core.bean.BaseBean;

/**
 * TODO: 这里用一句话描述当前类的作用 Date: 2016年5月24日 上午9:17:36 <br/>
 * 
 * @author liujicheng
 * @version V1.0
 * @since JDK 1.6
 */
public class ApiBean extends BaseBean {
	private String message;
	private Object data;
	private int code;
	private int next_cursor;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

}
