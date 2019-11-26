package controller;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/ListBook")
public class ListBook extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("/ListBook; charset=UTF-8");
        String type = request.getParameter("type");
        try {
            Statement s = ConnectionDB.connect();
            Connection conn = s.getConnection();
            String sql = "SELECT id, name FROM categories WHERE active = 1";

            PreparedStatement pst = conn.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();

            request.setAttribute("rs", rs);

            Statement s1 = ConnectionDB.connect();
            Connection conn1 = s1.getConnection();

            sql = "SELECT books.id, books.title, books.price, img.img FROM img inner JOIN books ON img.id_book = books.id WHERE active = 1";
//            sql = "SELECT id, title, price FROM books WHERE active = 1";

            if (type != null) {
                sql += " and type = " + type;
            }
            PreparedStatement pst2 = conn1.prepareStatement(sql);

//
            response.getWriter().println(sql);
            ResultSet book = pst2.executeQuery();

//            while(book.next()) {
//                response.getWriter().println(book.getString(2));
//                response.getWriter().println(book.getInt(7));
//            }

            request.setAttribute("book", book);
//            response.getWriter().println(sql);

            request.getRequestDispatcher("WEB-INF/customer/view/shop.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
