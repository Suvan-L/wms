package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseService;
import org.suvan.upms.dao.model.UpmsUserOrganization;
import org.suvan.upms.dao.model.UpmsUserOrganizationExample;

/**
* UpmsUserOrganizationService接口
*/
public interface UpmsUserOrganizationService extends BaseService<UpmsUserOrganization, UpmsUserOrganizationExample> {

    /**
     * 用户组织
     * @param organizationIds 组织ids
     * @param id 用户id
     * @return
     */
    int organization(String[] organizationIds, int id);

}