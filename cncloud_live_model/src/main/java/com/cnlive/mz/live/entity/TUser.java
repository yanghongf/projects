package com.cnlive.mz.live.entity;

import java.util.Date;

import org.smart4j.framework.orm.annotation.Entity;

@Entity
public class TUser {
	private int id;
	private String name;
	private int is_admin;
	private String t_channel_ids;
	private String t_signal_ids;
	private Date create_time;
	private int reported_count;

	public int getReported_count() {
		return reported_count;
	}

	public void setReported_count(int reported_count) {
		this.reported_count = reported_count;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(int is_admin) {
		this.is_admin = is_admin;
	}

	public String getT_channel_ids() {
		return t_channel_ids;
	}

	public void setT_channel_ids(String t_channel_ids) {
		this.t_channel_ids = t_channel_ids;
	}

	public String getT_signal_ids() {
		return t_signal_ids;
	}

	public void setT_signal_ids(String t_signal_ids) {
		this.t_signal_ids = t_signal_ids;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
}
