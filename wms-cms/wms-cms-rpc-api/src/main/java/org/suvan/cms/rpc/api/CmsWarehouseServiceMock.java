package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsWarehouseMapper;
import org.suvan.cms.dao.model.CmsWarehouse;
import org.suvan.cms.dao.model.CmsWarehouseExample;

/**
* 降级实现CmsWarehouseService接口
* Created by shuzheng on 2018/4/6.
*/
public class CmsWarehouseServiceMock extends BaseServiceMock<CmsWarehouseMapper, CmsWarehouse, CmsWarehouseExample> implements CmsWarehouseService {

}
