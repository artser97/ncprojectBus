<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Bus Station App</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<center>
    <jsp:include page="_header.jsp"></jsp:include>
    <h1 style="padding-top: 30px">BUS MANAGEMENT</h1>
    <h2>
        <a href="/new">Add New Bus</a>
        &nbsp;&nbsp;&nbsp;
        <a href="/list">List All </a>

    </h2>
</center>
<div align="center">
    <c:if test="${schedule != null}">
    <form action="update" method="post">
        </c:if>
        <c:if test="${schedule == null}">
        <form action="insert" method="post">
            </c:if>
            <table class="table table-hover">
                <caption>
                    <h2>
                        <c:if test="${schedule != null}">
                            Edit Bus
                        </c:if>
                        <c:if test="${schedule == null}">
                            Add New Bus
                        </c:if>
                    </h2>
                </caption>
                <c:if test="${schedule != null}">
                </c:if>
                <tr>
                    <th>Bus number: </th>
                    <td>
                        <input type="text" name="busid" size="45"
                               value="<c:out value='${schedule.busid}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Bus route: </th>
                    <td>
                        <input type="text" name="busroute" size="45"
                               value="<c:out value='${schedule.busroute}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Operator: </th>
                    <td>
                        <input type="text" name="busoperator" size="5"
                               value="<c:out value='${schedule.busoperator}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Bus model: </th>
                    <td>
                        <input type="text" name="busmodel" size="5"
                               value="<c:out value='${schedule.busmodel}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Tickets available: </th>
                    <td>
                        <input type="text" name="tickets_av" size="5"
                               value="<c:out value='${schedule.tickets_av}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Save" />
                    </td>
                </tr>
            </table>
        </form>
</div>
</body>
</html>