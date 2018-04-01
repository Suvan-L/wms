package org.suvan.upms.rpc.mapper;


import org.suvan.upms.dao.model.UpmsPermission;
import org.suvan.upms.dao.model.UpmsRole;

import java.util.List;

/**
 * 用户VOMapper
 */
public interface UpmsApiMapper {

	// 根据用户id获取所拥有的权限
	List<UpmsPermission> selectUpmsPermissionByUpmsUserId(Integer upmsUserId);

	// 根据用户id获取所属的角色
	List<UpmsRole> selectUpmsRoleByUpmsUserId(Integer upmsUserId);
	
}