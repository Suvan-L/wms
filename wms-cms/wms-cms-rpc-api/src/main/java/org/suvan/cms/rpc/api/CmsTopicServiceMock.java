package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsTopicMapper;
import org.suvan.cms.dao.model.CmsTopic;
import org.suvan.cms.dao.model.CmsTopicExample;

/**
* 降级实现CmsTopicService接口
* @since suvan modified 2018.04.01
*/
public class CmsTopicServiceMock extends BaseServiceMock<CmsTopicMapper, CmsTopic, CmsTopicExample> implements CmsTopicService {

}
