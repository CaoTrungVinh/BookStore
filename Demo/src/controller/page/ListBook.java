package controller.page;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/list-book")
public class ListBook extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String type = request.getParameter("type");
        String nsx = request.getParameter("nsx");
        String idKM = request.getParameter("idKM");
        String page = request.getParameter("page");
        System.out.println("idkm: "+idKM);
        response.getWriter().println(page);
        int idType = 0;
        int pageNum = 1;
        int idNsx = 0;

        try {
            idType = Integer.parseInt(type);

        } catch (Exception e) {

        }
        try {
            pageNum = Integer.parseInt(page);


        } catch (Exception e) {

        }
        try {
            idNsx = Integer.parseInt(nsx);


        } catch (Exception e) {

        }

        try {
            Connection conn = ConnectionDB.getConnection();
            String sql = "SELECT id, name FROM categories WHERE active = 1";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            request.setAttribute("rs", rs);

            String sqlconnNSX = "SELECT id, name FROM publishers";
            PreparedStatement pstconnNSX = conn.prepareStatement(sqlconnNSX);
            ResultSet rsconnNSX = pstconnNSX.executeQuery();
            request.setAttribute("rsconnNSX", rsconnNSX);

            Connection conn1 = ConnectionDB.getConnection();
            sql = "SELECT books.id, books.title, books.price, img.img, img.id, books.rating, books.description, books.discount FROM" +
                    " img inner JOIN books ON img.id_book = books.id WHERE active = 1 GROUP BY img.id_book ";


            if (idType != 0) {
                sql = "SELECT books.id, books.title, books.price, img.img, img.id, books.rating,books.description, books.discount FROM" +
                        " img inner JOIN books ON img.id_book = books.id  WHERE active = 1 AND TYPE = " + idType + " GROUP BY img.id_book ";
            }
            if (idNsx != 0) {
                sql = "SELECT books.id, books.title, books.price, img.img, img.id, books.rating,books.description, books.discount FROM" +
                        " img inner JOIN books ON img.id_book = books.id  WHERE active = 1 AND publisher = " + idNsx + " GROUP BY img.id_book ";

            }
            if (idKM != null) {
                sql = "SELECT books.id, books.title, books.price, img.img, img.id, books.rating,books.description, books.discount FROM" +
                        " img inner JOIN books ON img.id_book = books.id  WHERE active = 1 AND books.discount IS NOT NULL GROUP BY img.id_book ";

            }
//            else if(search != null) {
//                sql += " and search =" + search;
//            }
            PreparedStatement pst2 = conn1.prepareStatement(sql);

            response.getWriter().println(sql);

            ResultSet book = pst2.executeQuery();
            book.last();
            int rows = book.getRow();
//            System.out.println("books: "+rows);
            book.beforeFirst();
//            System.out.println("gjhjhiu" + rows);

            int nOfPages = rows / 9;

            if (rows % 9 > 0) {
                nOfPages++;
            }

            if (pageNum <= 0 || pageNum > nOfPages) {
                pageNum = 1;

            }


            request.setAttribute("book", book);
            request.setAttribute("currentPage", pageNum);
            request.setAttribute("nOfPages", nOfPages);
            request.setAttribute("idType", idType);
            request.setAttribute("idNsx", idNsx);
            request.setAttribute("idKM", "km");


            rs = conn.createStatement().executeQuery("SELECT MAX(price) as max, MIN(price) as min FROM books");
            if (rs.next()) {
                request.setAttribute("maxP", rs.getDouble("max"));
                request.setAttribute("minP", rs.getDouble("min"));
            }
            request.getRequestDispatcher("customer/view/shop.jsp").forward(request, response);


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
