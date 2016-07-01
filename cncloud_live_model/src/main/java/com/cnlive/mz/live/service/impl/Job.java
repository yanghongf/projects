package com.cnlive.mz.live.service.impl;

import org.smart4j.framework.ioc.annotation.Bean;
import org.smart4j.framework.ioc.annotation.Inject;
import org.smart4j.plugin.job.BaseJob;

import com.cnlive.mz.live.service.JobService;

@Bean
public class Job extends BaseJob {
	@Inject
	private JobService jobService;

	@Override
	public void execute() {
		  jobService.start();
	}

	public void check() {
		System.out.println("check server status");
	}
}
