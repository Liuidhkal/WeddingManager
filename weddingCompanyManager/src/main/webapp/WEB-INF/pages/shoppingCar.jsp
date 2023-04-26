<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86156
  Date: 2023/2/14
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
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
                        <li><a href="/carRentCon">婚车租赁 </a></li>
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


<%--上面是导航栏--%>
<%--下面是内容代码--%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>

        <div class="col-md-8">
            <h2>购物车</h2>
            <br>
            <button type="button" class="btn btn-primary" id="delAll">批量删除</button>
            <table class="table table-hover">
                <tr>
                    <th><input type="checkbox" id="checkedAll">&nbsp;&nbsp;全选/全不选</th>
                    <th>预览图</th>
                    <th>商品名称</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>总价</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${carPageInfo.list}" var="shopcar">
                    <tr>
                        <td align="center"><input type="checkbox" name="checked" value="${shopcar.id}"></td>
                        <td><img src="http://${shopcar.goods_photo}" width="120px" height="70px"></td>
                        <td>${shopcar.goods_name}</td>
                        <td>${shopcar.goods_money}</td>
                        <td>${shopcar.goods_number}</td>
                        <td>${shopcar.goods_money*shopcar.goods_number}</td>
                        <td>
                            <button class="btn btn-danger" onclick="del(${shopcar.id},${shopcar.goods_number})">删除</button>
                        </td>
                    </tr>
                </c:forEach>

            </table>

           <%-- <a href="goods?start=1"><button class="btn btn-primary">商品列表</button> </a>--%>
            <div align="center">
                <a href="/shoppingCon"><button class="btn btn-default">首页</button></a>
                &nbsp;&nbsp;
                <a href="/shoppingCon?pageNum=${carPageInfo.prePage}"><button class="btn btn-default">上一页</button></a>
                &nbsp;
                <a href="/shoppingCon?pageNum=${carPageInfo.pageNum+1}"><button class="btn btn-default">下一页</button></a>
                &nbsp;&nbsp;
                <a href="/shoppingCon?pageNum=${carPageInfo.pages}"><button class="btn btn-default">尾页</button></a>

            </div>&nbsp;&nbsp;

            <a href="/home"><button class="btn btn-default">返回主页</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/pay.jsp">
                <button class="btn btn-success">点击付款</button>
            </a>

        </div>
        <div class="col-md-2">
            <img src="/file/gg3.jpg" width="55%">
        </div>
    </div>
</div>

</body>
</html>
<script>

    function del(id,number) {
        $.ajax({
            url : "delCar",
            type : "post",
            data : {"id" : id, "number" : number},
            dataType : "text",
            success : function (data) {
                if (data == "ok"){
                    //alert("删除成功！")
                    location.replace(location)
                }else {
                    alert("删除失败！")
                }
            }
        })
    }


    /*全选全不选*/
    $("#checkedAll").click(function () {
        var checkedAll = document.getElementById("checkedAll");
        var checkName = document.getElementsByName("checked");
        if (checkedAll.checked){
            for (var i = 0; i < checkName.length; i++){
                checkName[i].checked=true
            }
        }else {
            for (var i = 0; i < checkName.length; i++){
                checkName[i].checked=false
            }
        }
    })


    /*批量删除*/
    $("#delAll").click(function () {
        var checkeds = $("input[name='checked']");

        /*拼接所有选中的复选框*/
        var str = ""
        for (var i=0; i<checkeds.length; i++){
            if (checkeds[i].checked){
                /*如果被选中*/
                str = str + checkeds[i].value + ","
            }
        }

        $.ajax({
            type : "post",
            url : "deleteAll",
            data : {"id" : str},
            dataType : "text",
            success : function (data) {
                if (data == "ok"){
                    alert("删除成功！")
                    location.replace(location)
                }
            }
        })

    })

</script>
