package com.cnlive.mz.live.service.impl;

import java.util.List;

import org.smart4j.framework.orm.DataSet;
import org.smart4j.framework.tx.annotation.Service;

import com.cnlive.mz.live.entity.TLive;
import com.cnlive.mz.live.service.JobService;

@Service
public class JobServiceImpl implements JobService {

	@Override
	public void start() {
		List list = DataSet.selectList(TLive.class);
		System.out.println(list.size());
	}

	public void test() {

	}
}
