package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsCategoryTagMapper;
import org.suvan.cms.dao.model.CmsCategoryTag;
import org.suvan.cms.dao.model.CmsCategoryTagExample;

/**
* 降级实现CmsCategoryTagService接口
* @since suvan modified 2018.04.01
*/
public class CmsCategoryTagServiceMock extends BaseServiceMock<CmsCategoryTagMapper, CmsCategoryTag, CmsCategoryTagExample> implements CmsCategoryTagService {

}
