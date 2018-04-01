package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.upms.dao.mapper.UpmsRoleMapper;
import org.suvan.upms.dao.model.UpmsRole;
import org.suvan.upms.dao.model.UpmsRoleExample;

/**
* 降级实现UpmsRoleService接口
*/
public class UpmsRoleServiceMock extends BaseServiceMock<UpmsRoleMapper, UpmsRole, UpmsRoleExample> implements UpmsRoleService {

}
