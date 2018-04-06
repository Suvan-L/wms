package org.suvan.cms.dao;

import org.suvan.common.util.MybatisGeneratorUtil;
import org.suvan.common.util.PropertiesFileUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * cms 代码生成类
 */
public class Generator {

	// 根据命名规范，只修改此常量值即可
	private static String MODULE = "wms-cms";
	private static String DATABASE = "wms";
	private static String TABLE_PREFIX = "cms_";
	private static String PACKAGE_NAME = "org.suvan.cms";
	private static String JDBC_DRIVER = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.driver");
	private static String JDBC_URL = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.url");
	private static String JDBC_USERNAME = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.username");
	private static String JDBC_PASSWORD = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.password");
	// 需要insert后返回主键的表配置，key:表名,value:主键名
	private static Map<String, String> LAST_INSERT_ID_TABLES = new HashMap<>();
	static {

	}

	/**
	 * 自动代码生成
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		MybatisGeneratorUtil.generator(JDBC_DRIVER, JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD, MODULE, DATABASE, TABLE_PREFIX, PACKAGE_NAME, LAST_INSERT_ID_TABLES);
	}

}
