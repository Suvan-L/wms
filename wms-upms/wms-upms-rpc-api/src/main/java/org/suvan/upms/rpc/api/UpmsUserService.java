package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseService;
import org.suvan.upms.dao.model.UpmsUser;
import org.suvan.upms.dao.model.UpmsUserExample;

/**
* UpmsUserService接口
*/
public interface UpmsUserService extends BaseService<UpmsUser, UpmsUserExample> {

    UpmsUser createUser(UpmsUser upmsUser);

}