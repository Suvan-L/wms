package org.suvan.cms.dao.mapper;

import org.suvan.cms.dao.model.CmsMenu;
import org.suvan.cms.dao.model.CmsMenuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsMenuMapper {
    long countByExample(CmsMenuExample example);

    int deleteByExample(CmsMenuExample example);

    int deleteByPrimaryKey(Integer menuId);

    int insert(CmsMenu record);

    int insertSelective(CmsMenu record);

    List<CmsMenu> selectByExample(CmsMenuExample example);

    CmsMenu selectByPrimaryKey(Integer menuId);

    int updateByExampleSelective(@Param("record") CmsMenu record, @Param("example") CmsMenuExample example);

    int updateByExample(@Param("record") CmsMenu record, @Param("example") CmsMenuExample example);

    int updateByPrimaryKeySelective(CmsMenu record);

    int updateByPrimaryKey(CmsMenu record);
}