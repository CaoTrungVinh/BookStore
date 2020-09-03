package controller.cart;

import Model.Cart;
import Model.User;
import Util.Util;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/cartPay")
public class Pay extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] ids = request.getParameterValues("payids"); // id of order detail which processed to pay [order_details]
        User user = (User) request.getSession().getAttribute("user");
        String sql;

        try {
            Connection conn = ConnectionDB.getConnection();
            Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

            // add new row in order status = 2. -> get new id
            sql = "INSERT INTO orders (id_customer, statusID) VALUES('" + user.getId() + "',2)";
            PreparedStatement pStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pStatement.executeUpdate();


            ResultSet generatedKeys = pStatement.getGeneratedKeys();
            int id_ordered = 0; // new id
            if (generatedKeys.next()) {
                id_ordered = generatedKeys.getInt(1);
            }
            int id_order = user.getCart().getId_order();
            // update row in order detail  based on ids
            sql = "SELECT * FROM `orderdetails` WHERE id_order = " + id_order;
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                if (contain(ids, rs.getInt("id_book"))) {
                    rs.updateInt("id_order", id_ordered);
                    rs.updateRow();  // update order -> ordered
                }
            }


            for (String id : ids) {
                user.getCart().remove(Integer.parseInt(id)); // remove in session
            }


            request.getRequestDispatcher("/customer/view/successPayment.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private boolean contain(String[] ids, int id_order) {
        for (String id : ids) {
            if (Integer.parseInt(id) == id_order) return true;
        }
        return false;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }
}
