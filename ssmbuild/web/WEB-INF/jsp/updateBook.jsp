<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 2021/10/17
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function turn(){
            var domInput = document.getElementById('bkname');//找到id是ipt的input节点
            var bkname = domInput.value;//获取bkcount这个值
            var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？ ]")
            if (pattern.test(bkname)){
                alert("修改的书籍名称不能有特殊字符或英文字母");
                document.getElementById("updateform").action="${pageContext.request.contextPath}/book/toUpdate/${QBook.bookID}"
            }
            ;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1>
                        <small>修改书籍</small>
                    </h1>
                </div>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/book/updateBook" method="post" id="updateform">
            <%--input 的name字段最好保证，数据库字段==pojo.Books==BookMapper.xml的查询字段--%>
            <%--onkeyup和onafterpaste 能禁止输入数字1以外的值  --%>
            <%--出现了问题，我们提交了修改地SQL请求，但是修改失败，出吃考虑事务问题，但是配置好aop后依旧失败--%>
            <%--看一下SQL语句是否执行失败，SQL执行失败，修改未完成--%>
            <%--解决办法:前端传递隐藏域--%>
            <input type="hidden" name="bookID" value="${QBook.bookID}"/><%--BookController.toupdate.model.addAttribute("QBook",books);--%>
            <div  class="form-group">
                <label for="bkname">书籍名称:</label>
                <input type="text" class="form-control" id="bkname"  name="bookName" value="${QBook.bookName}" required="required"><%--重点注意:name属性值必须和实体类定义的名相同，否则查询失败--%>
            </div><%--如果使用required属性，则字段是必填（或必选）的。--%>
            <div  class="form-group">
                <label for="bkcount">书籍数量:</label>
                <input type="text" class="form-control" id="bkcount" name="bookCounts" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'')"
                       　　　　　　 value="${QBook.bookCounts}" required="required">
            </div>
            <div  class="form-group">
                <label for="bkdetail">书籍描述:</label>
                <input type="text" class="form-control" id="bkdetail" name="detail" value="${QBook.detail}" required="required">
            </div>
            <div class="form-group">
                <input type="submit" class="form-control" value="修改" onclick="turn()">
            </div>
        </form>
    </div>
</body>
</html>

