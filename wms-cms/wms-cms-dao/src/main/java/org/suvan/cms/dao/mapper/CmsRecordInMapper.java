package org.suvan.cms.dao.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.suvan.cms.dao.model.CmsRecordIn;
import org.suvan.cms.dao.model.CmsRecordInExample;

public interface CmsRecordInMapper {
    long countByExample(CmsRecordInExample example);

    int deleteByExample(CmsRecordInExample example);

    int deleteByPrimaryKey(Integer recordInId);

    int insert(CmsRecordIn record);

    int insertSelective(CmsRecordIn record);

    List<CmsRecordIn> selectByExample(CmsRecordInExample example);

    CmsRecordIn selectByPrimaryKey(Integer recordInId);

    int updateByExampleSelective(@Param("record") CmsRecordIn record, @Param("example") CmsRecordInExample example);

    int updateByExample(@Param("record") CmsRecordIn record, @Param("example") CmsRecordInExample example);

    int updateByPrimaryKeySelective(CmsRecordIn record);

    int updateByPrimaryKey(CmsRecordIn record);
}