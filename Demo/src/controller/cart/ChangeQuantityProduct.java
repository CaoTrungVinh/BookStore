package controller.cart;

import Model.Cart;
import Model.User;
import Util.Util;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ChangeQuantityProduct")
public class ChangeQuantityProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int flag = Integer.parseInt(Util.getParameterGeneric(request, "flag", ""));
        int bookID = Integer.parseInt(Util.getParameterGeneric(request, "bookID", ""));


        User user = (User) request.getSession().getAttribute("user");
        boolean isLogin = user != null;
        Cart cart = isLogin ? user.getCart() : (Cart) request.getSession().getAttribute("cart");
        cart.changeQuantityProduct(flag, bookID);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "ok");
        jsonObject.put("price", Util.showPrice(cart.getTotalPrice()));
        //database


        response.getWriter().write(jsonObject.toString() );
        response.getWriter().flush();
        response.getWriter().close();
    }

}
