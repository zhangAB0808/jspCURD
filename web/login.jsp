
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            background-image: linear-gradient(to bottom right, #fc468f, #3fe5fb);
        }
        div{
            padding-top: 100px;
            text-align: center;
        }
        h2{
            margin-bottom: 20px;
        }
        ul,li{
            list-style: none;
            margin-bottom: 20px;
        }
        p{
            color: red;
        }
    </style>
</head>
<body>
<div>
    <h2>登录页面</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <ul>
            <li><label for="name">用户名：&nbsp;</label>
                <input type="text" id="name" name="name" required>
            <li> <label for="pwd">登录密码：</label>
                <input type="password" id="pwd" name="password" required></li>
        <li>
            <input type="submit" value="登录" >
            <input type="reset" value="重置" >
        </li></ul>
    </form>
    <p>${msg}</p>
</div>
</body>
</html>
