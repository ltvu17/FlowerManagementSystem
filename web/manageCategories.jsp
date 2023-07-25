<%-- 
    Document   : manageCategories
    Created on : Mar 20, 2023, 10:53:29 PM
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
        <%@include file="header_loginedAdmin.jsp" %>
        <c:if test="${sessionScope.name != null or sessionScope.name == 'admin'}">
        <form action="updateCategories" method="post">
            
        <details>
            <summary><a>Create new category</a></summary>            
            <div><span><p>Category Name:</p>  <input type="text" name="CateName" required=""></span></div>
            <div><span><button value="create" name="action">Save</button></span></div>                     
        </details>
                        
        </form>
        <table class="displaytable">
            <tr>
                <th>CateID</th>
                <th>CateName</th>               
                <th>Update</th>
            </tr>          
            <c:forEach var="cate" items="${requestScope.categorieslist}">
                <tr>
                    <td>${cate.getCateID()}</td>
                    <td>${cate.getCateName()}</td>
                    <td class="updatebutton">
                        <form action="updateCategories">
                        <button value="update" name="action">Update</button>
                        <div><input type="hidden" name="CateID" value="${cate.getCateID()}">
                        <p>CateName:</p>  <input type="text" name="CateName" required="">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        </table> 
    </body>
</html>
