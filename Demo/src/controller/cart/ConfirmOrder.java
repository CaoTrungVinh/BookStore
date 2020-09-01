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
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ConfirmOrder")
public class ConfirmOrder extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("name", user.getFullName());
        request.setAttribute("phone", user.getPhone());
        request.setAttribute("address", user.getAddress());
        request.getRequestDispatcher("/customer/view/confirm-Order.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String full_name = Util.getParameterGeneric(request, "full_name", "");
        String telephone = Util.getParameterGeneric(request, "telephone", "");
        String address = Util.getParameterGeneric(request, "address", "");

        User user = (User) request.getSession().getAttribute("user");
        int idOrder = user.getCart().getId_order();
        String sql;
        PreparedStatement statement = null;
        try {
            Connection conn = ConnectionDB.getConnection();

            sql = "select * from users where id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pstmt.setInt(1, user.getId());
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                user.setFullName(full_name);
                user.setAddress(address);
                user.setPhone(telephone);
                rs.updateString("fullname", full_name);
                rs.updateString("address", address);
                rs.updateString("phone", telephone);
                rs.updateRow();
            }
            sql = "UPDATE orders SET  orders.statusID = ? WHERE orders.id = ?";
            statement = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            statement.setInt(1,2);
            statement.setInt(2, idOrder);
            statement.executeUpdate();

            Util.updateOrderDB(statement.getConnection(), user.getCart());

            sql = "INSERT INTO orders (id_customer, statusID) VALUES('" + user.getId() + "',1)";
            statement.executeUpdate(sql);
            user.getCart().setId_order(1);
            sql = "SELECT id FROM orders WHERE id_customer = '" + user.getId() + "' AND statusID = 1";
            ResultSet rs1 = statement.executeQuery(sql);
            user.setCart(new Cart());
            if (rs1.next()) {
                user.getCart().setId_order(rs.getInt("id"));
            }
            // file info order
            String pathFile = request.getServletContext().getRealPath("public") + "/ThongTinOrder" + user.getEmail().split("@")[0] + ".txt";
            File file = new File(pathFile);
            if (!file.exists()) {

                file.createNewFile();
                System.out.println("CREATE FILE SUCCESSFULLY");
            }
            FileOutputStream keyfos = new FileOutputStream(file);
            keyfos.write("abc".getBytes());
            keyfos.close();
            System.out.println("PATH FILE: "+file.getPath());
            request.setAttribute("fileinfo","public/ThongTinOrder" + user.getEmail().split("@")[0] + ".txt");

            request.getRequestDispatcher("/customer/view/signature.jsp").forward(request, response);

        }  catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
