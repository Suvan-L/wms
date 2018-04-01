package org.suvan.api.common.constant;

import org.suvan.common.base.BaseResult;

/**
 * api系统常量枚举类
 */
public class ApiResult extends BaseResult {

    public ApiResult(int code, String message, Object data) {
        super(code, message, data);
    }

    public ApiResult(ApiResultConstant apiResultConstant, Object data) {
        super(apiResultConstant.getCode(), apiResultConstant.getMessage(), data);
    }

}
