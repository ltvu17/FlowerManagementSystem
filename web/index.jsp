<%-- 
    Document   : index
    Created on : Feb 16, 2023, 10:38:28 AM
    Author     : LENOVO
--%>

<%@page import="sample.dao.PlanDAO"%>
<%@page import="sample.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section>
            <%
                String keyword = request.getParameter("txtsearch2");
                String searchby = request.getParameter("searchby");
                ArrayList<Plant> list = null;
                String[] tmp = {"out of stock", "available"};
                if (keyword == null && searchby == null) {
                    list = PlanDAO.getPlants("", "");

                } else {
                    list = PlanDAO.getPlants(keyword, searchby);
                }
                if (list != null && !list.isEmpty()) {
                        for (Plant plant : list) {%>
                        <table class="displaytable">                     
                            <tr><td><img src="<%=plant.getImgpath()%>" class="plantimg" >
                        <td>Product ID :<%=plant.getId()%></td>
                        <td>Name :<%=plant.getName()%></td>
                        <td>Price :<%=plant.getPrice()%></td>
                        <td>Category :<%=plant.getCatename()%></td>
                        <td>Status : <%=tmp[plant.getStatus()]%></td>
                        <td><a href="addToCart?pid=<%= plant.getId() %>">Add to cart</a></td></tr>
                </table>
                <%
                    }
                        }
                    %>

                </section>
                <footer>
                    <%@include file="footer.jsp" %>
                </footer>
                </body>
                </html>
