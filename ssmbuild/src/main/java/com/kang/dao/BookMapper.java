package com.kang.dao;

import com.kang.pojo.Books;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public interface BookMapper  {
    //增加一本书

    int addBook(Books books);
    //删除一本书

    int deleteBookById(@Param("bookId") int id);/*@Param注解的作用是给参数命名,参数命名后就能根据名字得到参数值,正确的将参数传入sql语句中 */
    //更新一本书

    int updateBook(Books books);
    //查询一本书
    @Select("select * from ssm_test_01.books where bookID = #{bookId}")
    /*但是这种注解的方式，对于条件较复杂的情况，不太建议这种方式，在字符串中难免会有很多错误，可读性很差。*/
    Books queryBookById(@Param("bookId") int id);
    //查询全部的书

     List<Books> queryAllbook();

     List<Books> queryBookByName(@Param("bookName") String bookName);/*@Param("bookName")，安全起见都加上*/
}
