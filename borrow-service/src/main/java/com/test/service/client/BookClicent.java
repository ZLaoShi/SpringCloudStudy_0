package com.test.service.client;

import com.test.entity.*;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(value = "bookservice", fallback = BookFallbackClient.class)
public interface BookClicent {

    @RequestMapping("/book/{bid}")
    Book findBookById(@PathVariable("bid") int bid);

}
