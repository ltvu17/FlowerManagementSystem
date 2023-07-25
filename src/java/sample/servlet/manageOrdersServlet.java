/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.dao.OrderDAO;
import sample.dto.Order;

/**
 *
 * @author LENOVO
 */
public class manageOrdersServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String from = request.getParameter("from");
            out.print(from);
            String to = request.getParameter("to");
            String email = request.getParameter("email");
            ArrayList<Order> list = OrderDAO.getOrders();
            ArrayList<Order> searchList = new ArrayList<>();
            if(action != null){
                if(action.equals("searchbydate")){
                    LocalDate date1 = LocalDate.MIN;
                    LocalDate date2 = LocalDate.MAX;
                    if(from!=null && to != null){
                        date1 = LocalDate.parse(from);
                        date2 = LocalDate.parse(to); 
                    }
                    for(Order order: list){
                        LocalDate date3 = LocalDate.parse(order.getOrderDate()); 
                        if(date3.isAfter(date1) && date3.isBefore(date2)){
                            searchList.add(order);
                        }
                    }
                    request.setAttribute("orderlist", searchList);
                }     
                if(action.equals("searchbyemail")){
                    request.setAttribute("email", email);
                    request.setAttribute("orderlist", list);
                }
            }else{         
            request.setAttribute("orderlist", list);
            }
            request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
