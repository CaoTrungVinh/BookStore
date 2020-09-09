package controller.cart;

import Model.Cart;
import Model.Ordered;
import Model.User;
import Util.Util;
import controller.auth.PasswordAuthentication;
import controller.tool.FileOrder;
import controller.tool.VerSign;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Base64;

@WebServlet("/signature")
public class Signature extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = (User) request.getSession().getAttribute("user");
//        request.setAttribute("name", user.getFullName());
//        request.setAttribute("phone", user.getPhone());
//        request.setAttribute("address", user.getAddress());
        request.getRequestDispatcher("/customer/view/signature.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = (User) request.getSession().getAttribute("user");
//       String signu = (String) request.getAttribute("signature");
//        VerSign verSign = new VerSign();
//        verSign.verify(Base64.getDecoder().decode(signu.getBytes()),user.getId());

        // update don hang

        String fullname = request.getParameter("full_name");
        String address = request.getParameter("address");
        String phone = request.getParameter("telephone");

        System.out.println(fullname+address+phone);

        try {
            Connection conn = ConnectionDB.getConnection();
            String sqlCategory = "UPDATE users SET fullname=?,address=?,phone=? where id=?";

            PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
            User user = (User) request.getSession().getAttribute("user");

            pstCate.setString(1, fullname);
            pstCate.setString(2, address);
            pstCate.setString(3, phone);
            pstCate.setInt(4, user.getId());
            pstCate.execute();

            user.setFullName(fullname);
            user.setGender(address);
            user.setPhone(phone);

            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            Ordered ordered = (Ordered) session.getAttribute("ordered");
            // user + ordered
            String contentFile = user + "\r\n" + ordered; // Tánh trả về
            System.out.println(contentFile);
            FileOrder fileOrder = new FileOrder();
            String pathFileDownload = fileOrder.createFileOrder(request, user, contentFile);
            System.out.println(pathFileDownload);
            request.setAttribute("fileinfo", pathFileDownload);
        } catch (Exception e) {
            e.printStackTrace();
        }


        request.getRequestDispatcher("/customer/view/signature.jsp").forward(request, response);



    }
}
