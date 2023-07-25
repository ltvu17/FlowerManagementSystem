<%-- 
    Document   : viewPlant
    Created on : Feb 26, 2023, 12:36:00 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/Admincss.css" type="text/css">
    </head>
    <body>
        <jsp:useBean id="plantobj" class="sample.dto.Plant" scope="request" />
        <table>
            <tr><td rowspan="8"><img src="<jsp:getProperty name="plantobj" property="imgpath"></jsp:getProperty>"</td></tr>
            <tr><td>id:<jsp:getProperty name="plantobj" property="id"></jsp:getProperty></td></tr>
            <tr><td>Product name:<jsp:getProperty name="plantobj" property="name"></jsp:getProperty></td></tr>
            <tr><td>Price:${plantobj.price}</td></tr>
            <tr><td>Description:${plantobj.description}</td></tr>
            <tr><td>Status:${plantobj.status}</td></tr>
            <tr><td>Cate id:${plantobj.cateid}</td></tr>
            <tr><td>Category:${plantobj.catename}</td></tr>
        </table>
    </body>
</html>
