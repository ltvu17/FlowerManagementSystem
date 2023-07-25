<%-- 
    Document   : adminindex
    Created on : Feb 26, 2023, 12:54:35 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
            <c:import url="header_loginedAdmin.jsp"></c:import>
            <c:if test="${sessionScope.name != null or sessionScope.name != 'admin'}">
            <section>
                <h1 style="font-size: 100px">Welcome Admin</h1>
            </section>
            </c:if>
        
    </body>
</html>
