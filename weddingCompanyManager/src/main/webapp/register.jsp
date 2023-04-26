<%--
  Created by IntelliJ IDEA.
  User: 86156
  Date: 2022/12/20
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <!--移动设备优先-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <%--JQuery引入--%>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<body background="图片1.jpg" style="background-size: 100%">

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <%--<h1>用户管理系统</h1>--%>
        </div>

        <div class="col-md-3" style="background-color: white;padding-top: 40px">
            <h1 style="color: palevioletred ">注册</h1>
            <br><br>
            <form action="register" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="username">
                    <span style="color: red" id="spanUsername"></span>
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <label for="profile">头像</label>
                    <input type="file" id="profile" name="profile">
                    <p class="help-block">请选择头像</p>
                </div>
                <div class="checkbox">
                    <%--<label>
                      <input type="checkbox"> 选择
                    </label>--%>
                </div>
                <br>

                <input type="submit" id="bt_submit" hidden>
            </form>
            <a href="${pageContext.request.contextPath}/login.jsp"><button class="btn btn-default">返回登录界面</button> </a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button  class="btn btn-default" id="bt_1">注册</button>
            <br>
            <br>
            <div class="col-md-7">

            </div>
        </div>


    </div>
</div>
</body>
</html>


<script>
    /*用户框发生失去焦点事件时，获取框中内容，与数据库中用户名判断是否重复*/
    $("#username").blur(function (){
        var username = $("#username").val();
        //alert(username)
        /*AJAX创建对象*/
        var xmlhttp;
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }
        else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        /*请求*/
        xmlhttp.open("GET","check?username="+username,true);
        xmlhttp.send();
        /*响应*/
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                var v = xmlhttp.responseText;
                if (v == "1"){
                    $("#spanUsername").text("用户名已存在！")
                } else {
                    $("#spanUsername").empty()
                }
            }
        }



    })

    $("#bt_1").click(function () {

        $("#bt_submit").click()
    })
</script>
