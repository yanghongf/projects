package com.cnlive.mz.live.action;

import org.smart4j.framework.dao.bean.Pager;
import org.smart4j.framework.ioc.annotation.Inject;
import org.smart4j.framework.mvc.annotation.Action;
import org.smart4j.framework.mvc.annotation.Request;
import org.smart4j.framework.mvc.bean.Result;
import org.smart4j.framework.mvc.bean.View;

import com.cnlive.mz.live.entity.TLive;
import com.cnlive.mz.live.entity.TUser;
import com.cnlive.mz.live.service.TUserService;

@Action
public class UserAction {

	@Inject
	private TUserService tUserService;

	/**
	 * 获取用户列表页
	 * 
	 * @param pageNumber
	 * @return
	 */
	@Request.Get("/user/list/{pageNumber}")
	public View getUsers(int pageNumber) {
		Pager<TUser> userPage = tUserService.getTUserPage(pageNumber);
		return new View("user/user_list.jsp").data("userPage", userPage);
	}

	@Request.Get("/user/live/{userId}/{pageNumber}")
	public View getLiveList(int userId, int pageNumber) {
		Pager<TLive> userPage = tUserService.getTLivePage(userId, pageNumber);
		return new View("user/user_live_list.jsp").data("userPage", userPage);
	}

	@Request.Get("/user/report/{userId}/{type}")
	public Result getUserByReport(int userId,int type) {
		return new Result(tUserService.addReport(userId));
	}
}
