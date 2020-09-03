package controller.page;

import Util.Util;
import controller.tool.SendingEmail;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("./forgot-pass")
public class ForgotPass extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("./customer/view/forgotpass.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = Util.getParameterGeneric(request, "email", "");
        try {
            String sql = "select * from users where email= '" + email + "'";
            Connection conn = ConnectionDB.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            String hashMail = "";
            if (resultSet.next()) {
                hashMail = resultSet.getString("email_hashed");
            }
            SendingEmail sendingEmail = new SendingEmail("reset-pass", email, hashMail);
            sendingEmail.start();
            request.getRequestDispatcher("./customer/view/verify.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
