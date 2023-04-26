<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86156
  Date: 2023/2/14
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>婚车租赁</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <!--移动设备优先-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <%--JQuery引入--%>
    <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/shoppingCon">订单管理 </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="/home">主页 <span class="sr-only">(current)</span></a></li>
                        <li><a href="/styleCon">婚礼主题 </a></li>
                        <li class="active"><a href="/carRentCon">婚车租赁 </a></li>
                        <li><a href="/dressCon">礼服租赁 </a></li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/home">
                            <img src="http://${profile}" style="width: 30px;height: 30px;border-radius: 50px">
                            欢迎您，${sessionScope.username}!</a></li>
                        <li><a href="/exit">退出</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
</div>

<%--上面为导航栏--%>
<%--下面是内容代码--%>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h2>婚车租赁</h2> <br>


            <table class="table table-bordered">
                <tr>
                    <th>效果图</th>
                    <th>名称</th>
                    <th>价格</th>
                    <th>在租数量</th>
                    <th>操作</th>
                </tr>

                <c:forEach items="${wedCarPageInfo.list}" var="wedCar">
                    <tr align="center">
                        <td><img src="http://${wedCar.c_photo}" width="200px" height="120px"></td>
                        <td>${wedCar.c_name}</td>
                        <td>${wedCar.c_money}</td>
                        <td>${wedCar.c_count}</td>
                        <td>
                            数量：<input type="text" name="goodsSize" value="1" id="goodsSize${wedCar.id}">
                            <button class="btn btn-success" onclick="fab('${wedCar.c_id}',${wedCar.c_count},${wedCar.id})">点击租赁</button>
                        </td>
                    </tr>
                </c:forEach>

            </table>
            <div align="center">
                <a href="/carRentCon"><button class="btn btn-default">首页</button></a>
                &nbsp;&nbsp;
                <a href="/carRentCon?pageNum=${wedCarPageInfo.prePage}"><button class="btn btn-default">上一页</button></a>
                &nbsp;
                <a href="/carRentCon?pageNum=${wedCarPageInfo.pageNum+1}"><button class="btn btn-default">下一页</button></a>
                &nbsp;&nbsp;
                <a href="/carRentCon?pageNum=${wedCarPageInfo.pages}"><button class="btn btn-default">尾页</button></a>

            </div>

            <a href="/home" class="btn btn-default">返回主页</a>
            &nbsp;&nbsp;
            <a href="/shoppingCon" class="btn btn-warning">查看购物车</a>


        </div>
        <div class="col-md-2"></div>
    </div>
</div>

</body>
</html>

<script>
    function fab(c_id, kunCun, id) {
        //租赁数量
        var goodsSize = $("#goodsSize"+id).val();
        if (goodsSize > kunCun){
            alert("租赁车辆不足！")
        }else {

            $.ajax({
                url : "addCar",
                data : {"goods_id" : c_id, "goodsSize" : goodsSize},
                dataType : "text",
                success : function (data) {
                    if (data == "ok"){
                        alert("租赁成功！")
                        location.replace(location)
                    }else {
                        alert("租赁失败！")
                    }
                }
            })

        }

    }
</script>
