package controller.page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(urlPatterns = {"/account", "/account/edit", "/account/address", "/account/add-address", "/account/order", "/account/wishlist"})
//@WebServlet("/account")
public class Account extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String type = request.getParameter("type");

        Model.User user = (Model.User) request.getSession().getAttribute("user");
        request.setAttribute("user", user);
        System.out.println(user.toString());

        System.out.println(request.getServletPath());
        if (request.getServletPath().equals("/account") || request.getServletPath().equals("/account/edit")) {
//            System.out.println(request.getServletPath());

            request.setAttribute("route", "edit");

        } else if (request.getServletPath().equals("/account/address")) {
            request.setAttribute("route", "address");

        } else if (request.getServletPath().equals("/account/add-address")) {
            request.setAttribute("route", "add-address");

        } else if (request.getServletPath().equals("/account/order")) {
            request.setAttribute("route", "order");

        } else if (request.getServletPath().equals("/account/wishlist")) {
            request.setAttribute("route", "wishlist");

        }
        request.getRequestDispatcher("/customer/account/my-account.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        doGet(request, response);
    }
}
