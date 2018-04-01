package org.suvan.cms.dao.mapper;

import org.suvan.cms.dao.model.CmsArticleTag;
import org.suvan.cms.dao.model.CmsArticleTagExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsArticleTagMapper {
    long countByExample(CmsArticleTagExample example);

    int deleteByExample(CmsArticleTagExample example);

    int deleteByPrimaryKey(Integer articleTagId);

    int insert(CmsArticleTag record);

    int insertSelective(CmsArticleTag record);

    List<CmsArticleTag> selectByExample(CmsArticleTagExample example);

    CmsArticleTag selectByPrimaryKey(Integer articleTagId);

    int updateByExampleSelective(@Param("record") CmsArticleTag record, @Param("example") CmsArticleTagExample example);

    int updateByExample(@Param("record") CmsArticleTag record, @Param("example") CmsArticleTagExample example);

    int updateByPrimaryKeySelective(CmsArticleTag record);

    int updateByPrimaryKey(CmsArticleTag record);
}