package org.suvan.upms.rpc.api;

import com.alibaba.fastjson.JSONArray;
import org.suvan.common.base.BaseServiceMock;
import org.suvan.upms.dao.mapper.UpmsPermissionMapper;
import org.suvan.upms.dao.model.UpmsPermission;
import org.suvan.upms.dao.model.UpmsPermissionExample;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
* 降级实现UpmsPermissionService接口
*/
public class UpmsPermissionServiceMock extends BaseServiceMock<UpmsPermissionMapper, UpmsPermission, UpmsPermissionExample> implements UpmsPermissionService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UpmsPermissionServiceMock.class);

    @Override
    public JSONArray getTreeByRoleId(Integer roleId) {
        LOGGER.info("UpmsPermissionServiceMock => getTreeByRoleId");
        return null;
    }

    @Override
    public JSONArray getTreeByUserId(Integer usereId, Byte type) {
        LOGGER.info("UpmsPermissionServiceMock => getTreeByUserId");
        return null;
    }

}
