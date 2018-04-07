package org.suvan.cms.web.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 *
 */
@Component
public class TestTaskImpl {

    @Scheduled(cron = "0 0/10 * * * ?")
    public void test() {
        System.out.println("Task");
    }

}
