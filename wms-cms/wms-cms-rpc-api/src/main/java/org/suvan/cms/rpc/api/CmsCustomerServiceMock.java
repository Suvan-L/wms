package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsCustomerMapper;
import org.suvan.cms.dao.model.CmsCustomer;
import org.suvan.cms.dao.model.CmsCustomerExample;

/**
* 降级实现 CmsCustomerService 接口
* Created by suvan on 2018/4/7.
*/
public class CmsCustomerServiceMock extends BaseServiceMock<CmsCustomerMapper, CmsCustomer, CmsCustomerExample> implements CmsCustomerService {

}
