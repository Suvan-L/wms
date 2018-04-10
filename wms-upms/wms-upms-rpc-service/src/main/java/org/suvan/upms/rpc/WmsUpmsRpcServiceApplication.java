package org.suvan.upms.rpc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 用户权限管理服务
 *
 * @since suvan modified 2018.04.01
 */
public class WmsUpmsRpcServiceApplication {

	private static final Logger LOGGER = LoggerFactory.getLogger(WmsUpmsRpcServiceApplication.class);

	public static void main(String[] args) {
		LOGGER.info(">>>>> wms-upms-rpc-service 正在启动 <<<<<");
		new ClassPathXmlApplicationContext("classpath:META-INF/spring/*.xml");
		LOGGER.info(">>>>> wms-upms-rpc-service 启动完成 <<<<<");
	}

}