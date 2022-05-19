<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>注册页面</title>
    <style>
      *{
        margin: 0;
        padding: 0;
      }
      body{
        background-image: linear-gradient(to bottom right, lightblue, lightcoral);
      }
      div{
        padding-top: 100px;
        position: absolute;
        left: 550px;
      }
      h2{
        margin-bottom: 20px;
      }
      ul,li{
        list-style: none;
        margin-bottom: 20px;
      }
      .l1{
        width: 600px;
      }
      .l2,h2{
        position: relative;
        left: 100px;
      }
      p{
        color: green;
      }
    </style>
      <script src="js/jquery.min.js"></script>
      <script>
          $(function () {
              $("#name").blur(function (){
                  let name = $(this).val();
                  //发送ajax请求
                  $.get("findUserByNameServlet",{name:name},function (data) {
                      let span = $("#s_name");
                      if(data.userExist){
                          span.css("color","red");
                          span.html(data.msg);
                      }else{
                          span.css("color","green");
                          span.html(data.msg);
                      }
                  },"json");
              });
          });

      </script>
  </head>
  <body>
  <div>
    <h2>注册页面</h2>
  <form action="${pageContext.request.contextPath}/registerServlet" method="post">
    <ul>
      <li class="l1"><label for="name">&nbsp;&nbsp;用户名：&nbsp;</label>
        <input type="text" id="name" name="name" required><span id="s_name">${msg}</span></li>
      <li> <label for="password">注册密码：</label>
        <input type="password" id="password" name="password" required></li>
    </ul>
    <li class="l2">
    <input type="submit" value="注册" >
    <input type="reset" value="重置" >
    </li>
  </form>
    <p>温馨提示：已注册过的用户可以直接进行<a href="login.jsp">登录</a></p>
  </div>
  </body>
</html>
