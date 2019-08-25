<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>查询页面</title>
    <link href="/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="/jquery/jquery-3.3.1.min.js"></script>
    <script src="/jquery/jquery.form.js"></script>

</head>
<body>
    <div class="container">
        <div class="col-lg-4 col-lg-push-4">
            <h1><span class="label label-primary ">学员管理系统</span></h1>
        </div>
    </div>
    <div class="h3 col-md-offset-5">
        <a href="/a">添加学员</a>
    </div>

    <%--显示--%>
        <table class="table table-bordered table-hover table-striped text-center">
            <tr>
                <td>序号</td>
                <td>姓名</td>
                <td>年龄</td>
                <td>性别</td>
                <td>电话</td>
                <td>email</td>
                <td>班级</td>
                <td>操作</td>
            </tr>
            <c:forEach var="stu" items="${list}">
                <tr>
                    <td>${stu.id}</td>
                    <td>${stu.name}</td>
                    <td>${stu.age}</td>
                    <td>${stu.gender}</td>
                    <td>${stu.telephone}</td>
                    <td>${stu.email}</td>
                    <td>${stu.classes.name}</td>
                    <td style="text-align: center"><a href="deleteOne/${stu.id}">删除</a></td>
                </tr>
            </c:forEach>
        </table>

    <div class="row">
        <div class="col-lg-offset-4">
            <ul class="pagination pagination">
                <li><a href="javascript:go(1)">首页</a></li>
                <li><a href="javascript:go(${page.currPage-1})">&laquo;</a></li>
                <c:forEach var="i" begin="1" end="${page.countPage}">
                    <li><a href="javascript:go(${i})">${i}</a></li>
                </c:forEach>
                <li><a href="javascript:go(${page.currPage+1})">&raquo;</a></li>
                <li><a href="javascript:go(${page.countPage})">尾页</a></li>
                <li>跳转到第 <input type="text" size="2" style="text-align: center" value="${page.currPage}">页
                    <input type="button" value="确定" onclick="go(previousElementSibling.value)">
                </li>
            </ul>
        </div>
    </div>

</body>
<script>
    function go(p) {
        if(p>${page.countPage}){
            p=${page.countPage};
        }
        if(p<1){
            p=1;
        }
        location.href="/select?currPage="+p;
    }

</script>
</html>
