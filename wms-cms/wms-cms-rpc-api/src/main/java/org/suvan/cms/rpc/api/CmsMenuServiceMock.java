package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsMenuMapper;
import org.suvan.cms.dao.model.CmsMenu;
import org.suvan.cms.dao.model.CmsMenuExample;

/**
* 降级实现CmsMenuService接口
* @since suvan modified 2018.04.01
*/
public class CmsMenuServiceMock extends BaseServiceMock<CmsMenuMapper, CmsMenu, CmsMenuExample> implements CmsMenuService {

}
