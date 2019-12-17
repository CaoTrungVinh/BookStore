package controller.page;

import Model.Product;
import Model.Cart;
import Model.User;
import Util.Util;
import controller.auth.PasswordAuthentication;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class Login extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = Util.getParameterGeneric(request, "email", "");
        String pass = Util.getParameterGeneric(request, "pass", "");

        try {
            String sql;
            Statement statement = ConnectionDB.connect();
            Connection conn = statement.getConnection();


            sql = "select * from users where email=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            rs.last();
            int i = rs.getRow();
            rs.first();
            String passStoring = rs.getString("password");

            if (i == 1 && PasswordAuthentication.check(pass, passStoring)) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fullname"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setPhone(rs.getString("phone"));
                user.setIdgroup(rs.getInt("idgroup"));
                user.setAddress(rs.getString("avt"));

                ResultSet rs2 = statement.executeQuery("SELECT id FROM orders WHERE id_customer = '" + user.getId() + "' AND statusID = 1");
                if (rs2.next()) {
                    user.getCart().setId_order(rs2.getInt("id"));
                }

                // Load shopping cart.
                sql = "SELECT id FROM orders WHERE id_customer = '" + user.getId() + "' AND statusID = 1";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    user.getCart().setId_order(rs.getInt("id"));
                } else {
                    sql = "INSERT INTO orders (id_customer, statusID) VALUES('" + user.getId() + "',1)";
                    statement.executeUpdate(sql);
                    user.getCart().setId_order(1);
                    sql = "SELECT id FROM orders WHERE id_customer = '" + user.getId() + "' AND statusID = 1";
                    rs = statement.executeQuery(sql);
                    if (rs.next()) {
                        user.getCart().setId_order(rs.getInt("id"));
                    }
                }
                sql = "SELECT  books.id, books.title, books.publisher, orderdetails.quantity, books.price, img.img\n" +
                        "FROM orderdetails \n" +
                        "JOIN books ON orderdetails.id_book = books.id\n" +
                        "JOIN img ON books.id = img.id_book\n" +
                        "WHERE orderdetails.id_order = '" + user.getCart().getId_order() + "' \n" +
                "GROUP BY books.id";
                rs = statement.executeQuery(sql);
                Cart cart = user.getCart();
                Product product;
                while (rs.next()) {
                    product = new Product(rs.getInt("id"), rs.getString("title"), rs.getString("publisher"), rs.getInt("quantity"), rs.getDouble("price"));
                    product.setImg(rs.getString("img"));
                    System.out.println(product.toString());
                    cart.put(product);
                }
                // End Load shopping cart.

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect(Util.fullPath(""));

            } else {
                request.setAttribute("err", "Sai email hoặc mật khẩu.");
                request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);
                response.getWriter().println("Đăng nhập không thành công");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "Sai email hoặc mật khẩu.");
            request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);
            response.getWriter().println("Đăng nhập không thành công");
        }


    }


}