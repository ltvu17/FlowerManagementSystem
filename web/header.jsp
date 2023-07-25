<%-- 
    Document   : header
    Created on : Feb 16, 2023, 10:32:42 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/mycss.css" type="text/css"/>
    </head>
    <body>
        <header>
            <nav>
                <a href="index.jsp"><img src="images/logo.jpg" id="logo"></a>
                <ul>                 
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="registration.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="viewCart.jsp">View cart</a></li>
                            <li><form action="index.jsp" method="post" class="formsearch">
                                    <input type="text" name="txtsearch2" value="<%= (request.getParameter("txtsearch2")==null)?"": request.getParameter("txtsearch2") %>">
                                    <select name="searchby">
                                        <option>by name</option>
                                        <option>by category</option>                                      
                                    </select>
                                    <button value="search" name="action">submit</button>
                        </form></li>
                   
                </ul>
            </nav>
        </header>
    </body>
</html>
