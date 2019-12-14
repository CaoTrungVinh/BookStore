package controller.admin;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet(urlPatterns = {"/admin/product", "/admin/product/delete"})
public class Product extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        if (request.getServletPath().equals("/admin/product")) {
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sql = "SELECT * FROM books WHERE active = 1";
                String sqlCategory = "SELECT * FROM categories WHERE active = 1";

                PreparedStatement pst = conn.prepareStatement(sql);
                PreparedStatement pstCate = conn.prepareStatement(sqlCategory);

                ResultSet book = pst.executeQuery();
                ResultSet categories = pstCate.executeQuery();

                request.setAttribute("book", book);
                request.setAttribute("categories", categories);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/admin/products.jsp").forward(request, response);
        } else if (request.getServletPath().equals("/admin/product/delete")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                String sqlCategory = "DELETE FROM books WHERE id = ?";

                PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                pstCate.setString(1, id);

                pstCate.execute();


                    response.sendRedirect("/admin/product");
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
