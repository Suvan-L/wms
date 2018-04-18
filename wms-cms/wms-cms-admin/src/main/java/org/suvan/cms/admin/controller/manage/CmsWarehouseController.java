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
import org.suvan.cms.dao.model.CmsWarehouse;
import org.suvan.cms.dao.model.CmsWarehouseExample;
import org.suvan.cms.rpc.api.CmsWarehouseService;
import org.suvan.common.base.BaseController;
import org.suvan.common.util.StringUtil;
import org.suvan.common.validator.LengthValidator;
import org.suvan.common.validator.NotNullValidator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 仓库控制器
 */
@Controller
@Api(value = "仓库管理", description = "仓库管理")
@RequestMapping("/manage/warehouse")
public class CmsWarehouseController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CmsWarehouseController.class);

	@Autowired
	private CmsWarehouseService cmsWarehouseService;


	@ApiOperation(value = "仓库信息")
	@RequiresPermissions("cms:warehouse:read")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/manage/warehouse/index.jsp";
	}

	@ApiOperation(value = "仓库信息列表")
	@RequiresPermissions("cms:warehouse:read")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Object list(
			@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
			@RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
			@RequestParam(required = false, value = "sort") String sort,
			@RequestParam(required = false, value = "order") String order) {
		CmsWarehouseExample cmsWarehouseExample = new CmsWarehouseExample();

		if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
			cmsWarehouseExample.setOrderByClause(StringUtil.humpToLine(sort) + " " + order);
		}

		List<CmsWarehouse> rows = cmsWarehouseService.selectByExampleForOffsetPage(cmsWarehouseExample, offset, limit);
		long total = cmsWarehouseService.countByExample(cmsWarehouseExample);

		Map<String, Object> result = new HashMap<>(2);
            result.put("rows", rows);
            result.put("total", total);
		return result;
	}

	@ApiOperation(value = "新增仓库 GET")
	@RequiresPermissions("cms:warehouse:create")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap modelMap) {
		CmsWarehouseExample cmsWarehouseExample = new CmsWarehouseExample();

		List<CmsWarehouse> cmsWarehouseList = cmsWarehouseService.selectByExample(cmsWarehouseExample);
		    modelMap.put("cmsWarehouseList", cmsWarehouseList);
		return "/manage/warehouse/create.jsp";
	}

	@ApiOperation(value = "新增仓库 POST")
	@RequiresPermissions("cms:warehouse:create")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Object create(CmsWarehouse cmsWarehouse) {
	    //校验规则
		ComplexResult result = FluentValidator.checkAll()
                .on(cmsWarehouse.getAddress(), new NotNullValidator("仓库地址"))
                .on(cmsWarehouse.getAdmin(), new NotNullValidator("现任管理员"))
				.doValidate()
				.result(ResultCollectors.toComplex());
		if (!result.isSuccess()) {
			return new CmsResult(CmsResultConstant.INVALID_LENGTH, result.getErrors());
		}

		//设置默认值
		cmsWarehouse.setGoodsArea(0);
		cmsWarehouse.setStatus(0.0);

		int count = cmsWarehouseService.insertSelective(cmsWarehouse);
		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}

	@ApiOperation(value = "删除仓库")
	@RequiresPermissions("cms:warehouse:delete")
	@RequestMapping(value = "/delete/{ids}",method = RequestMethod.GET)
	@ResponseBody
	public Object delete(@PathVariable("ids") String ids) {
		int count = cmsWarehouseService.deleteByPrimaryKeys(ids);
		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}

	@ApiOperation(value = "修改仓库信息 GET")
	@RequiresPermissions("cms:warehouse:update")
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") int id, ModelMap modelMap) {
		CmsWarehouse cmsWarehouse = cmsWarehouseService.selectByPrimaryKey(id);
            modelMap.put("warehouse", cmsWarehouse);
		return "/manage/warehouse/update.jsp";
	}

	@ApiOperation(value = "修改仓库信息 POST")
	@RequiresPermissions("cms:warehouse:update")
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Object update(@PathVariable("id") int id, CmsWarehouse cmsWarehouse) {
		cmsWarehouse.setWarehouseId(id);
		int count = cmsWarehouseService.updateByPrimaryKeySelective(cmsWarehouse);

		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}
}
