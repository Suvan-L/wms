package org.suvan.cms.admin.controller.manage;

import com.alibaba.fastjson.JSONArray;
import com.google.common.collect.Lists;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.suvan.cms.dao.model.CmsGoods;
import org.suvan.cms.dao.model.CmsWarehouse;
import org.suvan.cms.dao.model.CmsWarehouseCapacity;
import org.suvan.cms.dao.model.CmsWarehouseCapacityExample;
import org.suvan.cms.rpc.api.CmsGoodsService;
import org.suvan.cms.rpc.api.CmsWarehouseCapacityService;
import org.suvan.cms.rpc.api.CmsWarehouseService;
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

	private CmsWarehouseCapacityService cmsWarehouseCapacityService;
    private CmsGoodsService cmsGoodsService;
	private CmsWarehouseService cmsWarehouseService;

	@Autowired
	public CmsWarehouseCapacityController (CmsWarehouseCapacityService cmsWarehouseCapacityService, CmsGoodsService cmsGoodsService,
                                           CmsWarehouseService cmsWarehouseService) {
	    this.cmsWarehouseCapacityService = cmsWarehouseCapacityService;
	    this.cmsGoodsService = cmsGoodsService;
	    this.cmsWarehouseService = cmsWarehouseService;
    }


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

		//暂时忽略排序功能
		//if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
		//	cmsWarehouseCapacityExample.setOrderByClause(sort + " " + order);
		//}

		List<CmsWarehouseCapacity> warehouseCapacityList = cmsWarehouseCapacityService.selectByExampleForOffsetPage(cmsWarehouseCapacityExample, offset, limit);

		List<JSONObject> resultList = Lists.newArrayList();
		for (CmsWarehouseCapacity warehouseCapacity: warehouseCapacityList) {
		    JSONObject jsonObject = new JSONObject();

            CmsGoods goods = cmsGoodsService.selectByPrimaryKey(warehouseCapacity.getGoodsId());
		    CmsWarehouse warehosue = cmsWarehouseService.selectByPrimaryKey(warehouseCapacity.getWarehouseCapacityId());

            jsonObject.put("warehouseCapacityId", warehouseCapacity.getWarehouseCapacityId());
            jsonObject.put("warehouseCapacityUseArea", warehouseCapacity.getUseArea());
		    jsonObject.put("goodsId", goods.getGoodsId());
		    jsonObject.put("goodsName", goods.getName());
		    jsonObject.put("goodsType", goods.getType());
		    jsonObject.put("goodsCount", goods.getCount());
		    jsonObject.put("warehouseId", warehosue.getWarehouseId());
		    jsonObject.put("warehouseAddress", warehosue.getAddress());
		    jsonObject.put("warehouseStatus", warehosue.getStatus());

		    resultList.add(jsonObject);
        }

        long total = cmsWarehouseCapacityService.countByExample(cmsWarehouseCapacityExample);

		Map<String, Object> result = new HashMap<>(2);
            result.put("rows", resultList);
            result.put("total", total);
		return result;
	}
}
