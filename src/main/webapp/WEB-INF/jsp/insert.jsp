<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增页面</title>
    <link href="/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="/jquery/jquery-3.3.1.min.js"></script>
    <script src="/jquery/jquery.form.js"></script>
</head>
<body>
<div class="container">
    <div class="col-lg-4 col-lg-push-5">
        <h1><span class="label label-primary ">学员信息添加</span></h1>
    </div>
</div>


<div class="container">
    <div class="col-md-offset-4" style="margin-top:50px"><%--表单居中--%>
        <form action="/insert" class="form-horizontal" method="post" id="form" role="form" >
            <div class="form-group">
                <label class="control-label col-md-2">姓名</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="name" >
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">年龄</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="age">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">性别</label>
                <div>
                    <input type="radio" name="gender" value="男">男
                    <input type="radio" name="gender" value="女">女
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-2">电话</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="telephone">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">email</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="email">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-2">班级</label>
                <div class="col-md-3">
                    <select  class="form-control" name="classid">
                        <option value="0">-请选择-</option>
                        <c:forEach var="c" items="${classes}">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="col-lg-offset-2">
                <input class="btn btn-success" type="submit" value="保存">
                <a href="/index.jsp"><input class="btn btn-success" type="button" value="返回"></a>
            </div>

        </form>
    </div>
</div>
</body>

<%--<script>
    //jquery实现异步请求
    $("input[name=name]").blur(function () {
        var inp=$(this).val()
        //回调函数:正常响应之后执行的函数,回调函数的参数就是服务器响应的字符串
        $.get("/b",{inp:inp},function (data) {
            alert(data)
        },"text")
    })
    $("input[name=age]").blur(function () {
        var inp=$(this).val()
        //回调函数:正常响应之后执行的函数,回调函数的参数就是服务器响应的字符串
        $.get("/c",{inp:inp},function (data) {
            alert(data)
        },"text")
    })
    $("input[name=telephone]").blur(function () {
        var inp=$(this).val()
        //回调函数:正常响应之后执行的函数,回调函数的参数就是服务器响应的字符串
        $.get("/d",{inp:inp},function (data) {
            alert(data)
        },"text")
    })
    $("input[name=email]").blur(function () {
        var inp=$(this).val()
        //回调函数:正常响应之后执行的函数,回调函数的参数就是服务器响应的字符串
        $.get("/e",{inp:inp},function (data) {
            alert(data)
        },"text")
    })
</script>--%>
</html>
