package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsSystemMapper;
import org.suvan.cms.dao.model.CmsSystem;
import org.suvan.cms.dao.model.CmsSystemExample;

/**
* 降级实现CmsSystemService接口
* @since suvan modified 2018.04.01
*/
public class CmsSystemServiceMock extends BaseServiceMock<CmsSystemMapper, CmsSystem, CmsSystemExample> implements CmsSystemService {

}
