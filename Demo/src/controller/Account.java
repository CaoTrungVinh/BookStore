package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


//@WebServlet(urlPatterns = {"/Account", "/Account/edit"})
@WebServlet("/Account")
public class Account extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("/Account; charset=UTF-8");
        String type = request.getParameter("type");

//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html; charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");

//Demo/account/ìno
        if(request.getPathInfo()== null)  {
            request.setAttribute("route", "edit");
        }
       else if(request.getPathInfo().equals("/edit")) {

            request.setAttribute("route", "edit");
//            request.getRequestDispatcher("WEB-INF/customer/account/my-account.jsp").forward(request, response);

        }else if(request.getPathInfo().equals("/adderss")) {
            request.setAttribute("route", "address");

        }
        else if(request.getPathInfo().equals("/add-adderss")) {
            request.setAttribute("route", "add-address");

        }
        else if(request.getPathInfo().equals("/order")) {
            request.setAttribute("route", "order");

        } else if(request.getPathInfo().equals("/wishlist")) {
            request.setAttribute("route", "wishlist");

        }
        request.getRequestDispatcher("/WEB-INF/customer/account/my-account.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        doGet(request, response);
    }
}
