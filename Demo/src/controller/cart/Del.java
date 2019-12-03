package controller.cart;

import Model.Cart;
import Model.Product;
import Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/DelProduct")
public class Del extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            Product p = Product.find(id);
            Model.Cart c = (Model.Cart) session.getAttribute("Cart");
            if (c == null) c = new Cart();
            c.remove(id);
            session.setAttribute("Cart", c);
        }catch (NumberFormatException e){
        }
        response.sendRedirect(Util.fullPath("ShowCart"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}