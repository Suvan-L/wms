package org.suvan.cms.rpc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 仓库库存管理服务启动类
 * @since suvan modified 2018.04.01
 */
public class WmsCmsRpcServiceApplication {

	private static final Logger LOGGER = LoggerFactory.getLogger(WmsCmsRpcServiceApplication.class);

	public static void main(String[] args) {
		LOGGER.info(">>>>> wms-cms-rpc-service 正在启动 <<<<<");
		new ClassPathXmlApplicationContext("classpath:META-INF/spring/*.xml");
		LOGGER.info(">>>>> wms-cms-rpc-service 启动完成 <<<<<");
	}

}
