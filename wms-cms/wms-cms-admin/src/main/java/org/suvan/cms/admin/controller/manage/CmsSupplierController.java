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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.suvan.cms.common.constant.CmsResult;
import org.suvan.cms.common.constant.CmsResultConstant;
import org.suvan.cms.dao.model.CmsSupplier;
import org.suvan.cms.dao.model.CmsSupplierExample;
import org.suvan.cms.rpc.api.CmsSupplierService;
import org.suvan.common.base.BaseController;
import org.suvan.common.validator.LengthValidator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 供应商控制器
 */
@Controller
@Api(value = "供应商管理", description = "供应商管理")
@RequestMapping("/manage/supplier")
public class CmsSupplierController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CmsSupplierController.class);

	@Autowired
	private CmsSupplierService cmsSupplierService;


	@ApiOperation(value = "供应商信息")
	@RequiresPermissions("cms:supplier:read")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/manage/supplier/index.jsp";
	}

	@ApiOperation(value = "供应商信息列表")
	@RequiresPermissions("cms:supplier:read")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Object list(
			@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
			@RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
			@RequestParam(required = false, value = "sort") String sort,
			@RequestParam(required = false, value = "order") String order) {
		CmsSupplierExample cmsSupplierExamples = new CmsSupplierExample();

		//暂时忽略排序功能
		//if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
		//	cmsSupplierExamples.setOrderByClause(sort + " " + order);
		//}

		List<CmsSupplier> rows = cmsSupplierService.selectByExampleForOffsetPage(cmsSupplierExamples, offset, limit);
		long total = cmsSupplierService.countByExample(cmsSupplierExamples);

		Map<String, Object> result = new HashMap<>(2);
            result.put("rows", rows);
            result.put("total", total);
		return result;
	}

	@ApiOperation(value = "新增供应商 GET")
	@RequiresPermissions("cms:supplier:create")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap modelMap) {
		CmsSupplierExample cmsSupplierExample = new CmsSupplierExample();
            //cmsSupplierExample.setOrderByClause("supplier_id DESC");

		List<CmsSupplier> cmsTopics = cmsSupplierService.selectByExample(cmsSupplierExample);
            modelMap.put("cmsTopics", cmsTopics);
		return "/manage/supplier/create.jsp";
	}

	@ApiOperation(value = "新增供应商 POST")
	@RequiresPermissions("cms:supplier:create")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Object create(CmsSupplier cmsSupplier) {
		cmsSupplier.setCtime(System.currentTimeMillis());
		int count = cmsSupplierService.insertSelective(cmsSupplier);

		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}

	@ApiOperation(value = "删除供应商")
	@RequiresPermissions("cms:supplier:delete")
	@RequestMapping(value = "/delete/{ids}",method = RequestMethod.GET)
	@ResponseBody
	public Object delete(@PathVariable("ids") String ids) {
		int count = cmsSupplierService.deleteByPrimaryKeys(ids);
		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}

	@ApiOperation(value = "修改供应商信息 GET")
	@RequiresPermissions("cms:supplier:update")
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") int id, ModelMap modelMap) {
		CmsSupplier cmsSupplier = cmsSupplierService.selectByPrimaryKey(id);
            modelMap.put("supplier", cmsSupplier);
		return "/manage/supplier/update.jsp";
	}

	@ApiOperation(value = "修改供应商信息 POST")
	@RequiresPermissions("cms:supplier:update")
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Object update(@PathVariable("id") int id, CmsSupplier cmsSupplier) {
		cmsSupplier.setSupplierId(id);
		int count = cmsSupplierService.updateByPrimaryKeySelective(cmsSupplier);

		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}
}

