package org.suvan.cms.rpc.service.impl;

import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.suvan.cms.dao.mapper.CmsGoodsMapper;
import org.suvan.cms.dao.model.CmsGoods;
import org.suvan.cms.dao.model.CmsGoodsExample;
import org.suvan.cms.rpc.api.CmsGoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsGoodsService 实现类
* Created by suvan on 2018/4/7.
*/
@Service
@Transactional
@BaseService
public class CmsGoodsServiceImpl extends BaseServiceImpl<CmsGoodsMapper, CmsGoods, CmsGoodsExample> implements CmsGoodsService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsGoodsServiceImpl.class);

    @Autowired
    CmsGoodsMapper cmsGoodsMapper;

}