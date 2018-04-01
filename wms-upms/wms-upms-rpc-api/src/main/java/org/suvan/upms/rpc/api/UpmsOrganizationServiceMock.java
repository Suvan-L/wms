package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.upms.dao.mapper.UpmsOrganizationMapper;
import org.suvan.upms.dao.model.UpmsOrganization;
import org.suvan.upms.dao.model.UpmsOrganizationExample;

/**
* 降级实现UpmsOrganizationService接口
*/
public class UpmsOrganizationServiceMock extends BaseServiceMock<UpmsOrganizationMapper, UpmsOrganization, UpmsOrganizationExample> implements UpmsOrganizationService {

}
