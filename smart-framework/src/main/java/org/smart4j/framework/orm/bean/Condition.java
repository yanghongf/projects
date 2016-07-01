/**
 * Project Name:smart-framework
 * File Name:Condition.java
 * Package Name:org.smart4j.framework.orm.bean
 * Date:2016年3月8日下午9:51:05
 * Copyright (c) 2016, cnlive.com All Rights Reserved.
 *
 */

package org.smart4j.framework.orm.bean;

/**
 * TODO: 这里用一句话描述当前类的作用 Date: 2016年3月8日 下午9:51:05 <br/>
 * 
 * @author liujicheng
 * @version V1.0
 * @since JDK 1.6
 */
public class Condition {
	//name=?
	private String condition;
	//and
	private String operator;
	//liujicheng
	private String value;

	public Condition(String condition, String value, String operator) {
		this.condition = condition;
		this.value = value;
		this.operator = operator;

	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
