package controller.admin;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(urlPatterns = {"/admin/account", "/admin/account/delete",
        "/admin/account/add", "/admin/account/edit", "/admin/account/see"})

public class Account extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        if (request.getServletPath().equals("/admin/account")) {
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sql = "SELECT * FROM users";

                PreparedStatement pst = conn.prepareStatement(sql);

                ResultSet users = pst.executeQuery();
//                System.out.println(user.getString("name"));
                request.setAttribute("users", users);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
        }

        else if (request.getServletPath().equals("/admin/account/add")) {
            request.getRequestDispatcher("/admin/add-account.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        if (request.getServletPath().equals("/admin/account/add")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String gender = request.getParameter("gender");
            String dateofbirth = request.getParameter("dateofbirth");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String avt = request.getParameter("avt");
            String idgroup = request.getParameter("idgroup");
            String is_active = request.getParameter("is_active");
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sqlCategory = "INSERT INTO users (name, email, fullname, gender, dateofbirth, address, phone, avt, idgroup, is_active) VALUE (?, ?, ?, ?, ?, ?,?,?,?,?)";

                PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                pstCate.setString(1, name);
                pstCate.setString(2, email);
                pstCate.setString(3, fullname);
                pstCate.setString(4, gender);
                pstCate.setString(5, dateofbirth);
                pstCate.setString(6, address);
                pstCate.setString(6, phone);
                pstCate.setString(6, avt);
                pstCate.setString(6, idgroup);
                pstCate.setString(6, is_active);
                pstCate.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/admin/account");
        }
    }
}
