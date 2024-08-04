package com.test.service.client;

import com.test.entity.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(value = "userservice", fallback = UserFallbackClient.class) // 声明为userservice服务的http服务端,设置补救措施的实现类
public interface UserClient {

    @RequestMapping("/user/{uid}")
    User getUser(@PathVariable("uid") int uid);
}
