package controller.cart;

import Model.Cart;
import Model.BookItem;
import Model.User;
import Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;


@WebServlet("/DelProduct")
public class Del extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection conn = null;
        String sql;
        Statement statement = null;
        ResultSet rs;
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt((String) Util.getParameterGeneric(request, "bookID", ""));
            User user = (User) session.getAttribute("user");
            BookItem p = BookItem.find(id);
            Model.Cart cart = null;
            if (user == null) {
                cart = (Model.Cart) session.getAttribute("cart");
            } else {
                cart = user.getCart();
                sql = "SELECT id FROM orders WHERE id_customer = '" + user.getId() + "' AND statusID = 1";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    user.getCart().setId_order(rs.getInt("id"));
                }
                sql = "SELECT * FROM orderdetails WHERE orderdetails.id_order = '" + user.getCart().getId_order() + "' AND id_book = '" + id + "'";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    int currentQuantity = rs.getInt("quantity");
                    if (currentQuantity > 1) {
                        rs.updateInt("quantity", currentQuantity - 1);
                        rs.updateRow();
                    } else if (currentQuantity == 1) {
                        rs.deleteRow();
                    }
                }
            }

            cart.remove(id);


        } catch (NumberFormatException | SQLException e) {

        }

        response.getWriter().write("true");
        response.getWriter().flush();
        response.getWriter().close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}