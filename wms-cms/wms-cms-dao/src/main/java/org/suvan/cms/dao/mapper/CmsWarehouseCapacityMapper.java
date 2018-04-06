package org.suvan.cms.dao.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.suvan.cms.dao.model.CmsWarehouseCapacity;
import org.suvan.cms.dao.model.CmsWarehouseCapacityExample;

public interface CmsWarehouseCapacityMapper {
    long countByExample(CmsWarehouseCapacityExample example);

    int deleteByExample(CmsWarehouseCapacityExample example);

    int deleteByPrimaryKey(Integer warehouseCapacityId);

    int insert(CmsWarehouseCapacity record);

    int insertSelective(CmsWarehouseCapacity record);

    List<CmsWarehouseCapacity> selectByExample(CmsWarehouseCapacityExample example);

    CmsWarehouseCapacity selectByPrimaryKey(Integer warehouseCapacityId);

    int updateByExampleSelective(@Param("record") CmsWarehouseCapacity record, @Param("example") CmsWarehouseCapacityExample example);

    int updateByExample(@Param("record") CmsWarehouseCapacity record, @Param("example") CmsWarehouseCapacityExample example);

    int updateByPrimaryKeySelective(CmsWarehouseCapacity record);

    int updateByPrimaryKey(CmsWarehouseCapacity record);
}