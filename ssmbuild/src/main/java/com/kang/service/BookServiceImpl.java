package com.kang.service;

import com.kang.dao.BookMapper;
import com.kang.pojo.Books;

import java.util.List;
public class BookServiceImpl implements BookService{
    /*Service 调  dao层（组合dao）*/
    private BookMapper bookMapper;
    public void setBookMapper(BookMapper bookMapper){
        this.bookMapper=bookMapper;
    }
    @Override
    public int addBook(Books books) {
        /*可增加其他业务，也可交给spring的aop实现*/
        return bookMapper.addBook(books);
    }

    @Override
    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Books books) {
        System.out.println("BookServiceImpl.updateBook: "+books);
        return bookMapper.updateBook(books);
    }
/*对库的操作中不提交事务对库的修改都是失败的*/
    @Override
    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    @Override
    public List<Books> queryAllbook() {
        return bookMapper.queryAllbook();
    }

    @Override
    public List<Books> queryBookByName(String bookName) {
        return bookMapper.queryBookByName(bookName);
    }
}
