package org.suvan.cms.dao.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.suvan.cms.dao.model.CmsCustomer;
import org.suvan.cms.dao.model.CmsCustomerExample;

public interface CmsCustomerMapper {
    long countByExample(CmsCustomerExample example);

    int deleteByExample(CmsCustomerExample example);

    int deleteByPrimaryKey(Integer customerId);

    int insert(CmsCustomer record);

    int insertSelective(CmsCustomer record);

    List<CmsCustomer> selectByExample(CmsCustomerExample example);

    CmsCustomer selectByPrimaryKey(Integer customerId);

    int updateByExampleSelective(@Param("record") CmsCustomer record, @Param("example") CmsCustomerExample example);

    int updateByExample(@Param("record") CmsCustomer record, @Param("example") CmsCustomerExample example);

    int updateByPrimaryKeySelective(CmsCustomer record);

    int updateByPrimaryKey(CmsCustomer record);
}