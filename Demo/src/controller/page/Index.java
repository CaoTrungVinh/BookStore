package controller.page;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("")
public class Index extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String type = request.getParameter("type");
        try {
            Connection conn = ConnectionDB.getConnection();
            String sql = "SELECT books.id, books.title, books.price, img.img, img.id, books.rating, books.description FROM img inner JOIN books ON img.id_book = books.id WHERE active = 1 GROUP BY img.id_book ORDER BY  DATEDIFF(CURDATE(), DATE_FORMAT(FROM_UNIXTIME(UNIX_TIMESTAMP(createdAt)), '%Y-%m-%d')) LIMIT 10";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet bookNew = pst.executeQuery();
            request.setAttribute("bookNew", bookNew);

            Connection cTopRating = ConnectionDB.getConnection();
            sql = "SELECT books.id, books.title, books.price, img.img, img.id, books.rating, books.description FROM img inner JOIN books ON img.id_book = books.id WHERE active = 1 and books.rating> 99 GROUP BY img.id_book LIMIT 10";
            PreparedStatement pstTopRating = cTopRating.prepareStatement(sql);
            response.getWriter().println(sql);
            ResultSet bookcTopRating = pstTopRating.executeQuery();
            request.setAttribute("bookTopRating", bookcTopRating);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
