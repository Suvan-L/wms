package org.suvan.cms.rpc.service.impl;

import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.suvan.cms.dao.mapper.CmsWarehouseCapacityMapper;
import org.suvan.cms.dao.model.CmsWarehouseCapacity;
import org.suvan.cms.dao.model.CmsWarehouseCapacityExample;
import org.suvan.cms.rpc.api.CmsWarehouseCapacityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsWarehouseCapacityService 实现类
* Created by suvan on 2018/4/7.
*/
@Service
@Transactional
@BaseService
public class CmsWarehouseCapacityServiceImpl extends BaseServiceImpl<CmsWarehouseCapacityMapper, CmsWarehouseCapacity, CmsWarehouseCapacityExample> implements CmsWarehouseCapacityService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsWarehouseCapacityServiceImpl.class);

    @Autowired
    CmsWarehouseCapacityMapper cmsWarehouseCapacityMapper;

}