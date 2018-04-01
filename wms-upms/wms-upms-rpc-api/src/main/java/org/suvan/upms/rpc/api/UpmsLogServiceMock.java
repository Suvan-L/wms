package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.upms.dao.mapper.UpmsLogMapper;
import org.suvan.upms.dao.model.UpmsLog;
import org.suvan.upms.dao.model.UpmsLogExample;

/**
* 降级实现UpmsLogService接口
*/
public class UpmsLogServiceMock extends BaseServiceMock<UpmsLogMapper, UpmsLog, UpmsLogExample> implements UpmsLogService {

}
