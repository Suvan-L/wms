package org.suvan.cms.admin.controller.manage;

import com.baidu.unbiz.fluentvalidator.ComplexResult;
import com.baidu.unbiz.fluentvalidator.FluentValidator;
import com.baidu.unbiz.fluentvalidator.ResultCollectors;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.suvan.cms.common.constant.CmsResult;
import org.suvan.cms.common.constant.CmsResultConstant;
import org.suvan.cms.dao.model.CmsRecordIn;
import org.suvan.cms.dao.model.CmsRecordInExample;
import org.suvan.cms.rpc.api.CmsRecordInService;
import org.suvan.common.base.BaseController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 入库记录控制器
 */
@Controller
@Api(value = "入库记录管理", description = "入库记录管理")
@RequestMapping("/manage/record/in")
public class CmsRecordInController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CmsRecordInController.class);

	@Autowired
	private CmsRecordInService cmsRedcordInService;


	@ApiOperation(value = "入库记录信息")
	@RequiresPermissions("cms:record:in:read")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/manage/record/in/index.jsp";
	}

	@ApiOperation(value = "入库记录信息列表")
	@RequiresPermissions("cms:record:in:read")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Object list(
			@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
			@RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
			@RequestParam(required = false, value = "sort") String sort,
			@RequestParam(required = false, value = "order") String order) {
		CmsRecordInExample cmsRecordInExample = new CmsRecordInExample();
		if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
			cmsRecordInExample.setOrderByClause(sort + " " + order);
		}
		List<CmsRecordIn> rows = cmsRedcordInService.selectByExampleForOffsetPage(cmsRecordInExample, offset, limit);
		long total = cmsRedcordInService.countByExample(cmsRecordInExample);
		Map<String, Object> result = new HashMap<>(2);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@ApiOperation(value = "添加入库记录")
	@RequiresPermissions("cms:record:in:create")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap modelMap) {
		CmsRecordInExample cmsSupplierExample = new CmsRecordInExample();
		cmsSupplierExample.setOrderByClause("supplier_id DESC");
		List<CmsRecordIn> cmsTopics = cmsRedcordInService.selectByExample(cmsSupplierExample);
		modelMap.put("cmsTopics", cmsTopics);
		return "/manage/record/in/create.jsp";
	}

	@ApiOperation(value = "新增文章")
	@RequiresPermissions("cms:record:in:create")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Object create(CmsRecordIn cmsRecordIn) {
		ComplexResult result = FluentValidator.checkAll()
				.doValidate()
				.result(ResultCollectors.toComplex());
		if (!result.isSuccess()) {
			return new CmsResult(CmsResultConstant.INVALID_LENGTH, result.getErrors());
		}
		long time = System.currentTimeMillis();
		cmsRecordIn.setCtime(time);
		int count = cmsRedcordInService.insertSelective(cmsRecordIn);
		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}

}