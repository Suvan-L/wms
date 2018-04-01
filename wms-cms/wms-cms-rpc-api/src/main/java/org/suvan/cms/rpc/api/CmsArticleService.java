package org.suvan.cms.rpc.api;

import org.suvan.cms.dao.model.CmsArticle;
import org.suvan.cms.dao.model.CmsArticleExample;
import org.suvan.common.base.BaseService;

import java.util.List;

/**
* CmsArticleService接口
* @since suvan modified 2018.04.01
*/
public interface CmsArticleService extends BaseService<CmsArticle, CmsArticleExample> {

    /**
     * 根据类目获取文章列表
     * @param categoryId
     * @param offset
     * @param limit
     * @return
     */
    List<CmsArticle> selectCmsArticlesByCategoryId(Integer categoryId, Integer offset, Integer limit);

    /**
     * 根据类目获取文章数量
     * @param categoryId
     * @return
     */
    long countByCategoryId(Integer categoryId);

    /**
     * 根据标签获取文章列表
     * @param tagId
     * @param offset
     * @param limit
     * @return
     */
    List<CmsArticle> selectCmsArticlesByTagId(Integer tagId, Integer offset, Integer limit);

    /**
     * 根据标签获取文章数量
     * @param tagId
     * @return
     */
    long countByTagId(Integer tagId);

}