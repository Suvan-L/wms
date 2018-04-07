package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsSupplierMapper;
import org.suvan.cms.dao.model.CmsSupplier;
import org.suvan.cms.dao.model.CmsSupplierExample;

/**
* 降级实现 CmsSupplierService 接口
* Created by suvan on 2018/4/7.
*/
public class CmsSupplierServiceMock extends BaseServiceMock<CmsSupplierMapper, CmsSupplier, CmsSupplierExample> implements CmsSupplierService {

}
