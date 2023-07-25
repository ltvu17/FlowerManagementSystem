/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.dao.PlanDAO;

/**
 *
 * @author LENOVO
 */
public class updatePlantServlet extends HttpServlet {

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
            int id = 0;
            if(request.getParameter("PID") != null)
            id = Integer.parseInt(request.getParameter("PID"));
            String name = request.getParameter("PName");
            int price = Integer.parseInt(request.getParameter("Price"));
            String imgPath = request.getParameter("imgPath");
            imgPath = "images/"+imgPath+".jpg";
            String description = request.getParameter("Description");
            int status = Integer.parseInt(request.getParameter("status"));
            int CateID = Integer.parseInt(request.getParameter("CateID"));
            String action = request.getParameter("action");
            out.print(imgPath);
            if (action != null) {
                if (action.equals("update")) {
                    boolean result = PlanDAO.updatePlant(id, name, price, description, status, CateID);
                    if (result) {
                        response.sendRedirect("managePlants");
                    } else {
                        response.sendRedirect("errorpage.html");
                    }
                }
                if (action.equals("create")) {
                    boolean result = PlanDAO.insertPlant(name, price, imgPath, description, status, CateID);
                    if (result) {
                        response.sendRedirect("managePlants");
                    } else {
                        response.sendRedirect("errorpage.html");
                    }
                }
            }
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
