package org.smart4j.plugin.dbcp;

import org.apache.commons.dbcp.BasicDataSource;
import org.smart4j.framework.ds.impl.AbstractDataSourceFactory;

public class DbcpDataSourceFactory extends AbstractDataSourceFactory<BasicDataSource> {
	public BasicDataSource createDataSource() {
		return new BasicDataSource();
	}

	public void setDriver(BasicDataSource ds, String driver) {
		ds.setDriverClassName(driver);
	}

	public void setUrl(BasicDataSource ds, String url) {
		ds.setUrl(url);
	}

	public void setUsername(BasicDataSource ds, String username) {
		ds.setUsername(username);
	}

	public void setPassword(BasicDataSource ds, String password) {
		ds.setPassword(password);
	}

	public void setAdvancedConfig(BasicDataSource ds) {
		// 大于0 ，进行连接空闲时间判断，或为0，对空闲的连接不进行验证
		ds.setMinEvictableIdleTimeMillis(1 * 60 * 1000);
		// 失效检查线程运行时间间隔，如果小于等于0，不会启动检查线程
		ds.setTimeBetweenEvictionRunsMillis(5 * 60 * 1000);
		ds.setMaxIdle(1800);
		//  连接池启动时的初始值 
		ds.setInitialSize(10);
		// 连接池的最大值 
		ds.setMaxActive(100);
		//  最大空闲值.当经过一个高峰时间后，连接池可以慢慢将已经用不到的连接慢慢释放一部分，一直减少到maxIdle为止 -->
		ds.setMaxIdle(50);
		//  最小空闲值.当空闲的连接数少于阀值时，连接池就会预申请去一些连接，以免洪峰来时来不及申请 
		ds.setMinIdle(5);
		//       <!--#给出一条简单的sql语句进行验证-->
		ds.setValidationQuery("select NOW()");
		// <!--#在取出连接时进行有效验证-->
		ds.setTestOnBorrow(false);
		ds.setTestWhileIdle(true);
		ds.setLogAbandoned(true);
		ds.setRemoveAbandoned(true);
		ds.setRemoveAbandonedTimeout(120);
		// #运行'判断连接超时任务'的时间间隔，单位为毫秒，默认为-1，即不执行任务。 -->
		ds.setTimeBetweenEvictionRunsMillis(1800000);
		// 连接的超时时间，默认为半小时。 -->
		ds.setMinEvictableIdleTimeMillis(1800000);
	}
}