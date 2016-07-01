package com.cnlive.mz.live.service;

import org.smart4j.framework.dao.bean.Pager;

import com.cnlive.mz.live.entity.TLive;
import com.cnlive.mz.live.entity.TUser;

public interface TUserService {
	public void save(TUser tUser);
	
	public TUser getTUserById(int id);

	public TUser getTUserByName(String name);

	public TUser login(String userName);

	public TUser getUserByAccessKey(String user_access_key);

	public Pager<TUser> getTUserPage(int pageNumber);

	public Pager<TLive> getTLivePage(int userId, int pageNumber);

	public boolean addReport(int id);
}
