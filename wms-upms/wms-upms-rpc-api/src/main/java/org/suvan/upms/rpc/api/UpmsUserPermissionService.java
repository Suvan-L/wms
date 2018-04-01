package org.suvan.upms.rpc.api;

import com.alibaba.fastjson.JSONArray;
import org.suvan.common.base.BaseService;
import org.suvan.upms.dao.model.UpmsUserPermission;
import org.suvan.upms.dao.model.UpmsUserPermissionExample;

/**
* UpmsUserPermissionService接口
*/
public interface UpmsUserPermissionService extends BaseService<UpmsUserPermission, UpmsUserPermissionExample> {

    /**
     * 用户权限
     * @param datas 权限数据
     * @param id 用户id
     * @return
     */
    int permission(JSONArray datas, int id);

}