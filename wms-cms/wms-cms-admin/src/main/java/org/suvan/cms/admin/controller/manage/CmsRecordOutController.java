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
import org.suvan.cms.dao.model.CmsRecordOut;
import org.suvan.cms.dao.model.CmsRecordOutExample;
import org.suvan.cms.rpc.api.CmsRecordOutService;
import org.suvan.common.base.BaseController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 出库记录控制器
 */
@Controller
@Api(value = "出库记录管理", description = "出库记录管理")
@RequestMapping("/manage/record/out")
public class CmsRecordOutController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CmsRecordOutController.class);

	@Autowired
	private CmsRecordOutService cmsRecordOutService;


	@ApiOperation(value = "出库记录信息")
	@RequiresPermissions("cms:record:out:read")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/manage/record/out/index.jsp";
	}

	@ApiOperation(value = "出库记录信息列表")
	@RequiresPermissions("cms:record:out:read")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Object list(
			@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
			@RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
			@RequestParam(required = false, value = "sort") String sort,
			@RequestParam(required = false, value = "order") String order) {
		CmsRecordOutExample cmsRecordOutExample = new CmsRecordOutExample();
		if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
			cmsRecordOutExample.setOrderByClause(sort + " " + order);
		}
		List<CmsRecordOut> rows = cmsRecordOutService.selectByExampleForOffsetPage(cmsRecordOutExample, offset, limit);
		long total = cmsRecordOutService.countByExample(cmsRecordOutExample);
		Map<String, Object> result = new HashMap<>(2);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}

	@ApiOperation(value = "添加出库记录")
	@RequiresPermissions("cms:record:out:create")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap modelMap) {
		CmsRecordOutExample cmsRecordOutExample = new CmsRecordOutExample();
		cmsRecordOutExample.setOrderByClause("record_out_id DESC");
		List<CmsRecordOut> cmsRecordOutList = cmsRecordOutService.selectByExample(cmsRecordOutExample);
		modelMap.put("cmsRecordOutExample", cmsRecordOutList);
		return "/manage/record/out/create.jsp";
	}

	@ApiOperation(value = "新增文章")
	@RequiresPermissions("cms:record:out:create")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Object create(CmsRecordOut cmsRecordOut) {
		ComplexResult result = FluentValidator.checkAll()
				.doValidate()
				.result(ResultCollectors.toComplex());
		if (!result.isSuccess()) {
			return new CmsResult(CmsResultConstant.INVALID_LENGTH, result.getErrors());
		}
		long time = System.currentTimeMillis();
		cmsRecordOut.setCtime(time);
		int count = cmsRecordOutService.insertSelective(cmsRecordOut);
		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}
}