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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;

@WebServlet("/forgot-pass")
public class ForgotPass extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/customer/view/forgotpass.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = Util.getParameterGeneric(request, "email", "");
        String email2 = email + java.time.LocalDateTime.now();
        try {
            email2 = Base64.getEncoder().encodeToString((email2).getBytes());
            String sql = "select * from users where email= '" + email + "'";
            Statement statement = ConnectionDB.connect();
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet.next()) {
                resultSet.updateString("email_hashed", email2);
            }
            SendingEmail sendingEmail = new SendingEmail("reset-pass", email, email2);
            sendingEmail.start();
            request.getRequestDispatcher("/customer/view/verify.jsp").forward(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
