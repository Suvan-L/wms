package org.suvan.upms.rpc.api;

import com.alibaba.fastjson.JSONArray;
import org.suvan.common.base.BaseService;
import org.suvan.upms.dao.model.UpmsPermission;
import org.suvan.upms.dao.model.UpmsPermissionExample;

/**
* UpmsPermissionService接口
*/
public interface UpmsPermissionService extends BaseService<UpmsPermission, UpmsPermissionExample> {

    JSONArray getTreeByRoleId(Integer roleId);

    JSONArray getTreeByUserId(Integer usereId, Byte type);

}