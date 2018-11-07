<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Bus Station App</title>
</head>
<body>
<center>
    <h1>Books Management</h1>
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
            <table border="1" cellpadding="5">
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
                    <input type="hidden" name="id" value="<c:out value='${book.id}' />" />
                </c:if>
                <tr>
                    <th>Bus number: </th>
                    <td>
                        <input type="text" name="number" size="45"
                               value="<c:out value='${schedule.busid}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Bus route: </th>
                    <td>
                        <input type="text" name="route" size="45"
                               value="<c:out value='${schedule.busroute}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Operator: </th>
                    <td>
                        <input type="text" name="operator" size="5"
                               value="<c:out value='${schedule.busoperator}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Bus model: </th>
                    <td>
                        <input type="text" name="model" size="5"
                               value="<c:out value='${schedule.busmodel}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Tickets available: </th>
                    <td>
                        <input type="text" name="price" size="5"
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