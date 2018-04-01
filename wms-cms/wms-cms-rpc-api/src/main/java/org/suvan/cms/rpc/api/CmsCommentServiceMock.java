package org.suvan.cms.rpc.api;

import org.suvan.common.base.BaseServiceMock;
import org.suvan.cms.dao.mapper.CmsCommentMapper;
import org.suvan.cms.dao.model.CmsComment;
import org.suvan.cms.dao.model.CmsCommentExample;

/**
* 降级实现CmsCommentService接口
* @since suvan modified 2018.04.01
*/
public class CmsCommentServiceMock extends BaseServiceMock<CmsCommentMapper, CmsComment, CmsCommentExample> implements CmsCommentService {

}
