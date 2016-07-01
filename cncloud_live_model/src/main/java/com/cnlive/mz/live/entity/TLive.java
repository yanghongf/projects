/**
 * Project Name:cnlive_live_model
 * File Name:TLive.java
 * Package Name:com.cnlive.mz.live.entity
 * Date:2016年4月25日上午11:20:29
 * Copyright (c) 2016, cnlive.com All Rights Reserved.
 *
 */

package com.cnlive.mz.live.entity;

import java.util.Date;

import org.smart4j.framework.orm.annotation.Entity;

/**
 * TODO: 这里用一句话描述当前类的作用 Date: 2016年4月25日 上午11:20:29 <br/>
 * 
 * @author liujicheng
 * @version V1.0
 * @since JDK 1.6
 */
@Entity
public class TLive {

	private int id;
	private String title;
	private int t_status_id;
	private Date start_time;
	private Date end_time;
	private String description;
	private String playback_url;
	private String uuid;
	private String poster;
	private int t_user_id;
	private String chat_room_id;
	private String live_url;
	private String live_room_id;
	private String custom_args;
	private int direct;
	private String relation_id;
	private String user_uuid;
	private Date check_sort;
	private int check_state;
	private String mark;
	private String create_time;
	
	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public int getCheck_state() {
		return check_state;
	}

	public void setCheck_state(int check_state) {
		this.check_state = check_state;
	}

	public Date getCheck_sort() {
		return check_sort;
	}

	public void setCheck_sort(Date check_sort) {
		this.check_sort = check_sort;
	}

	public int getDirect() {
		return direct;
	}

	public void setDirect(int direct) {
		this.direct = direct;
	}

	public String getUser_uuid() {
		return user_uuid;
	}

	public void setUser_uuid(String user_uuid) {
		this.user_uuid = user_uuid;
	}

	public String getRelation_id() {
		return relation_id;
	}

	public void setRelation_id(String relation_id) {
		this.relation_id = relation_id;
	}

	public String getCustom_args() {
		return custom_args;
	}

	public void setCustom_args(String custom_args) {
		this.custom_args = custom_args;
	}

	public String getLive_room_id() {
		return live_room_id;
	}

	public void setLive_room_id(String live_room_id) {
		this.live_room_id = live_room_id;
	}

	public String getChat_room_id() {
		return chat_room_id;
	}

	public void setChat_room_id(String chat_room_id) {
		this.chat_room_id = chat_room_id;
	}

	public String getLive_url() {
		return live_url;
	}

	public void setLive_url(String live_url) {
		this.live_url = live_url;
	}

	public int getT_user_id() {
		return t_user_id;
	}

	public void setT_user_id(int t_user_id) {
		this.t_user_id = t_user_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getT_status_id() {
		return t_status_id;
	}

	public void setT_status_id(int t_status_id) {
		this.t_status_id = t_status_id;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPlayback_url() {
		return playback_url;
	}

	public void setPlayback_url(String playback_url) {
		this.playback_url = playback_url;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

}
