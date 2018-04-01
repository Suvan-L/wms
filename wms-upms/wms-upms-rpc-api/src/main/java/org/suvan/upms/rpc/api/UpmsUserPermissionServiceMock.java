package org.suvan.upms.rpc.api;

import com.alibaba.fastjson.JSONArray;
import org.suvan.common.base.BaseServiceMock;
import org.suvan.upms.dao.mapper.UpmsUserPermissionMapper;
import org.suvan.upms.dao.model.UpmsUserPermission;
import org.suvan.upms.dao.model.UpmsUserPermissionExample;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
* 降级实现UpmsUserPermissionService接口
*/
public class UpmsUserPermissionServiceMock extends BaseServiceMock<UpmsUserPermissionMapper, UpmsUserPermission, UpmsUserPermissionExample> implements UpmsUserPermissionService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UpmsUserPermissionServiceMock.class);

    @Override
    public int permission(JSONArray datas, int id) {
        LOGGER.info("UpmsUserPermissionServiceMock => permission");
        return 0;
    }

}
