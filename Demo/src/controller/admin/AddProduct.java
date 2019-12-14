package controller.admin;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/admin/add-product")
public class AddProduct extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            Statement s = ConnectionDB.connect();
            Connection conn = s.getConnection();
            String sqlCategory = "SELECT * FROM categories WHERE active = 1";

            PreparedStatement pstCate = conn.prepareStatement(sqlCategory);

            ResultSet categories = pstCate.executeQuery();

            request.setAttribute("categories", categories);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


        request.getRequestDispatcher("/admin/add-product.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");

        try {
            Statement s = ConnectionDB.connect();
            Connection conn = s.getConnection();
            String sqlCategory = "INSERT INTO books (title, type, description, price, in_stock, active, rating) VALUE (?, ?, ?, ?, ?, 1, 0)";

            PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
            pstCate.setString(1, name);
            pstCate.setInt(2, Integer.parseInt(category));
            pstCate.setString(3, description);
            pstCate.setDouble(4, Double.parseDouble(price));
            pstCate.setInt(5, Integer.parseInt(stock));
            pstCate.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.sendRedirect("/admin/product");
    }
}
