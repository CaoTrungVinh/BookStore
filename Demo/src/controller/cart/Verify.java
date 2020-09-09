package controller.cart;

import Model.Ordered;
import Model.User;
import controller.tool.FileOrder;
import controller.tool.SendingEmail;
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
        System.out.println("update don hang");

        User user = (User) request.getSession().getAttribute("user");
        String signature = request.getParameter("signature");
        VerSign verSign = new VerSign();
        boolean resultVerify = verSign.verify(request, Base64.getDecoder().decode(signature.getBytes()), user.getId());
//save database


        int countVeriFail  = 0;



        Connection conn = null;
        try {
            conn = ConnectionDB.getConnection();

            String sqlCount = "SELECT countVerify FROM orders where id=?";

            Ordered ordered = (Ordered) request.getSession().getAttribute("ordered");
            String sqlOrder = "UPDATE orders SET verify=? where id=?";
            PreparedStatement pstOrder = conn.prepareStatement(sqlOrder);
            System.out.println( String.valueOf(resultVerify).toUpperCase());
            pstOrder.setString(1, String.valueOf(resultVerify).toUpperCase());
            pstOrder.setInt(2, ordered.getId());
            pstOrder.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        if (!resultVerify) {
            countVeriFail ++;

            SendingEmail sendingEmail  = new SendingEmail();
            String obj =  "Cảnh báo: Ai đó đang cố tình giả mạo bạn.";
            String text =  "Ai đó đang cố tình giả mạo bạn. Vu lòng kểm tra đăng nhập, nếu là bạn, bạn có thể bỏ qua emal này!";

            sendingEmail.sendMailText(obj, text);
        }


        request.getRequestDispatcher("/customer/view/successPayment.jsp").forward(request, response);

    }
}
