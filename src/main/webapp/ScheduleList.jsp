<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
 <head>
        <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Schedule List</title>
     </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    
 
       <center>
    <h1>BUS SCHEDULE</h1>
    <h2>
        <a href="/new">Add New Bus</a>
        &nbsp;&nbsp;&nbsp;
        <a href="/list">List All Buses</a>

    </h2>
</center>
<div align="center">
    <table class="table table-hover">
        <caption><h2>SCHEDULE</h2></caption>
        <tr>
            <th>ID</th>
            <th>Route</th>
            <th>Operator</th>
            <th>Bus Model</th>
            <th>Tickets Available</th>
        </tr>
        <c:forEach var="schedule" items="${listSchedule}">
            <tr>
                <td><c:out value="${schedule.busid}" /></td>
                <td><c:out value="${schedule.busroute}" /></td>
                <td><c:out value="${schedule.busoperator}" /></td>
                <td><c:out value="${schedule.busmodel}" /></td>
                <td><c:out value="${schedule.tickets_av}" /></td>
                <td>
                    <a href="/edit?id=<c:out value='${schedule.busid}' />">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/delete?id=<c:out value='${schedule.busid}' />">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
 
 </body>
</html>


