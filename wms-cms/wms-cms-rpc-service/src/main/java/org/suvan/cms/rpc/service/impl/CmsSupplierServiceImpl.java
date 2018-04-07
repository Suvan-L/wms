package org.suvan.cms.rpc.service.impl;

import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.suvan.cms.dao.mapper.CmsSupplierMapper;
import org.suvan.cms.dao.model.CmsSupplier;
import org.suvan.cms.dao.model.CmsSupplierExample;
import org.suvan.cms.rpc.api.CmsSupplierService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsSupplierService 实现类
* Created by suvan on 2018/4/7.
*/
@Service
@Transactional
@BaseService
public class CmsSupplierServiceImpl extends BaseServiceImpl<CmsSupplierMapper, CmsSupplier, CmsSupplierExample> implements CmsSupplierService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsSupplierServiceImpl.class);

    @Autowired
    CmsSupplierMapper cmsSupplierMapper;

}