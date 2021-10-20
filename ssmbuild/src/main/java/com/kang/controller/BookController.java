package com.kang.controller;

import com.kang.pojo.Books;
import com.kang.service.BookService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
/**
 * @author Arthur
 */
@Controller
@RequestMapping("/book")
public class BookController {
    //controller层 调 service层

    /*@Autowired作用为将对象注入到容器之中
    当一个dao有两个实现类时可以使用（一个AccountDao接口有AccountDaoImpl实现类和AccountDaoImpl2实现类）
    需要用到@Qualifier注入指定的dao层实现类。避免二义性*/

    private final BookService bookService;

    public BookController(@Qualifier("BookServiceImpl") BookService bookService) {
        this.bookService = bookService;
    }
    /*Field injection is not recommended  ==  不再推荐使用字段注入
    * 可以基于构造函数的依赖注入
    基于setter的依赖注入
    基于字段的依赖注入

    *
    * */
    //查询全部的书籍，并且返回到一个书籍展示页面

    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> list = bookService.queryAllbook();
        /*Alt+Enter 自动补全List<Books> books =*/
        /*如果不用List<Books> list，出现两条相同的数据查询时会报错*/
        model.addAttribute("list",list);
        return "allBook";

    }
    /*跳转到增加书籍页面*/
    @RequestMapping("/toAddBook")
    public String toAddPaper(){
        return "addBook";
    }
    /*添加书籍地请求*/
    @RequestMapping("addBook")
    public String addBook(Books books){
        System.out.println("addBook=>"+books);
        bookService.addBook(books);
        return "redirect:/book/allBook";
        //重定向到@RequestMapping("/allBook")
    }
    /*跳转到修改页面*/
    @RequestMapping("/toUpdate/{bookId}")
    public String toUpdatePaper(@PathVariable("bookId") int id, Model model){
        Books books = bookService.queryBookById(id);
        model.addAttribute("QBook",books);
        return "updateBook";
    }
    /*修改书籍*/
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        System.out.println("updateBook=>"+books);
        int i = bookService.updateBook(books);
        if(i>0){
            System.out.println("添加books成功"+books);
        }
        /*理论上spring接管事务之后，不需要显示地配置事务，但是
        这里的update操作隐式地将前端获取到地bookname、bookcounts、detail递给了Service层然后Serviec递给dao地mapper处理时，发现邮递过来的
        东西少了一样bookid，前后端对应不上就会变成500*/
        return "redirect:/book/allBook";
    }

    /*删除书籍*/
    @RequestMapping("/deleteBook")
    public String deleteBook(int id){
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }
    /*查询书籍*/
    @RequestMapping("/queryBookByName")
    public String queryBookByName(String bookName , Model model){
        List<Books> books = bookService.queryBookByName(bookName);
        System.err.println("books=>"+books);
        if(books.isEmpty()){
            /*这里的判断条件不能是books==null 因为这个判断的是是否存在集合books，而books.isEmpty()判断的是集合存在时是否为空，这个集合是否有元素*/
            books =  bookService.queryAllbook();
            model.addAttribute("error","未查到");
        }
        model.addAttribute("list",books);
        return "allBook";

    }
    /*发现没有业务--》写业务--》发现没有dao写dao，，，这种自顶向下的写法出现了问题不好排查  ×
      最好就是，先写dao--》写Service--》写Controller，自底向上。。。。。√  */
}
