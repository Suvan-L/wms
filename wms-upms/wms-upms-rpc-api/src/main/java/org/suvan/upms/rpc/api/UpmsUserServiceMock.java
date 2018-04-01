package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.upms.dao.mapper.UpmsUserMapper;
import org.suvan.upms.dao.model.UpmsUser;
import org.suvan.upms.dao.model.UpmsUserExample;

/**
* 降级实现UpmsUserService接口
*/
public class UpmsUserServiceMock extends BaseServiceMock<UpmsUserMapper, UpmsUser, UpmsUserExample> implements UpmsUserService {

    @Override
    public UpmsUser createUser(UpmsUser upmsUser) {
        return null;
    }

}
