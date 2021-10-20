<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 2021/10/17
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
    <%--bookstrap--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表----显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column" style="display: inline;width: 35%; ">
            <%--toAddBook--%>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook" style="padding:10px 17px;margin-right: 8px;">新增书籍</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook" style="padding:10px 17px;">显示全部书籍</a>
        </div>
        <div class="col-md-8 column" style="display: inline;width: 65%;">
           <%--查询书籍--%>
            <form class="form-inline" action="${pageContext.request.contextPath}/book/queryBookByName" method="post" style="float:left; width:80%; ">
                <span style="color:red;font-weight: bold">${error}</span>
                <input style="display: inline; width:70%;" type="text" name="bookName" class="form-control" placeholder="请输入要查询的书籍名称">
                <input style="display: inline; width:20%;" type="submit" value="查询" class="btn btn-primary">
            </form>
           <%--通过display:block；与display:inline;轻松实现两类元素的转换
             display:inline-block；
            作用：将对象呈现为inline对象，但是对象的内容作为block对象呈现。之后的内联对象会被排列在同一行内。
            比如我们可以给一个link（a元素）inline-block属性值，使其既具有block的宽度高度特性又具有inline的同行特性。~~~--%>
        </div>
    </div>
    <div class="col-md-12 column" style="height: 5px;"></div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-bordered table-striped "><%--table-striped   使表单有格子  table-hover     隔行变色                       --%>
                <thead><%--表格头--%>
                    <tr>
                        <th>书籍编号</th>
                        <th>书籍名称</th>
                        <th>书籍数量</th>
                        <th>书籍详情</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <%--书籍从数据库查询出来，从list中遍历出来--%>
                <body>
                    <c:forEach var="book" items="${list}">
                        <tr>
                            <td>${book.bookID}</td>
                            <td>${book.bookName}</td>
                            <td>${book.bookCounts}</td>
                            <td>${book.detail}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/book/toUpdate/${book.bookID}">修改</a><%--${book.bookID}==${<c:forEach>.var.bookID}}--%>
                                &nbsp;  |  &nbsp;
                                <a href="${pageContext.request.contextPath}/book/deleteBook?id=${book.bookID}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                   <%-- <c:forEach var="book" items="${requestScope.get('list')}">&lt;%&ndash;${requestScope}操作的是request的作用域，相当于request.getAttribute();&ndash;%&gt;
                        <tr>
                            <td>${book.bookID}</td>
                            <td>${book.bookName}</td>
                            <td>${book.bookCounts}</td>
                        </tr>
                    </c:forEach>--%>
                </body>
            </table>
        </div>
    </div>
</div>

</body>
</html>
