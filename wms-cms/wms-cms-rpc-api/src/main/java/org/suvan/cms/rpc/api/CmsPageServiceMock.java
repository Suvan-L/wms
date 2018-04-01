package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsPageMapper;
import org.suvan.cms.dao.model.CmsPage;
import org.suvan.cms.dao.model.CmsPageExample;

/**
* 降级实现CmsPageService接口
* @since suvan modified 2018.04.01
*/
public class CmsPageServiceMock extends BaseServiceMock<CmsPageMapper, CmsPage, CmsPageExample> implements CmsPageService {

}
