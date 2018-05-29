<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/15
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="${pageContext.request.contextPath}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<body>
<div class="row">
    <div class="col-md-12"><h1>SSM版CRUD</h1></div>
</div>
<div class="row">
    <div class="col-md-3 col-md-offset-8">
        <button type="button" class="btn btn-primary">新增</button>
        <button type="button" class="btn btn-danger">删除</button>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
       <table class="table table-hover">
           <tr>
        <th class="col-md-2 col-md-offset-1" >员工ID</th>
        <th>员工姓名</th>
        <th>员工邮箱</th>
        <th>员工部门</th>
        <th>操作</th>
           </tr>
   <c:forEach var="emp" items="${pageInfo.list}">
           <tr>
               <th >${emp.empId}</th>
               <th>${emp.empName}</th>
               <th>${emp.email}</th>
               <th>${emp.deptment.deptName}</th>
               <th>
                   <button type="button" class="btn btn-primary">
                       <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 编辑
                   </button>
                   <button type="button" class="btn btn-danger">
                       <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                   </button>
               </th>
           </tr>
   </c:forEach>
       </table>
    </div>
</div>
<div class="row">
   <div class="col-md-6">
       当前第${pageInfo.pageNum}页，共${pageInfo.pages}页，共${pageInfo.total}条数据
   </div>
    <div class="col-md-6">
    <nav aria-label="Page navigation" class=" col-md-offset-3">
        <ul class="pagination">
            <li>
                <a href="${pageContext.request.contextPath}/emps?page=1" aria-label="Previous">
                    <span aria-hidden="true">首页</span>
                </a>
            </li>
            <c:if test="${pageInfo.hasPreviousPage != false}">
            <li>
                <a href="${pageContext.request.contextPath}/emps?page=${pageInfo.pageNum-1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            </c:if >
            <c:forEach items="${pageInfo.navigatepageNums}" var="currentPage">
                <c:if test="${currentPage == pageInfo.pageNum}">
                 <li class="active"><a href="${pageContext.request.contextPath}/emps?page=${currentPage}">${currentPage}</a></li>
                </c:if>
                <c:if test="${currentPage != pageInfo.pageNum}">
                    <li ><a href="${pageContext.request.contextPath}/emps?page=${currentPage}">${currentPage}</a></li>
                </c:if>
            </c:forEach>
             <c:if test="${pageInfo.hasNextPage != false}">
            <li>
                <a href="${pageContext.request.contextPath}/emps?page=${pageInfo.pageNum+1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
             </c:if>
            <li>
                <a href="${pageContext.request.contextPath}/emps?page=${pageInfo.pages}" aria-label="Previous">
                    <span aria-hidden="true">尾页</span>
                </a>
            </li>
        </ul>
    </nav>
    </div>


</div>
</body>
</html>
