package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsSupplierMapper;
import org.suvan.cms.dao.model.CmsSupplier;
import org.suvan.cms.dao.model.CmsSupplierExample;

/**
* 降级实现CmsSupplierService接口
* Created by shuzheng on 2018/4/6.
*/
public class CmsSupplierServiceMock extends BaseServiceMock<CmsSupplierMapper, CmsSupplier, CmsSupplierExample> implements CmsSupplierService {

}
