package controller.page;

import controller.auth.PasswordAuthentication;
import controller.tool.SendingEmail;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.Base64;


@WebServlet("/register")
public class Register extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String email = request.getParameter("email");
        String name = request.getParameter("username");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("re-pass");
        String phone = request.getParameter("phone");



        Connection conn = null;
        String sql;
        try {
            // kiểm tra email đã tồn tại chưa
            Statement s = ConnectionDB.connect();
            String query = "SELECT * from `users` where email =\"" + email + "\"";
            ResultSet rs = s.executeQuery(query);

            rs.last();

            if (rs.getRow() == 1) {
                request.setAttribute("err-email", "Email đã tồn tại.");
                request.getRequestDispatcher("/customer/view/register.jsp").forward(request, response);
            } else if (!(pass.equals(re_pass))) { // kiểm tra pass khớp
                request.setAttribute("err-pass", "Re-Pass không khớp!");
                request.getRequestDispatcher("/customer/view/register.jsp").forward(request, response);
            } else {
                sql = "INSERT INTO users(name, email, email_hashed, password" +
                        ", phone) VALUES(?,?,?,?,?)";
                conn = s.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);

                String hashMail = Base64.getEncoder().encodeToString(email.getBytes());
                String hashPass = PasswordAuthentication.getSaltedHash(pass);


                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, hashMail);
                pstmt.setString(4, hashPass);
                pstmt.setString(5, phone);
                int i = pstmt.executeUpdate();
                if (i != 0) {
                    System.out.println("Successfully created new user.");
                    System.out.println("Sending Mail... ");
                    SendingEmail sendingEmail = new SendingEmail(email, hashMail);
                    sendingEmail.start();
                    conn.close();
                    response.sendRedirect("/customer/view/verify.jsp");
                } else {
                    conn.close();
                    request.getRequestDispatcher("/customer/view/register.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }




}