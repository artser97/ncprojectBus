<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
</head>
<body background="https://cdn.wallpapersafari.com/76/50/UW7wgm.jpg">

<jsp:include page="_header.jsp"></jsp:include>


<h3>Start Page</h3>

<h1 >Welcome to Bus Station Web App</h1>
<h1><a href="${pageContext.request.contextPath}/scheduleList">Check Bus Schedule</a></h1>


</body>
</html>