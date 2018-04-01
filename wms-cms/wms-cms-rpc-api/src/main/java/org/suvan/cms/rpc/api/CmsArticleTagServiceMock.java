package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsArticleTagMapper;
import org.suvan.cms.dao.model.CmsArticleTag;
import org.suvan.cms.dao.model.CmsArticleTagExample;

/**
* 降级实现CmsArticleTagService接口
* @since suvan modified 2018.04.01
*/
public class CmsArticleTagServiceMock extends BaseServiceMock<CmsArticleTagMapper, CmsArticleTag, CmsArticleTagExample> implements CmsArticleTagService {

}
