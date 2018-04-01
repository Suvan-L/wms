package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseService;
import org.suvan.upms.dao.model.UpmsUserRole;
import org.suvan.upms.dao.model.UpmsUserRoleExample;

/**
* UpmsUserRoleService接口
*/
public interface UpmsUserRoleService extends BaseService<UpmsUserRole, UpmsUserRoleExample> {

    /**
     * 用户角色
     * @param roleIds 角色ids
     * @param id 用户id
     * @return
     */
    int role(String[] roleIds, int id);

}