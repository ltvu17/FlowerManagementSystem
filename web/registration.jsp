<%-- 
    Document   : registration
    Created on : Feb 16, 2023, 10:44:06 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <header><%@include file="header.jsp" %></header>
        <section>
            <form action="mainController" method="post" class="tableregister">
                <h1>Register</h1>
                <table>
                    <tr><td>Email</td><td><input type="text" name="txtemail" required="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                                 value="<%=request.getAttribute("txtemail")==null?"":request.getAttribute("txtemail") %>"></td></tr>
                    <tr><td>Full name</td><td><input type="text" name="txtfullname" required="" value="<%=request.getAttribute("txtfullname")==null?"":request.getAttribute("txtfullname") %>"></td></tr>
                    <tr><td>Password</td><td><input type="password" name="txtpassword" required=""></td></tr>
                    <tr><td>Phone</td><td><input type="text" name="txtphone" value="<%=request.getAttribute("txtphone")==null?"":request.getAttribute("txtphone") %>"></br><%=request.getAttribute("ERROR")==null?"":request.getAttribute("ERROR") %></td></tr>
                    <tr><td colspan="2"><button value="register" name="action" class="button">Register</button></td></tr>
                </table>
                
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
