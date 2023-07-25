<%-- 
    Document   : orderDetail
    Created on : Feb 21, 2023, 1:51:57 PM
    Author     : LENOVO
--%>

<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <header><%@include file="header_loginedUser.jsp" %></header>
         <section>
         <h3><a href="mainController?action=logout">Logout</a></h3>
         <a href="personalPage.jsp">View all orders</a>
         </section>
         <section>
             <% String orderid = request.getParameter("orderid");
                if(orderid != null){
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                    if(list!= null && !list.isEmpty()){
                        int money = 0;
                        for(OrderDetail detail: list){
             %>
             <table class="displaytable">
                 <tr><td>OrderID</td><td>Plant ID</td><td>Plant Name</td><td>Image</td><td>quantity</td></tr>
                 <tr><td><%=detail.getOrderID()%></td><td><%=detail.getPlantID()%></td><td><%=detail.getPlanName()%></td><td><img class="plantimg"  src="<%=detail.getImgPath()%>" /></td><td><%=detail.getQuantity()%></td>
                     <% money = money + detail.getPrice()*detail.getQuantity(); %>
                 </tr>
                 
             </table>
             <%
                        }
             %>
             <h3>
                 Total Money : <%=money%>
             </h3>
             <%
                    }else{
             %>
             <h1>You don't have any order</h1>
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
