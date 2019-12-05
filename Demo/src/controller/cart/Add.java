package controller.cart;

import Model.BookItem;
import Model.User;
import Util.Util;
import com.google.gson.Gson;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/add-cart")
public class Add extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookID = Integer.parseInt((String) Util.getParameterGeneric(request, "bookID", ""));
        User user = (User) request.getSession().getAttribute("user");
        boolean isLogin = user != null;
        Connection conn = null;
        String sql;
        Statement statement = null;
        int quantity = 1;
        BookItem bookItem = null;
        try {
            statement = ConnectionDB.connect();
            conn = statement.getConnection();
            ResultSet rs;

            if (isLogin) {
                sql = "SELECT id FROM orders WHERE id_customer = '" + user.getId() + "' AND statusID = 1";
                rs = statement.executeQuery(sql);

                if (rs.next()) {
                    user.setId_order(rs.getInt("id"));
                }
                sql = "SELECT * FROM orderdetails WHERE orderdetails.id_order = '" + user.getId_order() + "' AND id_book = '" + bookID + "'";


                rs = statement.executeQuery(sql);


                if (rs.next()) {
                    int currentQuantity = rs.getInt("quantity");
                    rs.updateInt("quantity", currentQuantity + 1);
                    rs.updateRow();
                    currentQuantity = rs.getInt("quantity");
                    quantity = currentQuantity;
                } else {
                    sql = "INSERT INTO orderdetails (id_order, id_book,quantity) VALUES(?,?,?)";
                    PreparedStatement preparedStatement = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    preparedStatement.setInt(1, bookID);
                    preparedStatement.setInt(2, 1);
                }

                sql = "SELECT * FROM books JOIN img ON books.id = img.id_book WHERE books.id = '" + bookID + "'";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    bookItem = new BookItem(bookID, rs.getString("title"), quantity, rs.getDouble("price"));
                    bookItem.setImg(rs.getString("img"));
                }
                user.addToShoppingCard(bookItem);
            } else {
                sql = "SELECT * FROM books JOIN img ON books.id = img.id_book WHERE books.id = '" + bookID + "'";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    bookItem = new BookItem(bookID, rs.getString("title"), quantity, rs.getDouble("price"));
                    bookItem.setImg(rs.getString("img"));
                }
                ArrayList<BookItem> card = (ArrayList<BookItem>) request.getSession().getAttribute("card");
                card.add(bookItem);
            }


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        Gson gson = new Gson();
        String json = gson.toJson(bookItem);

        response.getWriter().write(json.toString());
        response.getWriter().flush();
        response.getWriter().close();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
