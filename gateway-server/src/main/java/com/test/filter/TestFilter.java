package com.test.filter;

import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;

@Component
public class TestFilter implements GlobalFilter, Ordered {

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        System.out.println(request.getHeaders().get("Test"));
        List<String> value = request.getQueryParams().get("test");
        if(value != null && value.contains("1")) {
            //将ServerWebExchange向过滤器链的下一级传递
            return chain.filter(exchange);
        } else {
            //直接不在向下传递，然后返回响应
            return exchange.getResponse().setComplete();
        }

    }

    @Override
    public int getOrder() {
        return 2;
    }
}
