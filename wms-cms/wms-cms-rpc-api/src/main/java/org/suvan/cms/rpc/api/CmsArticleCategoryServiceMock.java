package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsArticleCategoryMapper;
import org.suvan.cms.dao.model.CmsArticleCategory;
import org.suvan.cms.dao.model.CmsArticleCategoryExample;

/**
* 降级实现CmsArticleCategoryService接口
* @since suvan modified 2018.04.01
*/
public class CmsArticleCategoryServiceMock extends BaseServiceMock<CmsArticleCategoryMapper, CmsArticleCategory, CmsArticleCategoryExample> implements CmsArticleCategoryService {

}
