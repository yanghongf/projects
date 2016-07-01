package com.cnlive.mz.live.action;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.smart4j.plugin.job.JobHelper;

import com.cnlive.mz.live.service.impl.Job;

public class Init extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 初始化
		JobHelper.startJob(Job.class, "0/30 * * * * ?");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
