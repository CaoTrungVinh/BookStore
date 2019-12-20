package controller.admin;

import controller.auth.PasswordAuthentication;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Base64;

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
        else if (request.getServletPath().equals("/admin/account/delete")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "DELETE FROM users WHERE id = ?";

                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                    pstCate.setString(1, id);
                    pstCate.execute();

                    response.sendRedirect("/admin/account");
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }

        else if (request.getServletPath().equals("/admin/account/add")) {
            request.getRequestDispatcher("/admin/add-account.jsp").forward(request, response);
        }
        else if (request.getServletPath().equals("/admin/account/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlusers = "SELECT * FROM users where id=?";
                    // rút ra cần edit
                    PreparedStatement pstusers = conn.prepareStatement(sqlusers);
                    pstusers.setString(1, id);
                    ResultSet users = pstusers.executeQuery();
                    users.first();
                    request.setAttribute("users", users);
                    request.getRequestDispatcher("/admin/edit-account.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
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
                String email_hashed = Base64.getEncoder().encodeToString((email + java.time.LocalDateTime.now()).getBytes());
                String pass = "000";
                String  password = PasswordAuthentication.getSaltedHash(pass);
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sqlusers = "INSERT INTO users (name, email, fullname, gender, dateofbirth,email_hashed,password, address, phone, avt, idgroup, is_active) VALUE (?, ?, ?, ?,?,?, ?, ?,?,?,?,?)";
                PreparedStatement pstCate = conn.prepareStatement(sqlusers);


//            response.getWriter().println(name);
//            response.getWriter().println(email);
//            response.getWriter().println(fullname);
//            response.getWriter().println(gender);
//            response.getWriter().println(dateofbirth);
//            response.getWriter().println(email_hashed);
//            response.getWriter().println(password);
//            response.getWriter().println(address);
//            response.getWriter().println(phone);
//            response.getWriter().println(avt);
//            response.getWriter().println(idgroup);
//            response.getWriter().println(is_active);

                pstCate.setString(1, name);
                pstCate.setString(2, email);
                pstCate.setString(3, fullname);
                pstCate.setString(4, gender);
                pstCate.setString(5, dateofbirth);
                pstCate.setString(6, email_hashed);
                pstCate.setString(7, password);
                pstCate.setString(8, address);
                pstCate.setString(9, phone);
                pstCate.setString(10, avt);
                pstCate.setString(11, idgroup);
                pstCate.setString(12, is_active);
                pstCate.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("/admin/account");
        }

        else if (request.getServletPath().equals("/admin/account/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
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
                    String email_hashed = Base64.getEncoder().encodeToString((email + java.time.LocalDateTime.now()).getBytes());
                    String pass = "000";
                    String  password = PasswordAuthentication.getSaltedHash(pass);

                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "UPDATE users SET name=?,email=?,fullname=?,gender=?,dateofbirth=?,email_hashed=?,password=?,address=?,phone=?,avt=?,idgroup=?,is_active=? where id=?";
                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);


                    pstCate.setString(1, name);
                    pstCate.setString(2, email);
                    pstCate.setString(3, fullname);
                    pstCate.setString(4, gender);
                    pstCate.setString(5, dateofbirth);
                    pstCate.setString(6, email_hashed);
                    pstCate.setString(7, password);
                    pstCate.setString(8, address);
                    pstCate.setString(9, phone);
                    pstCate.setString(10, avt);
                    pstCate.setString(11, idgroup);
                    pstCate.setString(12, is_active);
                    pstCate.setString(13, id);
                    pstCate.execute();
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }catch (Exception e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect("/admin/account");
        }
    }
}
