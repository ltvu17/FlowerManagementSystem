<%-- 
    Document   : header_loginedAdmin
    Created on : Feb 26, 2023, 1:07:33 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/Admincss.css" type="text/css"/>
    </head>
    <body>
        <header>
            <ul>
                <li><a href="manageAccount">Manage Account</a></li>
                <li><a href="manageOrders">Manage Orders</a></li>
                <li><a href="managePlants">Manage Plants</a></li>
                <li><a href="manageCategories">Manage categories</a></li>
                <li>Welcome ${sessionScope.name}  | <a href="logout">logout</a></li>
            </ul>
        </header>
    </body>
</html>
