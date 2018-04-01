package org.suvan.demo.rpc.api;

/**
 * 降级实现DemoService接口

 */
public class DemoServiceMock implements DemoService {

    @Override
    public String sayHello(String name) {
        return null;
    }

}
