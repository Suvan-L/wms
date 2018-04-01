package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.upms.dao.mapper.UpmsUserRoleMapper;
import org.suvan.upms.dao.model.UpmsUserRole;
import org.suvan.upms.dao.model.UpmsUserRoleExample;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
* 降级实现UpmsUserRoleService接口
*/
public class UpmsUserRoleServiceMock extends BaseServiceMock<UpmsUserRoleMapper, UpmsUserRole, UpmsUserRoleExample> implements UpmsUserRoleService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UpmsUserRoleServiceMock.class);

    @Override
    public int role(String[] roleIds, int id) {
        LOGGER.info("UpmsUserRoleServiceMock => role");
        return 0;
    }

}
