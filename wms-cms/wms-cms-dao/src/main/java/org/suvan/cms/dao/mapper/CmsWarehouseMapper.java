package org.suvan.cms.dao.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.suvan.cms.dao.model.CmsWarehouse;
import org.suvan.cms.dao.model.CmsWarehouseExample;

public interface CmsWarehouseMapper {
    long countByExample(CmsWarehouseExample example);

    int deleteByExample(CmsWarehouseExample example);

    int deleteByPrimaryKey(Integer warehouseId);

    int insert(CmsWarehouse record);

    int insertSelective(CmsWarehouse record);

    List<CmsWarehouse> selectByExample(CmsWarehouseExample example);

    CmsWarehouse selectByPrimaryKey(Integer warehouseId);

    int updateByExampleSelective(@Param("record") CmsWarehouse record, @Param("example") CmsWarehouseExample example);

    int updateByExample(@Param("record") CmsWarehouse record, @Param("example") CmsWarehouseExample example);

    int updateByPrimaryKeySelective(CmsWarehouse record);

    int updateByPrimaryKey(CmsWarehouse record);
}