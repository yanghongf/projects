package org.smart4j.framework.orm;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.smart4j.framework.FrameworkConstant;
import org.smart4j.framework.dao.DatabaseHelper;
import org.smart4j.framework.dao.SqlHelper;
import org.smart4j.framework.orm.bean.Condition;
import org.smart4j.framework.util.ArrayUtil;
import org.smart4j.framework.util.MapUtil;
import org.smart4j.framework.util.ObjectUtil;

/**
 * 提供与实体相关的数据库操作
 *
 * @author huangyong
 * @since 1.0
 */
public class DataSet {

	/**
	 * 查询单条数据，并转为相应类型的实体
	 */
	public static <T> T select(Class<T> entityClass, String condition, Object... params) {
		String sql = SqlHelper.generateSelectSql(entityClass, condition, "");
		return DatabaseHelper.queryEntity(entityClass, sql, params);
	}

	/**
	 * 查询多条数据，并转为相应类型的实体列表
	 */
	public static <T> List<T> selectList(Class<T> entityClass) {
		return selectListWithConditionAndSort(entityClass, "", "");
	}

	/**
	 * 查询多条数据，并转为相应类型的实体列表（带有查询条件与查询参数）
	 */
	public static <T> List<T> selectListWithCondition(Class<T> entityClass, String condition, Object... params) {
		return selectListWithConditionAndSort(entityClass, condition, "", params);
	}

	/**
	 * 查询多条数据，并转为相应类型的实体列表（带有排序方式）
	 */
	public static <T> List<T> selectListWithSort(Class<T> entityClass, String sort) {
		return selectListWithConditionAndSort(entityClass, "", sort);
	}

	/**
	 * 查询多条数据，并转为相应类型的实体列表（带有查询条件、排序方式与查询参数）
	 */
	public static <T> List<T> selectListWithConditionAndSort(Class<T> entityClass, String condition, String sort,
			Object... params) {
		String sql = SqlHelper.generateSelectSql(entityClass, condition, sort);
		return DatabaseHelper.queryEntityList(entityClass, sql, params);
	}

	/**
	 * 查询数据条数
	 */
	public static long selectCount(Class<?> entityClass, String condition, Object... params) {
		String sql = SqlHelper.generateSelectSqlForCount(entityClass, condition);
		return DatabaseHelper.queryCount(sql, params);
	}

	/**
	 * @param sql
	 * @param params
	 * @return
	 */
	public static List<Map<String, Object>> selectMapWithSql(String sql, Object... params) {
		return DatabaseHelper.queryMapList(sql, params);
	}

	/**
	 * 适合于搜索查询 统计数
	 * 
	 * @param entityClass
	 * @param conditions
	 * @return
	 */
	public static long selectCount(Class<?> entityClass, List<Condition> conditions) {
		String conditionSql = "";
		List<String> list = new ArrayList<String>();
		// 移除值为空的条件
		List<Condition> cons = new ArrayList<Condition>();
		for (int i = 0; i < conditions.size(); i++) {
			Condition con = conditions.get(i);
			String value = con.getValue();
			if (StringUtils.isNotEmpty(value) && StringUtils.isNotEmpty(value.replace("%", ""))) {
				cons.add(con);
			}
		}
		for (int i = 0; i < cons.size(); i++) {
			Condition con = cons.get(i);
			String condition = con.getCondition();
			String operator = con.getOperator();
			String value = con.getValue();
			if (i == cons.size() - 1) {
				conditionSql += condition;
			} else {
				conditionSql += condition + " " + operator + " ";
			}
			list.add(value);
		}
		String sql = SqlHelper.generateSelectSqlForCount(entityClass, conditionSql);
		return DatabaseHelper.queryCount(sql, list.toArray());
	}

	/**
	 * 适合于搜索查询
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @param entityClass
	 * @param conditions
	 * @param sort
	 * @return
	 */
	public static <T> List<T> selectListForPager(int pageNumber, int pageSize, Class<T> entityClass,
			List<Condition> conditions, String sort) {
		String conditionSql = "";
		// 移除值为空的条件
		List<Condition> cons = new ArrayList<Condition>();
		for (int i = 0; i < conditions.size(); i++) {
			Condition con = conditions.get(i);
			String value = con.getValue();
			if (StringUtils.isNotEmpty(value) && StringUtils.isNotEmpty(value.replace("%", ""))) {
				cons.add(con);
			}
		}

		List<String> list = new ArrayList<String>();
		for (int i = 0; i < cons.size(); i++) {
			Condition con = cons.get(i);
			String condition = con.getCondition();
			String operator = con.getOperator();
			String value = con.getValue();
			if (i == cons.size() - 1) {
				conditionSql += condition;
			} else {
				conditionSql += condition + " " + operator + " ";
			}
			list.add(value);
		}
		String sql = SqlHelper.generateSelectSqlForPager(pageNumber, pageSize, entityClass, conditionSql, sort);
		return DatabaseHelper.queryEntityList(entityClass, sql, list.toArray());
	}

	/**
	 * 查询多条数据，并转为列表（分页方式）
	 */
	public static <T> List<T> selectListForPager(int pageNumber, int pageSize, Class<T> entityClass, String condition,
			String sort, Object... params) {
		String sql = SqlHelper.generateSelectSqlForPager(pageNumber, pageSize, entityClass, condition, sort);
		return DatabaseHelper.queryEntityList(entityClass, sql, params);
	}

	/**
	 * 查询多条数据，并转为映射
	 */
	public static <T> Map<Long, T> selectMap(Class<T> entityClass) {
		return selectMapWithPK(entityClass, FrameworkConstant.PK_NAME, "", "");
	}

	/**
	 * 查询多条数据，并转为映射（带有查询条件与查询参数）
	 */
	public static <T> Map<Long, T> selectMapWithCondition(Class<T> entityClass, String condition, Object... params) {
		return selectMapWithPK(entityClass, FrameworkConstant.PK_NAME, condition, "", params);
	}

	/**
	 * 查询多条数据，并转为映射（带有排序方式与查询参数）
	 *
	 * @since 2.3.3
	 */
	public static <T> Map<Long, T> selectMapWithSort(Class<T> entityClass, String sort) {
		return selectMapWithPK(entityClass, FrameworkConstant.PK_NAME, "", sort);
	}

	/**
	 * 查询多条数据，并转为映射（带有查询条件、排序方式与查询参数）
	 */
	public static <T> Map<Long, T> selectMapWithConditionAndSort(Class<T> entityClass, String condition, String sort,
			Object... params) {
		return selectMapWithPK(entityClass, FrameworkConstant.PK_NAME, condition, sort, params);
	}

	/**
	 * 查询多条数据，并转为映射（带有主键名）
	 */
	@SuppressWarnings("unchecked")
	public static <PK, T> Map<PK, T> selectMapWithPK(Class<T> entityClass, String pkName, String condition,
			String sort, Object... params) {
		Map<PK, T> map = new LinkedHashMap<PK, T>();
		List<T> list = selectListWithConditionAndSort(entityClass, condition, sort, params);
		for (T obj : list) {
			PK pk = (PK) ObjectUtil.getFieldValue(obj, pkName);
			map.put(pk, obj);
		}
		return map;
	}

	/**
	 * 根据列名查询单条数据，并转为相应类型的实体
	 */
	public static <T> T selectColumn(Class<?> entityClass, String columnName, String condition, Object... params) {
		String sql = SqlHelper.generateSelectSql(entityClass, condition, "");
		sql = sql.replace("*", columnName);
		return DatabaseHelper.queryColumn(sql, params);
	}

	/**
	 * 根据列名查询多条数据，并转为相应类型的实体列表
	 */
	public static <T> List<T> selectColumnList(Class<?> entityClass, String columnName, String condition, String sort,
			Object... params) {
		String sql = SqlHelper.generateSelectSql(entityClass, condition, sort);
		sql = sql.replace("*", columnName);
		return DatabaseHelper.queryColumnList(sql, params);
	}

	/**
	 * 插入一条数据
	 */
	public static boolean insert(Class<?> entityClass, Map<String, Object> fieldMap) {
		if (MapUtil.isEmpty(fieldMap)) {
			return true;
		}
		String sql = SqlHelper.generateInsertSql(entityClass, fieldMap.keySet());
		int rows = DatabaseHelper.update(sql, fieldMap.values().toArray());
		return rows > 0;
	}

	/**
	 * 插入一条数据
	 */
	public static Serializable insertForKeys(Class<?> entityClass, Map<String, Object> fieldMap) {
		if (MapUtil.isEmpty(fieldMap)) {
			return -1;
		}
		String sql = SqlHelper.generateInsertSql(entityClass, fieldMap.keySet());
		return DatabaseHelper.insertReturnPK(sql, fieldMap.values().toArray());
	}

	/**
	 * 插入一个实体
	 */
	public static boolean insert(Object entity) {
		if (entity == null) {
			throw new IllegalArgumentException();
		}
		Class<?> entityClass = entity.getClass();
		Map<String, Object> fieldMap = ObjectUtil.getFieldMap(entity);
		return insert(entityClass, fieldMap);
	}

	public static Serializable insertForKeys(Object entity) {
		if (entity == null) {
			throw new IllegalArgumentException();
		}
		Class<?> entityClass = entity.getClass();
		Map<String, Object> fieldMap = ObjectUtil.getFieldMap(entity);
		return insertForKeys(entityClass, fieldMap);
	}

	/**
	 * 更新相关数据
	 */
	public static boolean update(Class<?> entityClass, Map<String, Object> fieldMap, String condition, Object... params) {
		if (MapUtil.isEmpty(fieldMap)) {
			return true;
		}
		String sql = SqlHelper.generateUpdateSql(entityClass, fieldMap, condition);
		int rows = DatabaseHelper.update(sql, ArrayUtil.concat(fieldMap.values().toArray(), params));
		return rows > 0;
	}

	/**
	 * 更新一个实体
	 */
	public static boolean update(Object entity) {
		return update(entity, FrameworkConstant.PK_NAME);
	}

	/**
	 * 更新一个实体（带有主键名）
	 */
	public static boolean update(Object entityObject, String pkName) {
		if (entityObject == null) {
			throw new IllegalArgumentException();
		}
		Class<?> entityClass = entityObject.getClass();
		Map<String, Object> fieldMap = ObjectUtil.getFieldMap(entityObject);
		String condition = pkName + " = ?";
		Object[] params = { ObjectUtil.getFieldValue(entityObject, pkName) };
		return update(entityClass, fieldMap, condition, params);
	}

	/**
	 * 删除相关数据
	 */
	public static boolean delete(Class<?> entityClass, String condition, Object... params) {
		String sql = SqlHelper.generateDeleteSql(entityClass, condition);
		int rows = DatabaseHelper.update(sql, params);
		return rows > 0;
	}

	/**
	 * 删除一个实体
	 */
	public static boolean delete(Object entityObject) {
		return delete(entityObject, FrameworkConstant.PK_NAME);
	}

	/**
	 * 删除一个实体（可指定主键名）
	 */
	public static boolean delete(Object entityObject, String pkName) {
		if (entityObject == null) {
			throw new IllegalArgumentException();
		}
		Class<?> entityClass = entityObject.getClass();
		String condition = pkName + " = ?";
		Object[] params = { ObjectUtil.getFieldValue(entityObject, pkName) };
		return delete(entityClass, condition, params);
	}
}
