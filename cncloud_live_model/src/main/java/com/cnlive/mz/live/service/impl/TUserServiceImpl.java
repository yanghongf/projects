/**
 * Project Name:cnlive_live_model
 * File Name:TUserServiceImpl.java
 * Package Name:com.cnlive.mz.live.service.impl
 * Date:2015年8月6日下午4:08:25
 * Copyright (c) 2015, cnlive.com All Rights Reserved.
 *
 */

package com.cnlive.mz.live.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.smart4j.framework.core.ConfigHelper;
import org.smart4j.framework.dao.bean.Pager;
import org.smart4j.framework.orm.DataSet;
import org.smart4j.framework.tx.annotation.Service;

import com.cnlive.mz.commons.net.HttpReq;
import com.cnlive.mz.live.entity.TLive;
import com.cnlive.mz.live.entity.TUser;
import com.cnlive.mz.live.service.TUserService;

/**
 * TODO: 获取用户信息 Date: 2015年8月6日 下午4:08:25 <br/>
 * 
 * @author liujicheng
 * @version V1.0
 * @since JDK 1.6
 */
@Service
public class TUserServiceImpl implements TUserService {

	public TUser login(String userName) {
		String url = ConfigHelper.getString("auth.userinfo.url") + userName;
		String rs = HttpReq.getRequestWidthResult(url);
		JSONObject rsJSON = JSONObject.fromObject(rs);
		if (rsJSON.get("name") != null) {
			String name = (String) rsJSON.get("name");
			TUser tUser = this.getTUserByName(name);
			if (tUser == null) {
				return null;
			} else {
				return tUser;
			}
		} else {
			return null;
		}
	}

	@Override
	public TUser getTUserById(int id) {
		return DataSet.select(TUser.class, "id=?", id);
	}
	
	public void save(TUser tUser){
		DataSet.insert(tUser);
	}

	@Override
	public TUser getTUserByName(String name) {
		return DataSet.select(TUser.class, "name=?", name);
	}

	@Override
	public TUser getUserByAccessKey(String user_access_key) {
		return DataSet.select(TUser.class, "user_access_key=?", user_access_key);
	}

	@Override
	public Pager<TUser> getTUserPage(int pageNumber) {
		int pageSize = 10;
		String conditions = "id > ?";
		String sort = "reported_count desc";
		Object[] params = { 0 };
		long count = DataSet.selectCount(TUser.class, conditions, params);
		List<TUser> userList = DataSet.selectListForPager(pageNumber, pageSize, TUser.class, conditions, sort, params);
		return new Pager<TUser>(pageNumber, pageSize, count, userList);
	}

	public Pager<TLive> getTLivePage(int userId, int pageNumber) {
		int pageSize = 2;
		String conditions = "t_user_id = ?";
		String sort = "id desc";
		Object[] params = { userId };
		long count = DataSet.selectCount(TLive.class, conditions, params);
		List<TLive> liveList = DataSet.selectListForPager(pageNumber, pageSize, TLive.class, conditions, sort, params);
		return new Pager<TLive>(pageNumber, pageSize, count, liveList);
	}

	public boolean addReport(int id) {
		TUser user = this.getTUserById(id);
		user.setReported_count(user.getReported_count() + 1);
		return DataSet.update(user);
	}
}
