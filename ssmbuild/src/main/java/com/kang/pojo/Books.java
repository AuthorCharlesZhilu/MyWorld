package com.kang.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/*加上@Data之后除了有参构造函数基本的函数都有了，加上@AllArgsConstructor之后无参构造就没了，所以要加上无参注解*/

/**
 * @author Arthur
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Books {
    private int bookID;
    private String bookName;
    private int bookCounts;
    private String detail;
}
