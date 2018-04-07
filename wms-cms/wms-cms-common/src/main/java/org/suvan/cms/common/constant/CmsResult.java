package org.suvan.cms.common.constant;

import org.suvan.common.base.BaseResult;

/**
 * cms系统常量枚举类
 *
 */
public class CmsResult extends BaseResult {

    public CmsResult(CmsResultConstant cmsResultConstant, Object data) {
        super(cmsResultConstant.getCode(), cmsResultConstant.getMessage(), data);
    }

}
