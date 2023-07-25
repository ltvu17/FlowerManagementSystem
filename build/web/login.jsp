<%-- 
    Document   : login
    Created on : Feb 16, 2023, 10:41:47 AM
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
        <header><%@include file="header.jsp" %></header>
        
        <section style="margin-top: 5%">
            
            <form action="login" method="post">
                <font style="color: red"><%=request.getAttribute("WARNING")==null?"":(String)request.getAttribute("WARNING") %></font>
                <div style="text-align: center; "><h1 style="font-size: 50px">Login</h1></div>
                <table style="margin-left: 37%;">
                <tr>                    
                    <td><input type="text" name="txtemail" placeholder="Email" style="width: 400px;height: 50px;background-color: #cccccc;"></td>
                </tr>
                <tr>
                    <td><input type="password" name="txtpassword" placeholder="Password" style="width: 400px;height: 50px; background-color: #cccccc;"></td></tr>
                <tr><td colspan="2"><button value="login" name="action" class="button" style="width: 150px; height: 50px;">Login</button></td></tr>
                <tr><td colspan="2"><input type="checkbox" value="savelogin" name="savelogin">Stay sign in</td></tr>
            </table>
           </form>
        </section>
        <footer style="margin-top: 7%">
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
