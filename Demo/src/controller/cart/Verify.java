package controller.cart;

import Model.Ordered;
import Model.User;
import controller.tool.FileOrder;
import controller.tool.VerSign;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet("/verify")
public class Verify extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // update don hang


        User user = (User) request.getSession().getAttribute("user");
        String signature = request.getParameter("signature");
        VerSign verSign = new VerSign();
        boolean resultVerify = verSign.verify(Base64.getDecoder().decode(signature.getBytes()), user.getId());
//save database
        Connection conn = null;
        try {
            conn = ConnectionDB.getConnection();
            Ordered ordered = (Ordered) request.getSession().getAttribute("ordered");
            String sqlOrder = "UPDATE orders SET verify=? where id=?";
            PreparedStatement pstOrder = conn.prepareStatement(sqlOrder);
            pstOrder.setString(1, String.valueOf(resultVerify));
            pstOrder.setInt(2, ordered.getId());
            pstOrder.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        request.getRequestDispatcher("/customer/view/signature.jsp").forward(request, response);

    }
}
