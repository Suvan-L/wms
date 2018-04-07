package org.suvan.cms.admin.controller.manage;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.suvan.cms.dao.model.CmsWarehouseCapacity;
import org.suvan.cms.dao.model.CmsWarehouseCapacityExample;
import org.suvan.cms.rpc.api.CmsWarehouseCapacityService;
import org.suvan.common.base.BaseController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 仓库库存控制器
 */
@Controller
@Api(value = "仓库库存管理", description = "仓库库存管理")
@RequestMapping("/manage/warehouse/capacity")
public class CmsWarehouseCapacityController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CmsWarehouseCapacityController.class);

	@Autowired
	private CmsWarehouseCapacityService cmsWarehouseCapacityService;


	@ApiOperation(value = "仓库库存信息")
	@RequiresPermissions("cms:warehouse:capacity:read")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/manage/warehouse/capacity/index.jsp";
	}

	@ApiOperation(value = "仓库库存信息列表")
	@RequiresPermissions("cms:warehouse:capacity:read")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Object list(
			@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
			@RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
			@RequestParam(required = false, value = "sort") String sort,
			@RequestParam(required = false, value = "order") String order) {
		CmsWarehouseCapacityExample cmsWarehouseCapacityExample = new CmsWarehouseCapacityExample();
		if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
			cmsWarehouseCapacityExample.setOrderByClause(sort + " " + order);
		}
		List<CmsWarehouseCapacity> rows = cmsWarehouseCapacityService.selectByExampleForOffsetPage(cmsWarehouseCapacityExample, offset, limit);
		long total = cmsWarehouseCapacityService.countByExample(cmsWarehouseCapacityExample);
		Map<String, Object> result = new HashMap<>(2);
		result.put("rows", rows);
		result.put("total", total);
		return result;
	}
}