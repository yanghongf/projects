package com.cnlive.mz.commons;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.commons.io.FileUtils;

/**
 * 复制对象属性，并支持扩展类型转换
 *
 * @author 闫帆
 */
public class BeanUtils {
	private static Map<String, Method> methodMap = new HashMap<String, Method>();

	static {
		Method methods[] = BeanUtils.class.getMethods();
		for (Method method : methods) {
			methodMap.put(method.getName(), method);
		}
	}

	/**
	 * 类似BeanUtisl.copyProperties复制对象 不同之处可以对同名但不同类型的属性赋值 可以配置类型转换方法
	 * eg：String赋值给Date 需要编写StringToDate方法
	 *
	 * @param target
	 *            目标对象
	 * @param source
	 *            源对象
	 * @throws Exception
	 */
	public static void copyProperties(Object source, Object target) {
		copyProperties(source, target, true);
	}

	/**
	 * 类似BeanUtisl.copyProperties复制对象 不同之处可以对同名但不同类型的属性赋值 可以配置类型转换方法
	 * eg：String赋值给Date 需要编写StringToDate方法
	 *
	 * @param target
	 *            目标对象
	 * @param source
	 *            源对象
	 * @param nullBeCopied
	 *            字段为null的是否复制
	 * @throws Exception
	 */
	public static void copyProperties(Object source, Object target, Boolean nullBeCopied) {
		copyProperties(source, target, null, null, nullBeCopied);
	}

	/**
	 * 指定目标对象中需要复制的属性 支持属性间类型转换 配置类型转换方法 eg：String赋值给Date 需要编写StringToDate方法
	 *
	 * @param target
	 *            目标对象
	 * @param source
	 *            源对象
	 * @param effectiveProperties
	 *            需要复制的属性列表
	 * @throws Exception
	 */
	public static void copyProperties(Object source, Object target, String[] effectiveProperties) {
		copyProperties(source, target, effectiveProperties, null, true);
	}

	/**
	 * 指定目标对象需要复制的有效属性和无效属性 支持属性间类型转换 配置类型转换方法 eg：String赋值给Date
	 * 需要编写StringToDate方法
	 *
	 * @param target
	 *            目标对象
	 * @param source
	 *            源对象
	 * @param effectiveProperties
	 *            需要复制的属性列表
	 * @param ignoreProperties
	 *            不需要复制的属性列表
	 * @param nullBeCopied
	 *            字段为null是否复制
	 * @throws Exception
	 */
	public static void copyProperties(Object source, Object target, String[] effectiveProperties,
			String[] ignoreProperties, Boolean nullBeCopied) {
		// Field targetFields[] = destCls.getDeclaredFields();
		// 得到自省对象
		BeanInfo beanInfo = null;
		try {
			beanInfo = Introspector.getBeanInfo(source.getClass());
		} catch (IntrospectionException e) {
			e.printStackTrace();
		}
		// 得到key为属性名，value为属性对应的PropertyDescriptor的HashMap
		PropertyDescriptor sourcePds[] = beanInfo.getPropertyDescriptors();
		Map<String, PropertyDescriptor> sourcePdMap = new HashMap<String, PropertyDescriptor>();
		for (PropertyDescriptor sourcePd : sourcePds) {
			sourcePdMap.put(sourcePd.getName(), sourcePd);
		}

		List<String> effectiveList = (null == effectiveProperties) ? null : Arrays.asList(effectiveProperties);
		List<String> ignoreList = (null == ignoreProperties) ? null : Arrays.asList(ignoreProperties);
		try {
			PropertyDescriptor targetPds[] = Introspector.getBeanInfo(target.getClass()).getPropertyDescriptors();
			// 遍历目标对象的所有属性
			for (PropertyDescriptor targetPd : targetPds) {
				PropertyDescriptor sourcePd = getPropertyDescriptor(sourcePdMap, targetPd.getName());
				if (null != targetPd.getWriteMethod() && null != sourcePd
						&& (null == effectiveList || effectiveList.contains(targetPd.getName()))
						&& (null == ignoreList || !ignoreList.contains(targetPd.getName()))) {
					Method readMethod = sourcePd.getReadMethod();
					if (null == readMethod) {
						continue;
					}
					Object value = readMethod.invoke(source, null);
					// 当需要验证并且源对象字段为空时跳过
					if (nullBeCopied == false && null == value) {
						continue;
					}
					Method writeMethod = targetPd.getWriteMethod();
					// 如果目标对象和源对象类型相同时直接赋值
					if (sourcePd.getPropertyType().isAssignableFrom(targetPd.getPropertyType())) {
						writeMethod.invoke(target, value);
					} else { // 如果目标对象和源对象类型相不同时，调用类型转换方法
						String converMethod = getMethodRuleName(sourcePd.getPropertyType().getName(), targetPd
								.getPropertyType().getName());
						if (hasConvertMethod(converMethod)) {
							// 调用已注册的类型转换方法
							value = getConvertMethod(converMethod).invoke(new BeanUtils(), new Object[] { value });
							writeMethod.invoke(target, value);
						}
					}
				}
			}
		} catch (Exception e) {
			System.err.println("复制对象错误");
			e.printStackTrace();
		}
	}

	private static String getMethodRuleName(String sourceTypeName, String targetTypeName) {
		return sourceTypeName.substring(sourceTypeName.lastIndexOf(".") + 1, sourceTypeName.length()) + "To"
				+ targetTypeName.substring(targetTypeName.lastIndexOf(".") + 1, targetTypeName.length());
	}

	private static boolean hasConvertMethod(String methodName) {
		return methodMap.containsKey(methodName);
	}

	private static Method getConvertMethod(String methodName) {
		return methodMap.get(methodName);
	}

	private static PropertyDescriptor getPropertyDescriptor(Map<String, PropertyDescriptor> pdMap, String propertyName) {
		if (pdMap.containsKey(propertyName)) {
			return pdMap.get(propertyName);
		}
		return null;
	}

	/**
	 * 将所有空字符串的属性设为null
	 *
	 * @param object
	 */
	public static void setEntryToNull(Object object) {
		BeanInfo beanInfo = null;
		try {
			beanInfo = Introspector.getBeanInfo(object.getClass());
		} catch (IntrospectionException e) {
			e.printStackTrace();
		}
		PropertyDescriptor objectPds[] = beanInfo.getPropertyDescriptors();
		Object nullObj[] = new Object[1];
		nullObj[0] = null;
		for (PropertyDescriptor objectPd : objectPds) {
			if (objectPd.getPropertyType().isAssignableFrom(String.class) && null != objectPd.getWriteMethod()) {
				try {
					String value = (String) objectPd.getReadMethod().invoke(object, null);
					if ("".equals(value)) {
						objectPd.getWriteMethod().invoke(object, nullObj);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static String IntegerToString(Object obj) {
		return String.valueOf(obj);
	}

	public static String TimestampToString(Timestamp time) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(time);
	}

	//
	// public static Date StringToDate(String obj) {
	// DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	// if(StringUtils.isEmpty(obj)){
	// return null;
	// }
	// try {
	// return format.parse(obj);
	// } catch (ParseException e) {
	//
	// System.err.println(obj+"转换格式错误！");
	// e.printStackTrace();
	// return null;
	// }
	// }

	public static String DateToString(Object obj) {
		return obj.toString();
	}

	public static Date StringToTimestamp(String obj) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return Timestamp.valueOf(obj);
	}

	/**
	 * 返回某类的所有方法集合 key = 大写的方法名 vale = 方法
	 *
	 * @param aClass
	 *            class对象
	 */
	public static Map<String, Method> getMethodMap(Class aClass) {
		Map methodMap = new HashMap();
		Method[] methods = aClass.getDeclaredMethods();
		for (int i = 0; i < methods.length; i++) {
			methodMap.put(methods[i].getName(), methods[i]);
		}
		return methodMap;
	}

}
