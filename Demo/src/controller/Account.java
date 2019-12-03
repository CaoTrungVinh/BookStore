package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(urlPatterns = {"/Account", "/Account/edit", "/Account/address", "/Account/add-address", "/Account/order", "/Account/wishlist"})
//@WebServlet("/Account")
public class Account extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String type = request.getParameter("type");

//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html; charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");

//Demo/account/ìno
        System.out.println(request.getServletPath());
        if (request.getServletPath().equals("/Account") || request.getServletPath().equals("/Account/edit")) {
            System.out.println(request.getServletPath());

            request.setAttribute("route", "edit");

        } else if (request.getServletPath().equals("/Account/address")) {
            request.setAttribute("route", "address");

        } else if (request.getServletPath().equals("/Account/add-address")) {
            request.setAttribute("route", "add-address");

        } else if (request.getServletPath().equals("/Account/order")) {
            request.setAttribute("route", "order");

        } else if (request.getServletPath().equals("/Account/wishlist")) {
            request.setAttribute("route", "wishlist");

        }
        request.getRequestDispatcher("/customer/account/my-account.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        doGet(request, response);
    }
}
