package controller.cart;

import Model.Cart;
import Model.User;
import Util.Util;
import db.ConnectionDB;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/cart-update")
public class Update extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int flag = Integer.parseInt(Util.getParameterGeneric(request, "flag", ""));
        int bookID = Integer.parseInt(Util.getParameterGeneric(request, "bookID", ""));

        String sql;
        ResultSet rs;
        Cart cart = null;

        try {

            User user = (User) request.getSession().getAttribute("user");
            boolean isLogin = user != null;
            cart = isLogin ? user.getCart() : (Cart) request.getSession().getAttribute("cart");
            cart.changeQuantityProduct(flag, bookID);

            //edit database
            sql = "SELECT * FROM orderdetails WHERE  orderdetails.id_book =  '" + bookID + "' and  orderdetails.id_order  = '" + cart.getId_order() + "' ";
//            statement = ConnectionDB.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            PreparedStatement statement = ConnectionDB.getConnection().prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = statement.executeQuery(sql);
            if (rs.next()) {
                int currentQuantity = rs.getInt("quantity");
                System.out.println(currentQuantity + flag);
                rs.updateInt("quantity", currentQuantity + flag);
                rs.updateRow();
            }

            Util.updateOrderDB(statement.getConnection(), cart);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        JSONObject jsonObject = new JSONObject();
        jsonObject.put("price", Util.showPrice(cart.getTotalPrice()));
        response.getWriter().write(jsonObject.toString());
        response.getWriter().flush();
        response.getWriter().close();
    }

}
