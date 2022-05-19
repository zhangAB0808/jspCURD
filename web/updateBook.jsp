
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改图书页面</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body{
            background-color: #c2e97a;
        }
        div {
            text-align: center;
        }
        h2{
            margin-top: 50px;
            margin-bottom: 20px;
        }
        ul{
            list-style: none;
        }
        li{
            margin-bottom: 20px;
            font-size: 20px;
        }
        .i1{
            width: 300px;
            height: 40px;
        }
        .i2{
            width: 80px;
            height: 50px;
            margin-right: 25px;
            background-color: #20b27f;
        }
    </style>
</head>
<body>
<div>
    <h2 text-align="center">修改图书页面</h2>
    <form action="${pageContext.request.contextPath}/updateBookByIdServlet" method="post">
        <input type="hidden" name="id" value="${book.id}">
        <ul>
            <li><label for="type">类型：</label><input type="text" id="type" name="type" value="${book.type}" class="i1"></li>
            <li><label for="name">书名：</label><input type="text" id="name" name="name" value="${book.name}" class="i1"></li>
            <li><label for="price">价格：</label><input type="text" id="price" name="price" value="${book.price}" class="i1"></li>
            <li>
                <input type="submit" class="i2" value="提交修改" >
                <input type="reset" class="i2" value="重置">
            </li>
        </ul>
    </form>
</div>
</body>
</html>
