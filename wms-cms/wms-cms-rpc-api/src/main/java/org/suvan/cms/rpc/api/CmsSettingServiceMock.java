package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsSettingMapper;
import org.suvan.cms.dao.model.CmsSetting;
import org.suvan.cms.dao.model.CmsSettingExample;

/**
* 降级实现CmsSettingService接口
* @since suvan modified 2018.04.01
*/
public class CmsSettingServiceMock extends BaseServiceMock<CmsSettingMapper, CmsSetting, CmsSettingExample> implements CmsSettingService {

}
