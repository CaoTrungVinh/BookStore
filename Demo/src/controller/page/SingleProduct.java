package controller.page;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet(urlPatterns = {"/single-product", "/single-product/rate"})
public class SingleProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String id = request.getParameter("id");


        try {
            Connection conn = ConnectionDB.getConnection();

            if (request.getServletPath().equals("/single-product/rate")) {
                String idProduct = request.getParameter("id");
                String rate = request.getParameter("rate");
                int rating = 0;
                int idInt= 0;
                try {
                    idInt = Integer.parseInt(idProduct);
                    rating = Integer.parseInt(rate);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
                String sql = "SELECT * FROM books WHERE id=? and active = 1";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setString(1, id);
                ResultSet book = pst.executeQuery();
                book.first();
                int count = book.getInt("ratingCounter");
                count++;
                int phanTramRating = rating * 100 / 5;
                int rateUpdate = book.getInt("rating");

                int ra = (rateUpdate + phanTramRating) / count;

                sql = "UPDATE books SET rating=? WHERE id= ?";
                PreparedStatement pst1 = conn.prepareStatement(sql);
                pst1.setInt(1, ra);
                pst1.setInt(2, idInt);
                pst1.executeUpdate();
                System.out.println("ok");
            } else {


                String sql = "SELECT * FROM books WHERE id=? and active = 1";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setString(1, id);
                ResultSet book = pst.executeQuery();
                book.first();
                String type = book.getString("type");
                String author = book.getString("author");
//            System.out.println(type);
                book.first();
                String sqlBooks = "SELECT books.id, books.title, books.price, img.img, img.id, books.rating,books.description FROM" +
                        " img inner JOIN books ON img.id_book = books.id  WHERE active = 1 AND TYPE = ? GROUP BY img.id_book ";

                PreparedStatement pstBooks = conn.prepareStatement(sqlBooks);
                pstBooks.setString(1, type);
                ResultSet listBook = pstBooks.executeQuery();

                String sqlCate = "SELECT * FROM categories WHERE id= ?";
                PreparedStatement pstCate = conn.prepareStatement(sqlCate);
                pstCate.setString(1, type);
                ResultSet cate = pstCate.executeQuery();
                request.setAttribute("cate", cate);

                String img = "SELECT * FROM img WHERE id_book= ? LIMIT 3";
                PreparedStatement pstImg = conn.prepareStatement(img);
                pstImg.setString(1, id);
                ResultSet imgs = pstImg.executeQuery();

                String sqlauthor = "SELECT * FROM authors WHERE id= ?";
                PreparedStatement ptauthor = conn.prepareStatement(sqlauthor);
                ptauthor.setString(1, author);
                ResultSet reauthor = ptauthor.executeQuery();

                request.setAttribute("img", imgs);
                request.setAttribute("author", reauthor);
                request.setAttribute("book", book);
                request.setAttribute("listBook", listBook);

                request.getRequestDispatcher("/customer/view/single-product.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}