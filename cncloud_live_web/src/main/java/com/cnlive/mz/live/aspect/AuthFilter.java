package com.cnlive.mz.live.aspect;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.smart4j.framework.core.ConfigHelper;

import com.cnlive.mz.live.common.LiveUtils;

/*
 * 

 属性                                                是否必须                              说明
 asyncSupported        否				 该Filter是否支持异步操作模式
 dispatcherType        否    			 指定Filter对那种dispatcher模式进行过滤 该属性支持 Async,Error Forward,include,request 
 displayName           否				 File 显示的名称
 filterName            是				Filter的名称
 initParams		                 否				Filter的配置参数
 servletNames          否                                  可以指定多个,表示对这几个特定的的serlet 进行过滤
 urlPatterns/value     否 				指定 Filter拦截的 URL




 @WebFilter(filterName="log",urlPatterns={"/*"})*/
@WebFilter(filterName = "AuthFilter", urlPatterns = { "/activity/*", "/channel/*", "/signal/*", "/index/*",
		"/switch/*", "/doswitch/*", "/wowza/*" })
public class AuthFilter implements Filter {

	private FilterConfig config;

	@Override
	public void destroy() {
		this.config = null;
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException,
			ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String requestUrl = request.getRequestURI();
		HttpSession session = request.getSession();
		String webUrl =  ConfigHelper.getString("website.url");
		if (session.getAttribute(LiveUtils.SESSION_KEY_NAME) == null) {
			boolean authEnable = ConfigHelper.getBoolean("auth.enable");
			String loginUrl = ConfigHelper.getString("auth.login.url");
			if (authEnable) {
				//去登录认证
				response.sendRedirect(loginUrl + webUrl+"/login/success");
				return;
			} else {
				String userName = "liujicheng";
				request.getSession().setAttribute(LiveUtils.SESSION_KEY_NAME, userName);
				request.getSession().setAttribute(LiveUtils.SESSION_KEY_ID, 1);
			}
		} else {
			chain.doFilter(arg0, arg1);
		}
		// 验证用户是否是退出，进行sessioin销毁
		if (requestUrl.contains("logout")) {
			String logoutUrl = ConfigHelper.getString("auth.logout.url");
			session.removeAttribute(LiveUtils.SESSION_KEY_NAME);
			session.removeAttribute(LiveUtils.SESSION_KEY_ID);
			session.invalidate();
			response.sendRedirect(logoutUrl);
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}

}
