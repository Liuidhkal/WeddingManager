<%--
  Created by IntelliJ IDEA.
  User: 86156
  Date: 2022/12/21
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <!--移动设备优先-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <%--JQuery引入--%>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<%
    Object image = request.getAttribute("image");
%>
<body background="图片1.jpg" style="background-size: 100%">

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <%--<h1>用户管理系统</h1>--%>
            <%--<h2>登录</h2>--%>
        </div>


        <div class="col-md-3" style="background-color: white">
            <div style="padding-top: 40px">


                <h1 style="color: palevioletred ">婚庆公司管理系统</h1>
                <br>
                <form action="login" method="post" >
                    <div class="form-group" id="img" style="width: 100px ; height: 100px">
                        <%--头像--%>
                        <img src="/file/touxiang.jpg" style="width: 100px; height: 100px;border-radius: 50px" id="img1">

                    </div>
                    <div style="color: red">${message}</div>
                    <div class="form-group">
                        <label for="username">用户名</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="username" style="width: 80%">
                        <span style="color: red" id="spanUsername"></span>
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="password" style="width: 80%">
                    </div>
                    <div style="color: red">${message2}</div>

                    <%--输入验证码--%>
                    <div class="form-group">
                        <label for="password">验证码</label>
                        <input type="text" class="form-control" id="yanzhengma" name="yanzhengma" placeholder="请输入验证码" style="width: 35%">
                        <span  id="codeLose" style="color: red"></span>
                    </div>
                    <div>

                        <img src="${pageContext.request.contextPath}/code" title="看不清？换一张" width="35%" onclick="this.src = this.src + '?'">

                    </div>



                    <%--<button  class="btn btn-default" id="submit1">登录</button>--%>
                    <%--<input type="button" value="登录" id="submit1" class="btn btn-default">--%>
                    &nbsp;&nbsp;&nbsp;
                    <input type="submit"  id="submit_s" value="登录"  hidden>
                    <%--<a href="register.jsp">没有账号？点击注册</a>--%>

                </form>
                <button class="btn btn-default" id="bt2">登录</button>
                <a href="register.jsp">没有账号？点击注册</a>
<br>
<br>

            </div>
        </div>

            <div class="col-md-7">

            </div>
        </div>


    </div>


</body>
</html>
<script>
    $("#username").keyup(function (event) {
        var username = $("#username").val();

        /*获取到输入框中的username后用ajax异步请求*/
        //创建对象
        var xmlhttp;
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }
        else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }

        //发送请求
        xmlhttp.open("GET","checkprofile?username="+username,true);
        xmlhttp.send();
        //响应
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                var v = xmlhttp.responseText;

                if (v != "null"){//显示头像
                    $("#img1").prop("src","http://"+v)


                }else {

                    $("#img1").prop("src","/file/touxiang.jpg")
                    /*$("#img").html("<img src='touxiang.jpg' styleCon='width: 100px; height: 100px' id='img1''>")*/

                }
            }
        }



    });


    $("#bt2").click(function () {

        var yanzhengma = $("#yanzhengma").val();

        $.ajax({
            url : "ifCode",
            type : "post",
            data : {"yanzhengma": yanzhengma},
            dataType : "text",
            success : function (data) {
                if (data == "ok"){
                    $("#codeLose").empty()
                    $("#submit_s").click()
                }else {
                    $("#codeLose").text("验证码有误，请重新输入！")
                }
            }
        })

    })




</script>

