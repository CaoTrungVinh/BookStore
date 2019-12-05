package controller.page;

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
//        response.getWriter().println("Đăng nhập không thành công");
        String email = Util.getParameterGeneric(request,"email","");
        String pass = Util.getParameterGeneric(request,"pass","");

        if (email == "" && pass == "") {
            request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);
            return;
        }

        try {
            String query = "select * from users where email=?";

            Statement s = ConnectionDB.connect();
            Connection conn = s.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();

            rs.last();
            int i = rs.getRow();
            rs.first();
            String passStoring = rs.getString("password");

            if (i == 1 && PasswordAuthentication.check(pass, passStoring)) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setUserName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setFullName(rs.getString(4));
                user.setGender(rs.getString(5));
                user.setPass("");
//                user.setIdgroup(ra.getInt(4));
//                user.setActive(ra.getInt(5));

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}