package org.suvan.cms.dao.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.suvan.cms.dao.model.CmsGoods;
import org.suvan.cms.dao.model.CmsGoodsExample;

public interface CmsGoodsMapper {
    long countByExample(CmsGoodsExample example);

    int deleteByExample(CmsGoodsExample example);

    int deleteByPrimaryKey(Integer goodsId);

    int insert(CmsGoods record);

    int insertSelective(CmsGoods record);

    List<CmsGoods> selectByExample(CmsGoodsExample example);

    CmsGoods selectByPrimaryKey(Integer goodsId);

    int updateByExampleSelective(@Param("record") CmsGoods record, @Param("example") CmsGoodsExample example);

    int updateByExample(@Param("record") CmsGoods record, @Param("example") CmsGoodsExample example);

    int updateByPrimaryKeySelective(CmsGoods record);

    int updateByPrimaryKey(CmsGoods record);
}