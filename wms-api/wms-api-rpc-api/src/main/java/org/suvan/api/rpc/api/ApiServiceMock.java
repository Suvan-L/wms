package org.suvan.api.rpc.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 降级实现ApiService接口
 */
public class ApiServiceMock implements ApiService {

    private static final Logger LOGGER = LoggerFactory.getLogger(ApiServiceMock.class);

    @Override
    public String hello(String name) {
        LOGGER.info("ApiServiceMock => hello");
        return null;
    }

}
