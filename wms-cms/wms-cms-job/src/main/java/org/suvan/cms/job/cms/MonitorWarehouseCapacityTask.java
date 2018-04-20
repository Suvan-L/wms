package org.suvan.cms.job.cms;

import org.springframework.beans.factory.annotation.Autowired;
import org.suvan.cms.dao.model.CmsWarehouseCapacity;
import org.suvan.cms.dao.model.CmsWarehouseCapacityExample;
import org.suvan.cms.rpc.api.CmsWarehouseCapacityService;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * 监控仓库库存容量
 *
 * @author Suvan
 */
public class MonitorWarehouseCapacityTask {




    /**
     * 程序入口
     */
    public static void main(String [] args) {
        MonitorTask task = new MonitorTask();

        //执行
        ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
        service.scheduleAtFixedRate(task, 0, 2, TimeUnit.SECONDS);
    }

}

class MonitorTask implements Runnable {

    @Autowired
    private CmsWarehouseCapacityService warehouseCapacityService;

    @Override
    public void run () {
        CmsWarehouseCapacityExample cmsWarehouseCapacityExample = new CmsWarehouseCapacityExample();

        int offset = 0;
        int limit = 10;

        System.out.println("***************************  ****************************");
        List<CmsWarehouseCapacity> warehouseCapacityList = warehouseCapacityService.selectByExampleForOffsetPage(cmsWarehouseCapacityExample, offset, limit);
        System.out.println("***************************  ****************************");
        for (CmsWarehouseCapacity warehouseCapacity: warehouseCapacityList) {
            System.out.println(warehouseCapacity.getUseArea());
        }
    }
}
