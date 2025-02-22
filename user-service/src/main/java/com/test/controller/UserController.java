package com.test.controller;

import com.test.entity.User;
import com.test.service.UserService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class UserController {
    @Resource
    UserService userService;

    @RequestMapping("/user/{uid}")
    public User getUser(@PathVariable("uid") int uid) {
        System.out.println("我被调用了");
        return userService.getUserById(uid);
    }
}
