<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书信息页面</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        caption {
            font-size: 20px;
            letter-spacing: 5px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            margin: 30px auto;
        }

        tr {
            height: 50px;
            line-height: 50px;
        }

        tr:hover {
            background-color: #00ff90;
        }

        td, th {
            width: 180px;
            text-align: center;
            border: 1px solid black;
        }

        td:hover {
            background-color: green;
        }

        .button {
            width: 50px;
            margin-right: 5px;
            height: 30px;
            background-color: limegreen;
            color: white;
        }

        .red {
            background-color: red;
        }

        .b1 {
            position: absolute;
            right: 200px;
            background-color: #0088ff;
            width: 80px;
            height: 30px;
        }

        #b {
            height: 30px;
            border: 1px solid black;
        }

        #b2 {
            background-color: #00ffa6;
            width: 50px;
            height: 30px;
        }

        div.d1 {
            position: absolute;
            left: 200px;
        }

        .d2 {
            width: 1280px;
            margin: 0 auto;
            position: relative;
        }

        span {
            color: red;
            font-size: 25px;
            margin-left: 400px;
        }
    </style>
    <script src="js/jquery.min.js"></script>
    <script>
        function deleteBook(id) {
            if (confirm("您确定要删除吗？")) {
                location.href = "${pageContext.request.contextPath}/deleteBookServlet?id=" + id;
            }
        }

        function updateBook(id) {
            location.href = "${pageContext.request.contextPath}/findBookByIdServlet?id=" + id;
        }

        function findBookByName() {
            let value = document.getElementById("b").value;
            if (value !== "") {
                location.href = "${pageContext.request.contextPath}/findBookByNameServlet?name=" + value;
            }
        }
    </script>
</head>
<body>
${user1.name},欢迎您！
<div class="d2">
    <div class="d1">
        <input type="text" id="b" placeholder="请输入书名" name="name">
        <a href="javascript:findBookByName()">
            <button id="b2">查询</button>
        </a>
    </div>
    <a href="addBook.jsp">
        <button class="b1">新增书籍</button>
    </a>
    <table cellspacing="0">
        <caption>书籍列表</caption>
        <tr bgcolor="#5f9ea0">
            <th>编号</th>
            <th>类别</th>
            <th>书名</th>
            <th>价格</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${books}" var="book" varStatus="s">
            <tr>
                <td>${s.count}</td>
                <td>${book.type}</td>
                <td>${book.name}</td>
                <td>${book.price}</td>
                <td>
                    <a href="javascript:updateBook(${book.id})">
                        <button class="button">修改</button>
                    </a>
                    <a href="javascript:deleteBook(${book.id})">
                        <button class="button red">删除</button>
                    </a>
                </td>
            </tr>
        </c:forEach>

    </table>
    <span>${error}</span>
</div>
</body>
</html>
