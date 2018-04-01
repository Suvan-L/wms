package org.suvan.cms.rpc.service.impl;

import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.suvan.cms.dao.mapper.CmsSettingMapper;
import org.suvan.cms.dao.model.CmsSetting;
import org.suvan.cms.dao.model.CmsSettingExample;
import org.suvan.cms.rpc.api.CmsSettingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsSettingService实现
* @since suvan modified 2018.04.01
*/
@Service
@Transactional
@BaseService
public class CmsSettingServiceImpl extends BaseServiceImpl<CmsSettingMapper, CmsSetting, CmsSettingExample> implements CmsSettingService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsSettingServiceImpl.class);

    @Autowired
    CmsSettingMapper cmsSettingMapper;

}