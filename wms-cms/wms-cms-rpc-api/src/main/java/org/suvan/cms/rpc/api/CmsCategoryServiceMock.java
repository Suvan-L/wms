package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsCategoryMapper;
import org.suvan.cms.dao.model.CmsCategory;
import org.suvan.cms.dao.model.CmsCategoryExample;

/**
* 降级实现CmsCategoryService接口
* @since suvan modified 2018.04.01
*/
public class CmsCategoryServiceMock extends BaseServiceMock<CmsCategoryMapper, CmsCategory, CmsCategoryExample> implements CmsCategoryService {

}
