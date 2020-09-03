package controller.cart;

import Model.Cart;
import Model.Ordered;
import Model.Product;
import Model.User;
import Util.Util;
import controller.tool.FileOrder;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

@WebServlet("./ConfirmOrder")
public class ConfirmOrder extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("name", user.getFullName());
        request.setAttribute("phone", user.getPhone());
        request.setAttribute("address", user.getAddress());
        request.getRequestDispatcher("./customer/view/confirm-Order.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String[] ids = request.getParameterValues("payids"); // id of order detail which processed to pay [order_details]
        User user = (User) request.getSession().getAttribute("user");
        String sql;

        try {
            Connection conn = ConnectionDB.getConnection();
            Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

            // add new row in order status = 2. -> get new id
            sql = "INSERT INTO orders (id_customer, statusID) VALUES('" + user.getId() + "',2)";
            PreparedStatement pStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pStatement.executeUpdate();


            ResultSet generatedKeys = pStatement.getGeneratedKeys();
            int id_ordered = 0; // new id
            if (generatedKeys.next()) {
                id_ordered = generatedKeys.getInt(1);
            }
            int id_order = user.getCart().getId_order();
            // update row in order detail  based on ids
            sql = "SELECT * FROM `orderdetails` WHERE id_order = " + id_order;
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                if (contain(ids, rs.getInt("id_book"))) {
                    rs.updateInt("id_order", id_ordered);
                    rs.updateRow();  // update order -> ordered
                }
            }

            int totalMoney = getTotal(user, ids);
            sql = "UPDATE `orders` SET orderDate = ?, total = ? WHERE id = ?";
            pStatement = conn.prepareStatement(sql);
            pStatement.setTimestamp(1, new Timestamp(new java.util.Date().getTime()));
            pStatement.setInt(2, totalMoney);
            pStatement.setInt(3, id_ordered);
            pStatement.executeUpdate();

            for (String id : ids) {
                user.getCart().remove(Integer.parseInt(id)); // remove in session
            }

            sql = "SELECT * FROM orderdetails JOIN books ON books.id = orderdetails.id_book WHERE orderdetails.id_order = " + id_ordered;
            rs = statement.executeQuery(sql);
            ArrayList<Product> products = new ArrayList<Product>();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getInt("price"));
                products.add(p);
            }

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Ordered ordered = new Ordered(id_ordered, new Timestamp(new Date().getTime()), products, totalMoney, "2");

            // file info order
//            String pathFile = request.getServletContext().getRealPath("public") + "./ThongTinOrder" + user.getEmail().split("@")[0] + ".txt";
//            File file = new File(pathFile);
//            if (!file.exists()) {
//
//                file.createNewFile();
//                System.out.println("CREATE FILE SUCCESSFULLY");
//            }
//            FileOutputStream keyfos = new FileOutputStream(file);
//            keyfos.write("abc".getBytes());
//            keyfos.close();
//            System.out.println("PATH FILE: "+file.getPath());


            // user + ordered
            System.out.println(user + "\r\n" + ordered);
            String contentFile = user + "\r\n" + ordered; // Tánh trả về
            FileOrder fileOrder = new FileOrder();
            String pathFileDownload = fileOrder.createFileOrder(request, user, contentFile);
            request.setAttribute("fileinfo", pathFileDownload);

            request.getRequestDispatcher("./customer/view/signature.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    private int getTotal(User user, String[] ids) {
        int rs = 0;

        for (Map.Entry<Integer, Product> entry : user.getCart().data.entrySet()) {
            for (String id : ids) {
                if (entry.getKey() == Integer.parseInt(id)) {
                    rs += entry.getValue().getTotalPrice();
                }
            }
        }
        return rs;
    }

    private boolean contain(String[] ids, int id_order) {
        for (String id : ids) {
            if (Integer.parseInt(id) == id_order) return true;
        }
        return false;
    }
}
