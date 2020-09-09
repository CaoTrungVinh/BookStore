package controller.cart;

import Model.Ordered;
import Model.User;
import Util.Util;
import com.mysql.cj.protocol.Resultset;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet("/verify")
public class Verify extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // update don hang
        System.out.println("update don hang");
        Ordered ordered = (Ordered) request.getSession().getAttribute("ordered");
        User user = (User) request.getSession().getAttribute("user");
        String signature = request.getParameter("signature");
        VerSign verSign = new VerSign();
        boolean resultVerify = verSign.verify(request, Base64.getDecoder().decode(signature.getBytes()), user.getId());
//save database


        int countVeriFail = 0;


        Connection conn = null;
        try {
            conn = ConnectionDB.getConnection();

            String sqlCount = "SELECT countVerify FROM orders where id=?";
            PreparedStatement pstOrder = conn.prepareStatement(sqlCount);
            pstOrder.setInt(1, ordered.getId());
            ResultSet re = (ResultSet) pstOrder.executeQuery();
            re.next();
            countVeriFail = re.getInt("countVerify");

            if (!resultVerify) {

                try {
                    conn = ConnectionDB.getConnection();
                    String id = request.getParameter("id");
                    if (countVeriFail <= 3) {
                        countVeriFail++;
                        SendingEmail sendingEmail = new SendingEmail();
                        String obj = "Cảnh báo: Ai đó đang cố tình giả mạo bạn.";
                        String text = "Ai đó đang cố tình giả mạo bạn. Vu lòng kểm tra đăng nhập, nếu là bạn, bạn có thể bỏ qua emal này!";
                        sendingEmail.sendMailText(user.getEmail(), obj, text);
                        String sqlVerifyOrder = "UPDATE orders SET countVerify=?,  verify=? where id=?";
                        PreparedStatement pstVerifyOrder = conn.prepareStatement(sqlVerifyOrder);
                        pstVerifyOrder.setInt(1, countVeriFail);
                        pstVerifyOrder.setString(2,  String.valueOf(resultVerify).toUpperCase());
                        pstVerifyOrder.setInt(3, ordered.getId());
                        pstVerifyOrder.executeUpdate();

                        response.sendRedirect(Util.fullPath("ConfirmOrder"));
//                        request.getRequestDispatcher("/customer/view/confirm-Order.jsp").forward(request, response);

                    } else {
                        String sqlVerifyOrder = "UPDATE orders SET countVerify=?,  verify=? where id=?";
                        PreparedStatement pstVerifyOrder = conn.prepareStatement(sqlVerifyOrder);
                        pstVerifyOrder.setInt(1, countVeriFail);
                        pstVerifyOrder.setString(2,  String.valueOf(resultVerify).toUpperCase());
                        pstVerifyOrder.setInt(3, ordered.getId());
                        pstVerifyOrder.executeUpdate();

                        String sqlUsers = "UPDATE users SET is_active=? where id=?";
                        PreparedStatement pstUsers = conn.prepareStatement(sqlUsers);
                        pstUsers.setInt(1,0);
                        pstUsers.setInt(2, user.getId());
                        pstUsers.executeUpdate();


                        SendingEmail sendingEmail = new SendingEmail();
                        String obj = "Cảnh báo: Ai đó đang cố tình giả mạo bạn.";
                        String text = "Ký xác nhận thất bại nhều lần. Tài khoản của bạn tạm thời bi khóa. Để kich hoat lại tài khoan vui lòng liên hệ: 097900695";
                        sendingEmail.sendMailText(user.getEmail(), obj, text);
                        request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);
                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                }
//                String sqlOrder = "UPDATE orders SET verify=? where id=?";
//                pstOrder = conn.prepareStatement(sqlOrder);
////            System.out.println(String.valueOf(resultVerify).toUpperCase());
//                pstOrder.setString(1, String.valueOf(resultVerify).toUpperCase());
//                pstOrder.setInt(2, ordered.getId());
//                pstOrder.executeUpdate();


            } else {
                String sqlOrder = "UPDATE orders SET verify=? where id=?";
                pstOrder = conn.prepareStatement(sqlOrder);
//            System.out.println(String.valueOf(resultVerify).toUpperCase());
                pstOrder.setString(1, String.valueOf(resultVerify).toUpperCase());
                pstOrder.setInt(2, ordered.getId());
                pstOrder.executeUpdate();

                request.getRequestDispatcher("/customer/view/successPayment.jsp").forward(request, response);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

//        request.getRequestDispatcher("/customer/view/successPayment.jsp").forward(request, response);

    }
}
