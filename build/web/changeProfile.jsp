<%-- 
    Document   : changeProfileServlet
    Created on : Mar 20, 2023, 8:57:49 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
        <%@include file="header_loginedUser.jsp" %>
        </div>
        <div style="padding: 200px">
        <c:if test="${sessionScope.name != null}">
            <form action="changeProfile" method="post">
                <div>New full name: <input type="text" placeholder="Old Name: ${sessionScope.name}" name="name" required=""></div>
                <div>New phone:     <input type="text" name="phone" pattern="\d{1,}" required=""></div>
                <input type="hidden" value="${sessionScope.email}" name="email">
                <button class="button">Save</button>
            </form>
        </div>
        </c:if>
    </body>
</html>
