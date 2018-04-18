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
import org.suvan.cms.dao.model.CmsGoods;
import org.suvan.cms.dao.model.CmsRecordIn;
import org.suvan.cms.dao.model.CmsRecordInExample;
import org.suvan.cms.dao.model.CmsSupplier;
import org.suvan.cms.dao.model.CmsWarehouse;
import org.suvan.cms.dao.model.CmsWarehouseCapacity;
import org.suvan.cms.dao.model.CmsWarehouseCapacityExample;
import org.suvan.cms.rpc.api.CmsGoodsService;
import org.suvan.cms.rpc.api.CmsRecordInService;
import org.suvan.cms.rpc.api.CmsSupplierService;
import org.suvan.cms.rpc.api.CmsWarehouseCapacityService;
import org.suvan.cms.rpc.api.CmsWarehouseService;
import org.suvan.common.base.BaseController;
import org.suvan.common.util.StringUtil;

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

	private CmsRecordInService cmsRecordInService;
    private CmsSupplierService cmsSupplierService;
    private CmsGoodsService cmsGoodsService;
    private CmsWarehouseService cmsWarehouseService;
    private CmsWarehouseCapacityService cmsWarehouseCapacityService;

    @Autowired
    public CmsRecordInController(CmsRecordInService cmsRecordInService, CmsSupplierService cmsSupplierService,
                                 CmsGoodsService cmsGoodsService, CmsWarehouseService cmsWarehouseService,
                                 CmsWarehouseCapacityService cmsWarehouseCapacityService) {
        this.cmsRecordInService = cmsRecordInService;
        this.cmsSupplierService = cmsSupplierService;
        this.cmsGoodsService = cmsGoodsService;
        this.cmsWarehouseService = cmsWarehouseService;
        this.cmsWarehouseCapacityService = cmsWarehouseCapacityService;
    }

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

		//排序功能
		if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
			cmsRecordInExample.setOrderByClause(StringUtil.humpToLine(sort) + " " + order);
		}

        List<CmsRecordIn> recordInList = cmsRecordInService.selectByExampleForOffsetPage(cmsRecordInExample, offset, limit);

        List<JSONObject> resultList = Lists.newArrayList();
        for (CmsRecordIn recordIn: recordInList) {
            JSONObject jsonObject = new JSONObject();

            CmsSupplier supplier = cmsSupplierService.selectByPrimaryKey(recordIn.getSupplierId());
            CmsGoods goods = cmsGoodsService.selectByPrimaryKey(recordIn.getGoodsId());
            CmsWarehouse warehouse = cmsWarehouseService.selectByPrimaryKey(recordIn.getWarehouseId());

            //提取部分属性
            jsonObject.put("recordInId", recordIn.getRecordInId());
            jsonObject.put("amount", recordIn.getAmount());
            jsonObject.put("ctime", recordIn.getCtime());
            jsonObject.put("supplierId", supplier.getSupplierId());
            jsonObject.put("supplierCompany", supplier.getCompany());
            jsonObject.put("goodsId", goods.getGoodsId());
            jsonObject.put("goodsName", goods.getName());
            jsonObject.put("warehouseId", warehouse.getWarehouseId());
            jsonObject.put("warehouseAddress", warehouse.getAddress());

            //添加至集合
            resultList.add(jsonObject);
        }


		long total = cmsRecordInService.countByExample(cmsRecordInExample);

		Map<String, Object> result = new HashMap<>(2);
            result.put("rows", resultList);
            result.put("total", total);
		return result;
	}

	@ApiOperation(value = "新增入库记录 GET")
	@RequiresPermissions("cms:record:in:create")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap modelMap) {
		CmsRecordInExample cmsSupplierExample = new CmsRecordInExample();
		List<CmsRecordIn> cmsTopics = cmsRecordInService.selectByExample(cmsSupplierExample);
            modelMap.put("cmsTopics", cmsTopics);

		return "/manage/record/in/create.jsp";
	}

	@ApiOperation(value = "新增入库记录 POST")
	@RequiresPermissions("cms:record:in:create")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Object create(CmsRecordIn cmsRecordIn) {
		cmsRecordIn.setCtime(System.currentTimeMillis());
		int count = cmsRecordInService.insertSelective(cmsRecordIn);

		//更新货物记录（增加）
        CmsGoods goods = cmsGoodsService.selectByPrimaryKey(cmsRecordIn.getGoodsId());
        CmsGoods updateGoods = new CmsGoods();
            updateGoods.setGoodsId(goods.getGoodsId());
            updateGoods.setCount(goods.getCount() + cmsRecordIn.getAmount());
        cmsGoodsService.updateByPrimaryKeySelective(updateGoods);

	    //更新仓库库存状态（增加）
        CmsWarehouse warehouse = cmsWarehouseService.selectByPrimaryKey(cmsRecordIn.getWarehouseId());
        CmsWarehouse updateWarehouse = new CmsWarehouse();
            updateWarehouse.setWarehouseId(cmsRecordIn.getWarehouseId());

            int alreadyUseGoodsArea = warehouse.getGoodsArea() + cmsRecordIn.getAmount() * goods.getSize();
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
