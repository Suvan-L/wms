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
import org.suvan.cms.dao.model.CmsGoods;
import org.suvan.cms.dao.model.CmsGoodsExample;
import org.suvan.cms.rpc.api.CmsGoodsService;
import org.suvan.common.base.BaseController;
import org.suvan.common.util.StringUtil;
import org.suvan.common.validator.LengthValidator;
import org.suvan.common.validator.NotNullValidator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 货物控制器
 */
@Controller
@Api(value = "货物管理", description = "货物管理")
@RequestMapping("/manage/goods")
public class CmsGoodsController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CmsGoodsController.class);

	@Autowired
	private CmsGoodsService cmsGoodsService;


	@ApiOperation(value = "货物信息")
	@RequiresPermissions("cms:goods:read")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/manage/goods/index.jsp";
	}

	@ApiOperation(value = "货物信息列表")
	@RequiresPermissions("cms:goods:read")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Object list(
			@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
			@RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
			@RequestParam(required = false, value = "sort") String sort,
			@RequestParam(required = false, value = "order") String order) {
		CmsGoodsExample cmsGoodsExample = new CmsGoodsExample();

		////排序功能
		if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
			cmsGoodsExample.setOrderByClause(StringUtil.humpToLine(sort) + " " + order);
		}

		List<CmsGoods> rows = cmsGoodsService.selectByExampleForOffsetPage(cmsGoodsExample, offset, limit);
		long total = cmsGoodsService.countByExample(cmsGoodsExample);

		Map<String, Object> result = new HashMap<>(2);
            result.put("rows", rows);
            result.put("total", total);
		return result;
	}

	@ApiOperation(value = "新增货物 GET")
	@RequiresPermissions("cms:goods:create")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap modelMap) {
		CmsGoodsExample cmsGoodsExample = new CmsGoodsExample();
		List<CmsGoods> cmsGoods = cmsGoodsService.selectByExample(cmsGoodsExample);
            modelMap.put("cmsGoods", cmsGoods);

		return "/manage/goods/create.jsp";
	}

	@ApiOperation(value = "添加货物 POST")
	@RequiresPermissions("cms:goods:create")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Object create(CmsGoods cmsGoods) {
	    //添加校验规则
		ComplexResult result = FluentValidator.checkAll()
                .on(cmsGoods.getName(), new NotNullValidator("货物名"))
				.on(cmsGoods.getName(), new LengthValidator(1, 30, "货物名"))
				.doValidate()
				.result(ResultCollectors.toComplex());
		if (!result.isSuccess()) {
			return new CmsResult(CmsResultConstant.INVALID_LENGTH, result.getErrors());
		}

		int count = cmsGoodsService.insertSelective(cmsGoods);

		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}

	@ApiOperation(value = "删除货物")
	@RequiresPermissions("cms:goods:delete")
	@RequestMapping(value = "/delete/{ids}",method = RequestMethod.GET)
	@ResponseBody
	public Object delete(@PathVariable("ids") String ids) {
		int count = cmsGoodsService.deleteByPrimaryKeys(ids);
		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}

	@ApiOperation(value = "修改货物信息 GET")
	@RequiresPermissions("cms:goods:update")
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") int id, ModelMap modelMap) {
		CmsGoods cmsGoods = cmsGoodsService.selectByPrimaryKey(id);
            modelMap.put("goods", cmsGoods);

		return "/manage/goods/update.jsp";
	}

	@ApiOperation(value = "修改货物信息 POST")
	@RequiresPermissions("cms:goods:update")
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Object update(@PathVariable("id") int id, CmsGoods cmsGoods) {
		cmsGoods.setGoodsId(id);
		int count = cmsGoodsService.updateByPrimaryKeySelective(cmsGoods);

		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}
}
