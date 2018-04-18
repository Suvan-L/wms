package org.suvan.cms.admin.controller.manage;

import com.google.common.collect.Lists;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONObject;
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
import org.suvan.cms.dao.model.CmsCustomer;
import org.suvan.cms.dao.model.CmsGoods;
import org.suvan.cms.dao.model.CmsRecordOut;
import org.suvan.cms.dao.model.CmsRecordOutExample;
import org.suvan.cms.dao.model.CmsWarehouse;
import org.suvan.cms.dao.model.CmsWarehouseCapacity;
import org.suvan.cms.dao.model.CmsWarehouseCapacityExample;
import org.suvan.cms.rpc.api.CmsCustomerService;
import org.suvan.cms.rpc.api.CmsGoodsService;
import org.suvan.cms.rpc.api.CmsRecordOutService;
import org.suvan.cms.rpc.api.CmsWarehouseCapacityService;
import org.suvan.cms.rpc.api.CmsWarehouseService;
import org.suvan.common.base.BaseController;
import org.suvan.common.util.StringUtil;

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

	private CmsRecordOutService cmsRecordOutService;
	private CmsCustomerService cmsCustomerService;
	private CmsGoodsService cmsGoodsService;
	private CmsWarehouseService cmsWarehouseService;
	private CmsWarehouseCapacityService cmsWarehouseCapacityService;

	@Autowired
	public CmsRecordOutController (CmsRecordOutService cmsRecordOutService, CmsCustomerService cmsCustomerService,
                                   CmsGoodsService cmsGoodsService, CmsWarehouseService cmsWarehouseService,
                                   CmsWarehouseCapacityService cmsWarehouseCapacityService) {
	    this.cmsRecordOutService = cmsRecordOutService;
	    this.cmsCustomerService = cmsCustomerService;
	    this.cmsGoodsService = cmsGoodsService;
	    this.cmsWarehouseService = cmsWarehouseService;
	    this.cmsWarehouseCapacityService = cmsWarehouseCapacityService;
    }


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
			cmsRecordOutExample.setOrderByClause(StringUtil.humpToLine(sort) + " " + order);
		}

		List<CmsRecordOut> recordOutList = cmsRecordOutService.selectByExampleForOffsetPage(cmsRecordOutExample, offset, limit);

        List<JSONObject> resultList = Lists.newArrayList();
        for (CmsRecordOut recordOut: recordOutList) {
            JSONObject jsonObject = new JSONObject();

            CmsCustomer customer = cmsCustomerService.selectByPrimaryKey(recordOut.getCustomerId());
            CmsGoods goods = cmsGoodsService.selectByPrimaryKey(recordOut.getGoodsId());
            CmsWarehouse warehouse = cmsWarehouseService.selectByPrimaryKey(recordOut.getWarehouseId());

            //提取部分属性
            jsonObject.put("recordOutId", recordOut.getRecordOutId());
            jsonObject.put("amount", recordOut.getAmount());
            jsonObject.put("ctime", recordOut.getCtime());
            jsonObject.put("customerId", customer.getCustomerId());
            jsonObject.put("customerCompany", customer.getCompany());
            jsonObject.put("goodsId", goods.getGoodsId());
            jsonObject.put("goodsName", goods.getName());
            jsonObject.put("warehouseId", warehouse.getWarehouseId());
            jsonObject.put("warehouseAddress", warehouse.getAddress());

            //添加至集合
            resultList.add(jsonObject);
        }

		long total = cmsRecordOutService.countByExample(cmsRecordOutExample);

		Map<String, Object> result = new HashMap<>(2);
            result.put("rows", resultList);
            result.put("total", total);
		return result;
	}

	@ApiOperation(value = "添加出库记录 GET")
	@RequiresPermissions("cms:record:out:create")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap modelMap) {
		CmsRecordOutExample cmsRecordOutExample = new CmsRecordOutExample();
		//cmsRecordOutExample.setOrderByClause("record_out_id DESC");

		List<CmsRecordOut> cmsRecordOutList = cmsRecordOutService.selectByExample(cmsRecordOutExample);
            modelMap.put("cmsRecordOutExample", cmsRecordOutList);
		return "/manage/record/out/create.jsp";
	}

	@ApiOperation(value = "添加出库记录 POST")
	@RequiresPermissions("cms:record:out:create")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Object create(CmsRecordOut cmsRecordOut) {
		cmsRecordOut.setCtime(System.currentTimeMillis());
		int count = cmsRecordOutService.insertSelective(cmsRecordOut);

        //更新货物记录（减少）
        CmsGoods goods = cmsGoodsService.selectByPrimaryKey(cmsRecordOut.getGoodsId());
        CmsGoods updateGoods = new CmsGoods();
            updateGoods.setGoodsId(goods.getGoodsId());
            updateGoods.setCount(goods.getCount() - cmsRecordOut.getAmount());
        cmsGoodsService.updateByPrimaryKeySelective(updateGoods);

        //更新仓库库存状态（减少）
        CmsWarehouse warehouse = cmsWarehouseService.selectByPrimaryKey(cmsRecordOut.getWarehouseId());
        CmsWarehouse updateWarehouse = new CmsWarehouse();
            updateWarehouse.setWarehouseId(cmsRecordOut.getWarehouseId());

            int alreadyUseGoodsArea = warehouse.getGoodsArea() - cmsRecordOut.getAmount() * goods.getSize();
            updateWarehouse.setGoodsArea(alreadyUseGoodsArea);
            updateWarehouse.setStatus((double) alreadyUseGoodsArea / warehouse.getArea());
        cmsWarehouseService.updateByPrimaryKeySelective(updateWarehouse);


        //更新库存容量（货品 & 仓库 ---> 更新已使用面积）
        CmsWarehouseCapacity warehouseCapacity = new CmsWarehouseCapacity();
            warehouseCapacity.setGoodsId(goods.getGoodsId());
            warehouseCapacity.setWarehouseId(warehouse.getWarehouseId());
            warehouseCapacity.setUseArea(alreadyUseGoodsArea);
        CmsWarehouseCapacityExample updateCapacityExample = new CmsWarehouseCapacityExample();
            updateCapacityExample.createCriteria()
                    .andGoodsIdEqualTo(goods.getGoodsId())
                    .andWarehouseIdEqualTo(warehouse.getWarehouseId());

        cmsWarehouseCapacityService.updateByExampleSelective(warehouseCapacity, updateCapacityExample);

		return new CmsResult(CmsResultConstant.SUCCESS, count);
	}
}
