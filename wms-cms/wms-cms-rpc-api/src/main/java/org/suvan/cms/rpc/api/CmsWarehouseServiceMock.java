package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsWarehouseMapper;
import org.suvan.cms.dao.model.CmsWarehouse;
import org.suvan.cms.dao.model.CmsWarehouseExample;

/**
* 降级实现 CmsWarehouseService 接口
* Created by suvan on 2018/4/7.
*/
public class CmsWarehouseServiceMock extends BaseServiceMock<CmsWarehouseMapper, CmsWarehouse, CmsWarehouseExample> implements CmsWarehouseService {

}
