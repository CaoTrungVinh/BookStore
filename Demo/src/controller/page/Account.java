package controller.page;

import Model.*;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;


@WebServlet(urlPatterns = {"/account", "/account/edit", "/account/address", "/account/add-address", "/account/order", "/account/wishlist"})
//@WebServlet("/account")
public class Account extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        String sql;
        ResultSet rs;
        Statement statement = null;
        try {
            statement = ConnectionDB.connect();
            conn = statement.getConnection();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String type = request.getParameter("type");
        Model.User user = (Model.User) request.getSession().getAttribute("user");
        request.setAttribute("user", user);

        if (request.getServletPath().equals("/account") || request.getServletPath().equals("/account/edit")) {
            request.setAttribute("route", "edit");
        } else if (request.getServletPath().equals("/account/address")) {
            request.setAttribute("route", "address");
        } else if (request.getServletPath().equals("/account/add-address")) {
            request.setAttribute("route", "add-address");
        } else if (request.getServletPath().equals("/account/order")) {
            try {
                ArrayList<Ordered> ordereds = new ArrayList<Ordered>();
                sql = "SELECT * FROM orders WHERE id_customer = '" + user.getId() + "' AND orders.statusID = 2";
                rs = statement.executeQuery(sql);
                while (rs.next()) {
                    Statement statement2 = ConnectionDB.connect();
                    ResultSet rs2 = statement2.executeQuery("SELECT books.title FROM orderdetails JOIN books ON books.id = orderdetails.id_book WHERE orderdetails.id_order = '" + rs.getInt("id") + "'");
                    ArrayList<String> products = new ArrayList<String>();
                    while (rs2.next()) {
                        products.add(rs2.getString("title"));
                    }
                    Ordered ordered = new Ordered(rs.getInt("id"), rs.getDate("orderDate"), products, rs.getInt("total"), rs.getInt("statusID"));
                    ordereds.add(ordered);
                }
                request.setAttribute("ordereds", ordereds);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.setAttribute("route", "order");
        } else if (request.getServletPath().equals("/account/wishlist")) {
            request.setAttribute("wishlist", user.getWishlist().getWishlist());
            request.setAttribute("route", "wishlist");
        }
        request.getRequestDispatcher("/customer/account/my-account.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
