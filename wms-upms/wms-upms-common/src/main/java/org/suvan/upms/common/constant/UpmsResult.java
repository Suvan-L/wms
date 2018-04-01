package org.suvan.upms.common.constant;

import org.suvan.common.base.BaseResult;

/**
 * upms系统常量枚举类
 */
public class UpmsResult extends BaseResult {

    public UpmsResult(UpmsResultConstant upmsResultConstant, Object data) {
        super(upmsResultConstant.getCode(), upmsResultConstant.getMessage(), data);
    }

}
