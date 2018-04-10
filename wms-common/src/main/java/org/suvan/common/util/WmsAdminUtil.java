package org.suvan.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;

/**
 * 启动解压 wmsAdmin-x.x.x.jar 到 resources 目录
 * @since suvan modified 2018.04.01
 */
public class WmsAdminUtil implements InitializingBean, ServletContextAware {

    private static final Logger LOGGER = LoggerFactory.getLogger(WmsAdminUtil.class);

    @Override
    public void afterPropertiesSet() throws Exception {

    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        LOGGER.info("===== 开始解压wms-admin =====");
        String version = PropertiesFileUtil.getInstance("wms-admin-client").get("zheng.admin.version");
        version = "1.0.0";
        LOGGER.info("wms-admin.jar 版本: {}", version);

        String jarPath = servletContext.getRealPath("/WEB-INF/lib/wms-admin-" + version + ".jar");
        jarPath  = "D:\\java\\Maven\\repository\\org\\suvan\\wms-admin\\1.0.0\\web-admin-" + version + ".jar";
        LOGGER.info("wms-admin.jar 包路径: {}", jarPath);

        String resources = servletContext.getRealPath("/") + "/resources/wms-admin";
        LOGGER.info("wms-admin.jar 解压到: {}", resources);


        JarUtil.decompress(jarPath, resources);
        LOGGER.info("===== 解压wms-admin完成 =====");
    }

}
