package org.suvan.cms.rpc.service.impl;

import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.suvan.cms.dao.mapper.CmsCustomerMapper;
import org.suvan.cms.dao.model.CmsCustomer;
import org.suvan.cms.dao.model.CmsCustomerExample;
import org.suvan.cms.rpc.api.CmsCustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsCustomerService 实现类
* Created by suvan on 2018/4/7.
*/
@Service
@Transactional
@BaseService
public class CmsCustomerServiceImpl extends BaseServiceImpl<CmsCustomerMapper, CmsCustomer, CmsCustomerExample> implements CmsCustomerService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsCustomerServiceImpl.class);

    @Autowired
    CmsCustomerMapper cmsCustomerMapper;

}