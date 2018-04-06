package org.suvan.cms.dao.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.suvan.cms.dao.model.CmsSupplier;
import org.suvan.cms.dao.model.CmsSupplierExample;

public interface CmsSupplierMapper {
    long countByExample(CmsSupplierExample example);

    int deleteByExample(CmsSupplierExample example);

    int deleteByPrimaryKey(Integer supplierId);

    int insert(CmsSupplier record);

    int insertSelective(CmsSupplier record);

    List<CmsSupplier> selectByExample(CmsSupplierExample example);

    CmsSupplier selectByPrimaryKey(Integer supplierId);

    int updateByExampleSelective(@Param("record") CmsSupplier record, @Param("example") CmsSupplierExample example);

    int updateByExample(@Param("record") CmsSupplier record, @Param("example") CmsSupplierExample example);

    int updateByPrimaryKeySelective(CmsSupplier record);

    int updateByPrimaryKey(CmsSupplier record);
}