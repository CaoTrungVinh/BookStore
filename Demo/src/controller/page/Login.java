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
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setPhone(rs.getString("phone"));
                user.setIdgroup(rs.getInt("idgroup"));
                user.setAddress(rs.getString("avt"));

                ResultSet rs2 = s.executeQuery("SELECT id FROM orders WHERE id_customer = '"+user.getId()+"' AND statusID = 1");
                if (rs2.next()){
                    user.setId_order(rs2.getInt("id"));
                }

                System.out.println("runed");

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