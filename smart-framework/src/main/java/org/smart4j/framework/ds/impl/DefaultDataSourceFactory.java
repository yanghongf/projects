package org.smart4j.framework.ds.impl;

import org.apache.commons.dbcp.BasicDataSource;

/**
 * 默认数据源工厂 <br/>
 * 基于 Apache Commons DBCP 实现
 *
 * @author huangyong
 * @since 2.3
 */
public class DefaultDataSourceFactory extends AbstractDataSourceFactory<BasicDataSource> {

	@Override
	public BasicDataSource createDataSource() {
		return new BasicDataSource();
	}

	@Override
	public void setDriver(BasicDataSource ds, String driver) {
		ds.setDriverClassName(driver);
	}

	@Override
	public void setUrl(BasicDataSource ds, String url) {
		ds.setUrl(url);
	}

	@Override
	public void setUsername(BasicDataSource ds, String username) {
		ds.setUsername(username);
	}

	@Override
	public void setPassword(BasicDataSource ds, String password) {
		ds.setPassword(password);
	}

	@Override
	public void setAdvancedConfig(BasicDataSource ds) {
		// 解决 java.sql.SQLException: Already closed. 的问题（连接池会自动关闭长时间没有使用的连接）
		// 用于检查connection的sql语句.
		ds.setValidationQuery("select 1 from dual");
		// ds.setTestOnBorrow(true);
		/**
		 * :启动connection校验定时器,定时器运行时间间隔就是<br>
		 * 这里设定为1小时,只要小于mysql的wait_timeout就可以了
		 */
		ds.setTimeBetweenEvictionRunsMillis(3600000);
		// 表示检查idle的connection,false为不检查
		ds.setTestWhileIdle(true);
	}
}
