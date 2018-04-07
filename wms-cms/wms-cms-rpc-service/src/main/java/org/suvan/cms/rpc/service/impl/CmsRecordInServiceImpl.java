package org.suvan.cms.rpc.service.impl;

import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.suvan.cms.dao.mapper.CmsRecordInMapper;
import org.suvan.cms.dao.model.CmsRecordIn;
import org.suvan.cms.dao.model.CmsRecordInExample;
import org.suvan.cms.rpc.api.CmsRecordInService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsRecordInService实现
*
*/
@Service
@Transactional
@BaseService
public class CmsRecordInServiceImpl extends BaseServiceImpl<CmsRecordInMapper, CmsRecordIn, CmsRecordInExample> implements CmsRecordInService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsRecordInServiceImpl.class);

    @Autowired
    CmsRecordInMapper cmsRecordInMapper;

}