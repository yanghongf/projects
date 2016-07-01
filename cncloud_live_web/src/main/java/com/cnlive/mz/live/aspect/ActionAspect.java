package com.cnlive.mz.live.aspect;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.smart4j.framework.aop.AspectProxy;
import org.smart4j.framework.aop.annotation.Aspect;
import org.smart4j.framework.mvc.DataContext;
import org.smart4j.framework.mvc.annotation.Action;

@Aspect(annotation = Action.class)
public class ActionAspect extends AspectProxy {


    @Override
    public void before(Class<?> cls, Method method, Object[] params) throws Throwable {
        String ip=this.getRemoteUserIp(DataContext.getRequest());
         System.out.println("ip:"+ip);
    }

    @Override
    public void after(Class<?> cls, Method method, Object[] params, Object result) throws Throwable {
    }
    
    private String getRemoteUserIp(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip.contains(",")) {
			ip = ip.split(",")[0];
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "127.0.0.1";
		}
		return ip;
	}
}
