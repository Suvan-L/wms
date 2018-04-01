package org.suvan.upms.rpc.api;

import org.suvan.common.base.BaseService;
import org.suvan.upms.dao.model.UpmsSystem;
import org.suvan.upms.dao.model.UpmsSystemExample;

/**
* UpmsSystemService接口
*/
public interface UpmsSystemService extends BaseService<UpmsSystem, UpmsSystemExample> {

    /**
     * 根据name获取UpmsSystem
     * @param name
     * @return
     */
    UpmsSystem selectUpmsSystemByName(String name);

}