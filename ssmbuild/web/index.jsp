<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 2021/10/14
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>首页</title>
    <style>
      a{
          text-decoration: none;
          color:black;
          font-size:18px;
      }
      h3{
        width: 150px;
        height:38px;
        margin: 100px auto;
        text-align:center;
        line-height:38px;
        background: deepskyblue;
        border-radius:4px;
      }
    </style>
  </head>

  <body>
  <h3>
    <a href="${pageContext.request.contextPath}/book/allBook">进入书籍页面</a><%--${pageContext.request.contextPath}/book/allBook"
            取绝对地址，为了相互发布项目依旧能很稳定地运行--%>
  </h3>
  </body>
</html>
