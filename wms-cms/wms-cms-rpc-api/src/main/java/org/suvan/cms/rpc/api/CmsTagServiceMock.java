package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsTagMapper;
import org.suvan.cms.dao.model.CmsTag;
import org.suvan.cms.dao.model.CmsTagExample;

/**
* 降级实现CmsTagService接口
* @since suvan modified 2018.04.01
*/
public class CmsTagServiceMock extends BaseServiceMock<CmsTagMapper, CmsTag, CmsTagExample> implements CmsTagService {

}
