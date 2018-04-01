package org.suvan.cms.rpc.service.impl;

import org.suvan.cms.dao.mapper.CmsArticleCategoryMapper;
import org.suvan.cms.dao.model.CmsArticleCategory;
import org.suvan.cms.dao.model.CmsArticleCategoryExample;
import org.suvan.cms.rpc.api.CmsArticleCategoryService;
import org.suvan.common.annotation.BaseService;
import org.suvan.common.base.BaseServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsArticleCategoryService实现
* @since suvan modified 2018.04.01
*/
@Service
@Transactional
@BaseService
public class CmsArticleCategoryServiceImpl extends BaseServiceImpl<CmsArticleCategoryMapper, CmsArticleCategory, CmsArticleCategoryExample> implements CmsArticleCategoryService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsArticleCategoryServiceImpl.class);

    @Autowired
    CmsArticleCategoryMapper cmsArticleCategoryMapper;

}