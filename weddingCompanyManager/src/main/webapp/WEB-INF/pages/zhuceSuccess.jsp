<%--
  Created by IntelliJ IDEA.
  User: 86156
  Date: 2022/12/22
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body>
<h2 style="color: green" onload="refer()" >注册成功</h2>
<h4 style="color: red" id="success"></h4>

<script>

    var t=3;

    setInterval("refer()",1000);

    function refer(){

        if(t==0){

            location.href="login.jsp";

        }

        document.getElementById('success').innerHTML=""+t+"秒后跳转到登录界面";

        t--;

    }
</script>
</body>
</html>
