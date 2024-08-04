package com.test.service.client;

import com.test.entity.User;
import org.springframework.stereotype.Component;

@Component
public class UserFallbackClient implements UserClient {

    @Override
    public User getUser(int uid) {
        User user = new User();
        user.setName("我是补救措施");
        return user;
    }
}
