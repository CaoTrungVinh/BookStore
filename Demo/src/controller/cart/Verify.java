package controller.cart;

import Model.Cart;
import Model.User;
import Util.Util;
import controller.tool.FileOrder;
import controller.tool.VerSign;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Base64;

@WebServlet("./verify")
public class Verify extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = (User) request.getSession().getAttribute("user");
//        request.setAttribute("name", user.getFullName());
//        request.setAttribute("phone", user.getPhone());
//        request.setAttribute("address", user.getAddress());
//        request.getRequestDispatcher("./customer/view/confirm-Order.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
       String signu = (String) request.getAttribute("signature");
        VerSign verSign = new VerSign();
        verSign.verify(Base64.getDecoder().decode(signu.getBytes()),user.getId());

        // update don hang



    }
}
