package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsGoodsMapper;
import org.suvan.cms.dao.model.CmsGoods;
import org.suvan.cms.dao.model.CmsGoodsExample;

/**
* 降级实现CmsGoodsService接口
* Created by shuzheng on 2018/4/6.
*/
public class CmsGoodsServiceMock extends BaseServiceMock<CmsGoodsMapper, CmsGoods, CmsGoodsExample> implements CmsGoodsService {

}
