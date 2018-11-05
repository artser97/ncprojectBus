<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
 <head>
        <meta charset="UTF-8">
        <title>Schedule List</title>
     </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    
 
    <h3>Product List</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <table border="1" cellpadding="5" cellspacing="1" >
           <tr>
              <th>Code</th>
              <th>Name</th>
              <th>Price</th>
              <th>Edit</th>
              <th>Delete</th>
           </tr>
           <c:forEach items="${scheduleList}" var="schedule" >
              <tr>
                 <td>${schedule.busid}</td>
                 <td>${schedule.busroute}</td>
                 <td>${schedule.busoperator}</td>
                 <td>${schedule.busmodel}</td>
                 <td>${schedule.tickets_av}</td>
                 <td>
                    <a href="editSchedule?busid=${schedule.busid}">Edit</a>
                 </td>
                 <td>
                    <a href="deleteSchedule?busid=${schedule.busid}">Delete</a>
                 </td>
              </tr>
           </c:forEach>
        </table>
 
    <a href="createProduct" >Create Product</a>
 
    
 
 </body>
</html>


