package controller;

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


@WebServlet("/ListBook")
public class ListBook extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        try {

            Statement s = ConnectionDB.connect();
            String sql = "SELECT id, name FROM category WHERE active = 1";
            ResultSet rs = s.executeQuery(sql);
            request.setAttribute("rs", rs);

            Statement s1 = ConnectionDB.connect();
            sql = "SELECT id, title, price FROM book WHERE active = 1";
            if (type != null) {
                sql += " and type=" + type;
            }
//

            response.getWriter().println(sql);
            ResultSet book = s1.executeQuery(sql);

//            while(book.next()) {
//                response.getWriter().println(book.getString(2));
//                response.getWriter().println(book.getInt(7));
//            }

            request.setAttribute("book", book);
//            response.getWriter().println(sql);

            request.getRequestDispatcher("shop.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
