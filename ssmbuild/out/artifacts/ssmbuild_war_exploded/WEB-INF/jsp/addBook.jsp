<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 2021/10/17
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增书籍</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1>
                        <small>新增书籍</small>
                    </h1>
                </div>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/book/addBook" method="post">
            <div  class="form-group">
                <label for="bkname">书籍名称:</label>
                <input type="text" class="form-control" id="bkname"  name="bookName" required="required"><%--重点注意:name属性值必须和实体类定义的名相同，否则查询失败--%>
            </div><%--如果使用required属性，则字段是必填（或必选）的。--%>
            <div  class="form-group">
                <label for="bkcount">书籍数量:</label>
                <input type="text" class="form-control" id="bkcount" name="bookCounts" required="required">
            </div>
            <div  class="form-group">
                <label for="bkdetail">书籍描述:</label>
                <input type="text" class="form-control" id="bkdetail" name="detail" required="required">
            </div><%--name字段最好保证，数据库字段==pojo.Books==BookMapper.xml的查询字段--%>
            <div class="form-group">
                <input type="submit" class="form-control" value="添加">
            </div>
            <%--label 元素不会向用户呈现任何特殊效果。不过，它为鼠标用户改进了可用性。如果您在 label 元素内点击文本，就会触发此控件。就是说，当用户选择该标签时，浏览器就会自动将焦点转到和标签相关的表单控件上。--%>
      <%--      <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div class="form-group">
                <label for="exampleInputFile">File Input</label>
                <input type="file"  id="exampleInputFile" >
                <p class="help-block">Example block-lever help text here.</p>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox">Check me out
                </label>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>--%>
        </form>
    </div>


</body>
</html>
