package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.upms.dao.mapper.UpmsSystemMapper;
import org.suvan.upms.dao.model.UpmsSystem;
import org.suvan.upms.dao.model.UpmsSystemExample;

/**
* 降级实现UpmsSystemService接口
*/
public class UpmsSystemServiceMock extends BaseServiceMock<UpmsSystemMapper, UpmsSystem, UpmsSystemExample> implements UpmsSystemService {

    @Override
    public UpmsSystem selectUpmsSystemByName(String name) {
        return null;
    }

}
