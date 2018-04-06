package org.suvan.cms.rpc.service.impl;

import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.suvan.cms.dao.mapper.CmsWarehouseMapper;
import org.suvan.cms.dao.model.CmsWarehouse;
import org.suvan.cms.dao.model.CmsWarehouseExample;
import org.suvan.cms.rpc.api.CmsWarehouseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsWarehouseService实现
* Created by shuzheng on 2018/4/6.
*/
@Service
@Transactional
@BaseService
public class CmsWarehouseServiceImpl extends BaseServiceImpl<CmsWarehouseMapper, CmsWarehouse, CmsWarehouseExample> implements CmsWarehouseService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsWarehouseServiceImpl.class);

    @Autowired
    CmsWarehouseMapper cmsWarehouseMapper;

}