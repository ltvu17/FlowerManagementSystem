<%-- 
    Document   : manageOrders
    Created on : Feb 26, 2023, 3:36:38 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="sample.dao.AccountDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header_loginedAdmin.jsp" %>
        <c:if test="${sessionScope.name != null or sessionScope.name == 'admin'}">
        <form action="manageOrders" method="post">
            <div>
                From: <input type="date" name="from" required=""> to : <input type="date" name="to" required="">
            <button value="searchbydate" name="action">Search</button>
            </div>
        </form>
        <form action="manageOrders" method="post">
            <input type="text" placeholder="Email to search" name="email">
            <button value="searchbyemail" name="action">Search</button>
        </form>
        <table class="displaytable">
            <tr>
                <th>OrderID</th>
                <th>Order Date</th>
                <th>Ship Date</th>
                <th>Status</th>
                <th>AccID</th>
                <th>Acc email</th>
            </tr>          
            <c:forEach var="order" items="${requestScope.orderlist}">
               
                        <c:if test="${requestScope.email == null or requestScope.email == AccountDAO.getAccountByID(order.getAccID()).getEmail() or requestScope.email == ''}" >
                        <tr>
                            <td><c:out value="${order.getOrderID()}"></c:out></td>
                            <td><c:out value="${order.getOrderDate()}"></c:out></td>
                            <td><c:out value="${order.getShipDate()}"></c:out></td>
                            <td><c:out value="${order.getStatus()}"></c:out></td>
                            <td><c:out value="${order.getAccID()}"></c:out></td>
                            <td>${AccountDAO.getAccountByID(order.getAccID()).getEmail()}</td> 
                        </c:if>              
                </tr>
            </c:forEach>

        </table>
        </c:if>
    </body>
</html>
