package controller;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;


@WebServlet("/ListBook")
public class ListBook extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
//        response.setContentType("/ListBook; charset=UTF-8");
        String type = request.getParameter("type");
//        String search = request.getParameter("selectSearch");
        String page = request.getParameter("page");
        response.getWriter().println(page);
        int idType = 0;
        int pageNum = 1;

        try {
            idType = Integer.parseInt(type);

        } catch (Exception e) {

        }
        try {
            pageNum = Integer.parseInt(page);

        } catch (Exception e) {

        }

        try {
            Statement s = ConnectionDB.connect();
            Connection conn = s.getConnection();
            String sql = "SELECT id, name FROM categories WHERE active = 1";

            PreparedStatement pst = conn.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();

            request.setAttribute("rs", rs);

            Statement s1 = ConnectionDB.connect();
            Connection conn1 = s1.getConnection();

            sql = "SELECT books.id, books.title, books.price, img.img, img.id FROM img inner JOIN books ON img.id_book = books.id WHERE active = 1";

            if (idType != 0) {
                sql += " and type = " + idType;
            }
//            else if(search != null) {
//                sql += " and search =" + search;
//            }
            PreparedStatement pst2 = conn1.prepareStatement(sql);

            response.getWriter().println(sql);

            ResultSet book = pst2.executeQuery();
            book.last();
            int rows = book.getRow();
            book.first();
//            System.out.println("gjhjhiu" + rows);

            int nOfPages = rows / 9;

            if (nOfPages % 9 > 0) {
                nOfPages++;
            }


            request.setAttribute("book", book);
            request.setAttribute("currentPage", pageNum);
            request.setAttribute("nOfPages", nOfPages);
            request.setAttribute("idType", idType);

            request.getRequestDispatcher("customer/view/shop.jsp").forward(request, response);

            request.getRequestDispatcher("/customer/view/shop.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
