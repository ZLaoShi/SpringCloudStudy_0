package com.test.service.client;

import com.test.entity.Book;
import org.springframework.stereotype.Component;

@Component
public class BookFallbackClient implements BookClicent{

    @Override
    public Book findBookById(int bid) {
        Book book = new Book();
        book.setTitle("我是book模块的补救措施");
        return book;
    }
}
