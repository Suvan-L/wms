package org.suvan.cms.dao.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.suvan.cms.dao.model.CmsRecordOut;
import org.suvan.cms.dao.model.CmsRecordOutExample;

public interface CmsRecordOutMapper {
    long countByExample(CmsRecordOutExample example);

    int deleteByExample(CmsRecordOutExample example);

    int deleteByPrimaryKey(Integer recordOutId);

    int insert(CmsRecordOut record);

    int insertSelective(CmsRecordOut record);

    List<CmsRecordOut> selectByExample(CmsRecordOutExample example);

    CmsRecordOut selectByPrimaryKey(Integer recordOutId);

    int updateByExampleSelective(@Param("record") CmsRecordOut record, @Param("example") CmsRecordOutExample example);

    int updateByExample(@Param("record") CmsRecordOut record, @Param("example") CmsRecordOutExample example);

    int updateByPrimaryKeySelective(CmsRecordOut record);

    int updateByPrimaryKey(CmsRecordOut record);
}