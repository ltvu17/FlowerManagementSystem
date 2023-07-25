<%-- 
    Document   : manageOrders
    Created on : Feb 26, 2023, 3:36:38 PM
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
        <%@include file="header_loginedAdmin.jsp" %>
        <c:if test="${sessionScope.name != null or sessionScope.name == 'admin'}">
        <form action="updatePlant" method="post">
            <details>
            <summary><a>Create new plant</a></summary>
            <div><span><p>PName:</p>  <input type="text" name="PName" required=""></span></div>
            <div><span><p>Price:</p>  <input type="text" name="Price" pattern="\d{1,}" required=""></span></div>
            <div><span><p>imgPath</p>  <input type="text" name="imgPath" required=""></span></div>
            <div><span><p>Description:</p>  <input type="text" name="Description" required=""></span></div>
            <div><span><p>Status:</p>  <input type="number" name="status" min="0" max="1" required=""></span></div>
            <div><span><p>CateID:</p>  <input type="text" name="CateID" pattern="\d" required=""></span></div>
            <div><span><button value="create" name="action" class="button">save</button></span></div>                  
        </details>
                        
        </form>
        <table class="displaytable">
            <tr>
                <th>PID</th>
                <th>PName</th>
                <th>Price</th>
                <th>Description</th>
                <th>status</th>
                <th>CateID</th>
                <th>CateName</th>
                <th>Update</th>
            </tr>          
            <c:forEach var="plant" items="${requestScope.plantslist}">
                <tr>
                    <td><c:out value="${plant.getId()}"></c:out></td>
                    <td><c:out value="${plant.getName()}"></c:out></td>
                    <td><c:out value="${plant.getPrice()}"></c:out></td>
                    <td><c:out value="${plant.getDescription()}"></c:out></td>
                    <td><c:out value="${plant.getStatus()}"></c:out></td>
                    <td><c:out value="${plant.getCateid()}"></c:out></td>
                    <td><c:out value="${plant.getCatename()}"></c:out></td>
                    <td class="updatebutton">
                        <form action="updatePlant">
                            <button value="update" name="action" class="button">Update</button>
                        <div><input type="hidden" name="PID" value="${plant.getId()}">
                        <p>PName:</p>  <input type="text" name="PName" required="">
                        <p>Price:</p>  <input type="text" name="Price" pattern="\d{1,}" required="">
                        <p>Description:</p>  <input type="text" name="Description" required="">
                        <p>Status:</p>  <input type="number" name="status" min="0" max="1" required="">
                        <p>CateID:</p>  <input type="text" name="CateID" pattern="\d" required=""> </div>
                        </form>
                    </td>
                </tr>
            </c:forEach>
             
        </table>  
        </c:if>
    </body>
</html>
