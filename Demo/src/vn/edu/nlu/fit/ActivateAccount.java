package vn.edu.nlu.fit;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ActivateAccount")
public class ActivateAccount extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("key1");
        String hash = request.getParameter("key2");

        response.getWriter().println(email);
        response.getWriter().println(hash);


        try {
            Statement s = ConnectionDB.connect();
            Connection conn = s.getConnection();
            PreparedStatement pst = conn.prepareStatement("select email, email_hashed, is_active from users where email=? and email_hashed=? and is_active='0'");
            pst.setString(1, email);
            pst.setString(2, hash);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                PreparedStatement pst1 = conn.prepareStatement("update users set is_active='1' where email=? and email_hashed=?");
                pst1.setString(1, email);
                pst1.setString(2, hash);
                int i = pst1.executeUpdate();
                if (i == 1) {
                    response.sendRedirect("login.jsp");
                    System.out.println("Account Successfully Verified.");
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
        } catch (Exception var10) {
            System.out.println("Error at ActivateAccount.java: " + var10);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
