package controller.cart;

import Model.BookItem;
import Model.Cart;
import Model.User;
import Util.Util;
import com.google.gson.Gson;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

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
        Cart cart;
        cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            HttpSession session = request.getSession();
            session.setAttribute("cart", cart);
        }
        try {
            statement = ConnectionDB.connect();
            conn = statement.getConnection();
            ResultSet rs;

            if (isLogin) {
                sql = "SELECT id FROM orders WHERE id_customer = '" + user.getId() + "' AND statusID = 1";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    user.getCart().setId_order(rs.getInt("id"));
                }
                sql = "SELECT * FROM orderdetails WHERE orderdetails.id_order = '" + user.getCart().getId_order() + "' AND id_book = '" + bookID + "'";
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
                    preparedStatement.setInt(1, user.getCart().getId_order());
                    preparedStatement.setInt(2, bookID);
                    preparedStatement.setInt(3, 1);
                    preparedStatement.executeUpdate();
                }

                sql = "SELECT books.title, publishers.name, books.price, img.img\n" +
                        "FROM books \n" +
                        "JOIN img ON books.id = img.id_book \n" +
                        "JOIN publishers ON books.publisher = publishers.id \n" +
                        "WHERE books.id = '" + bookID + "'";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    bookItem = new BookItem(bookID, shortOfTitle(rs.getString("title")), rs.getString("name"),quantity, rs.getDouble("price"));
                    bookItem.setImg(rs.getString("img"));
                }
                user.addToShoppingCard(bookItem);
            } else {
                sql = "SELECT books.title, publishers.name, books.price, img.img\n" +
                        "FROM books \n" +
                        "JOIN img ON books.id = img.id_book \n" +
                        "JOIN publishers ON books.publisher = publishers.id \n" +
                        "WHERE books.id = '" + bookID + "'";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    bookItem = new BookItem(bookID, shortOfTitle(rs.getString("title")), rs.getString("name"),quantity, rs.getDouble("price"));
                    bookItem.setImg(rs.getString("img"));
                }

                cart.put(bookItem);
            }


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        Gson gson = new Gson();
        String bookItemJson = gson.toJson(bookItem);


        response.getWriter().write(bookItemJson);
        response.getWriter().flush();
        response.getWriter().close();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public String shortOfTitle(String t) {
        return t.length() > 12 ? t.substring(0, 13) + "..." : t;
    }
}

