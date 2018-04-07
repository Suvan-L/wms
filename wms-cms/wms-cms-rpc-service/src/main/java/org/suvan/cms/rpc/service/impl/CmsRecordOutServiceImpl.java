package org.suvan.cms.rpc.service.impl;

import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.suvan.cms.dao.mapper.CmsRecordOutMapper;
import org.suvan.cms.dao.model.CmsRecordOut;
import org.suvan.cms.dao.model.CmsRecordOutExample;
import org.suvan.cms.rpc.api.CmsRecordOutService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsRecordOutService 实现类
* Created by suvan on 2018/4/7.
*/
@Service
@Transactional
@BaseService
public class CmsRecordOutServiceImpl extends BaseServiceImpl<CmsRecordOutMapper, CmsRecordOut, CmsRecordOutExample> implements CmsRecordOutService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsRecordOutServiceImpl.class);

    @Autowired
    CmsRecordOutMapper cmsRecordOutMapper;

}