package org.suvan.api.rpc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 服务启动类
 */
public class ZhengApiRpcServiceApplication {

    private static final Logger LOGGER = LoggerFactory.getLogger(ZhengApiRpcServiceApplication.class);

    public static void main(String[] args) {
        LOGGER.info(">>>>> wms-api-rpc-service 正在启动 <<<<<");
        new ClassPathXmlApplicationContext("classpath:META-INF/spring/*.xml");
        LOGGER.info(">>>>> wms-api-rpc-service 启动完成 <<<<<");
    }
}
