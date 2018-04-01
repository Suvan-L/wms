package org.suvan.demo.rpc.service.impl;

import org.suvan.demo.rpc.api.DemoService;

/**
 * 实现DemoService接口
 */
public class DemoServiceImpl implements DemoService {

    @Override
    public String sayHello(String name) {
        return "hello " + name;
    }

}