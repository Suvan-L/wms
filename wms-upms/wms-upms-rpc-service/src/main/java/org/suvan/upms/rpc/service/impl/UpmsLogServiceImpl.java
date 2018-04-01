package org.suvan.upms.rpc.service.impl;

import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.suvan.upms.dao.mapper.UpmsLogMapper;
import org.suvan.upms.dao.model.UpmsLog;
import org.suvan.upms.dao.model.UpmsLogExample;
import org.suvan.upms.rpc.api.UpmsLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* UpmsLogService实现
*/
@Service
@Transactional
@BaseService
public class UpmsLogServiceImpl extends BaseServiceImpl<UpmsLogMapper, UpmsLog, UpmsLogExample> implements UpmsLogService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UpmsLogServiceImpl.class);

    @Autowired
    UpmsLogMapper upmsLogMapper;

}