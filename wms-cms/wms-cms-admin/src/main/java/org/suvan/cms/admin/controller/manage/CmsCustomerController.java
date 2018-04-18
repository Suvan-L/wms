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
import org.suvan.cms.dao.model.CmsCustomer;
import org.suvan.cms.dao.model.CmsCustomerExample;
import org.suvan.cms.rpc.api.CmsCustomerService;
import org.suvan.common.base.BaseController;
import org.suvan.common.util.StringUtil;
import org.suvan.common.validator.LengthValidator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 客户控制器
 */
@Controller
@Api(value = "客户管理", description = "客户管理")
@RequestMapping("/manage/customer")
public class CmsCustomerController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CmsCustomerController.class);

	@Autowired
	private CmsCustomerService cmsCustomerService;

	@ApiOperation(value = "客户信息页面")
	@RequiresPermissions("cms:customer:read")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/manage/customer/index.jsp";
	}

	@ApiOperation(value = "客户信息列表")
	@RequiresPermissions("cms:customer:read")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Object list(
			@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
			@RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
			@RequestParam(required = false, value = "sort") String sort,
			@RequestParam(required = false, value = "order") String order) {
		CmsCustomerExample cmsCustomerExample = new CmsCustomerExample();

		//排序功能
		if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
            cmsCustomerExample.setOrderByClause(StringUtil.humpToLine(sort) + " " + order);
        }

		List<CmsCustomer> rows = cmsCustomerService.selectByExampleForOffsetPage(cmsCustomerExample, offset, limit);
		long total = cmsCustomerService.countByExample(cmsCustomerExample);

		Map<String, Object> result = new HashMap<>(2);
            result.put("rows", rows);
            result.put("total", total);

		return result;
	}

	@ApiOperation(value = "新增客户 GET")
	@RequiresPermissions("cms:customer:create")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap modelMap) {
		CmsCustomerExample cmsCustomerExample = new CmsCustomerExample();
            cmsCustomerExample.setOrderByClause("customer_id DESC");

		List<CmsCustomer> cmsTopics = cmsCustomerService.selectByExample(cmsCustomerExample);
            modelMap.put("cmsTopics", cmsTopics);

		return "/manage/customer/create.jsp";
	}

	@ApiOperation(value = "新增客户 POST")
	@RequiresPermissions("cms:customer:create")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Object create(CmsCustomer cmsCustomer) {
        cmsCustomer.setCtime(System.currentTimeMillis());
		int count = cmsCustomerService.insertSelective(cmsCustomer);

		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}

	@ApiOperation(value = "删除客户")
	@RequiresPermissions("cms:customer:delete")
	@RequestMapping(value = "/delete/{ids}",method = RequestMethod.GET)
	@ResponseBody
	public Object delete(@PathVariable("ids") String ids) {
		int count = cmsCustomerService.deleteByPrimaryKeys(ids);
		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}

	@ApiOperation(value = "修改客户信息 GET")
	@RequiresPermissions("cms:customer:update")
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") int id, ModelMap modelMap) {
		CmsCustomer cmsCustomer = cmsCustomerService.selectByPrimaryKey(id);
            modelMap.put("customer", cmsCustomer);

		return "/manage/customer/update.jsp";
	}

	@ApiOperation(value = "修改客户信息")
	@RequiresPermissions("cms:customer:update")
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Object update(@PathVariable("id") int id, CmsCustomer cmsCustomer) {
		cmsCustomer.setCustomerId(id);
		int count = cmsCustomerService.updateByPrimaryKeySelective(cmsCustomer);

		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}
}
