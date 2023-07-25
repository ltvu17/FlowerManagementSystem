<%-- 
    Document   : header_loginedUser
    Created on : Feb 16, 2023, 11:08:46 AM
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
        <nav>
            <header>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="changeProfile.jsp">Change profile</a></li>
                <li><a href="personalPage.jsp?orderprocess=2">Complete orders</a></li>
                <li><a href="personalPage.jsp?orderprocess=3">Canceled orders</a></li>
                <li><a href="personalPage.jsp?orderprocess=1">Processing orders</a></li>
                <form action="personalPage.jsp" method="post">
                    <li>from<input type="date" name="from" required=""> to <input type="date" name="to" required="">
                        <button value="SearchByDate" name="action" class="button">Search</button>
                </li>
                </form>
            </ul>
            </header>
        </nav>
    </body>
</html>
