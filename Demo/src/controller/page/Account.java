package controller.page;

import Model.Ordered;
import Model.Product;
import Model.User;
import Util.Util;
import controller.auth.PasswordAuthentication;
import controller.tool.SendingEmail;
import controller.tool.VerSign;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;


@WebServlet(urlPatterns = {"/account", "/account/edit", "/account/address", "/account/add-address", "/account/order", "/account/wishlist", "/account/change-key", "/account/order-detail", "/account/order-detail-hdh"})
//@WebServlet("/account")
public class Account extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        String sql;
        ResultSet rs;
        Statement statement = null;
        try {
            conn = ConnectionDB.getConnection();
            statement = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String type = request.getParameter("type");
        Model.User user = (Model.User) request.getSession().getAttribute("user");
        request.setAttribute("user", user);

        if (request.getServletPath().equals("/account") || request.getServletPath().equals("/account/edit")) {
            request.setAttribute("route", "edit");
        } else if (request.getServletPath().equals("/account/address")) {
            request.setAttribute("route", "address");
        } else if (request.getServletPath().equals("/account/add-address")) {
            request.setAttribute("route", "add-address");
        } else if (request.getServletPath().equals("/account/change-key")) {
            request.setAttribute("route", "change-key");
        } else if (request.getServletPath().equals("/account/order")) {
            try {
                ArrayList<Ordered> ordereds = new ArrayList<Ordered>();
                sql = "SELECT orders.*, statuses.status FROM orders JOIN statuses ON statuses.id = orders.statusID WHERE id_customer = '" + user.getId() + "'";
                rs = statement.executeQuery(sql);
                while (rs.next()) {
                    Statement statement2 = conn.createStatement();
                    ResultSet rs2 = statement2.executeQuery("SELECT * FROM orderdetails JOIN books ON books.id = orderdetails.id_book WHERE orderdetails.id_order = '" + rs.getInt("id") + "'");
                    ArrayList<Product> products = new ArrayList<Product>();
                    while (rs2.next()) {
                        Product p = new Product();
                        p.setId(rs2.getInt("id"));
                        p.setTitle(rs2.getString("title"));
                        p.setQuantity(rs2.getInt("quantity"));
                        p.setPrice(rs2.getInt("price"));
                        products.add(p);
                    }
                    Ordered ordered = new Ordered(rs.getInt("id"), rs.getTimestamp("orderDate"), products, rs.getInt("total"), rs.getString("status"));
                    ordereds.add(ordered);
                }
                request.setAttribute("ordereds", ordereds);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("route", "order");
        } else if (request.getServletPath().equals("/account/order-detail")) {
            try {
                ArrayList<Ordered> ordereds = new ArrayList<Ordered>();
                sql = "SELECT orders.*, statuses.status FROM orders JOIN statuses ON statuses.id = orders.statusID WHERE id_customer = '" + user.getId() + "' AND orders.statusID = 2";
                rs = statement.executeQuery(sql);
                while (rs.next()) {
                    Statement statement2 = conn.createStatement();
                    ResultSet rs2 = statement2.executeQuery("SELECT * FROM orderdetails JOIN books ON books.id = orderdetails.id_book WHERE orderdetails.id_order = '" + rs.getInt("id") + "'");
                    ArrayList<Product> products = new ArrayList<Product>();
                    while (rs2.next()) {
                        Product p = new Product();
                        p.setId(rs2.getInt("id"));
                        p.setTitle(rs2.getString("title"));
                        p.setQuantity(rs2.getInt("quantity"));
                        p.setPrice(rs2.getInt("price"));
                        products.add(p);
                    }
                    Ordered ordered = new Ordered(rs.getInt("id"), rs.getTimestamp("orderDate"), products, rs.getInt("total"), rs.getString("status"));
                    ordereds.add(ordered);
                }
                request.setAttribute("ordereds", ordereds);

                String id = request.getParameter("id");
                if (id != null && !id.equals("")) {

                    String sqlOdetail = "SELECT * FROM orderdetails JOIN books ON orderdetails.id_book = books.id JOIN orders ON orderdetails.id_order = orders.id where orders.id=? ";
                    PreparedStatement pstdetail = conn.prepareStatement(sqlOdetail);
                    pstdetail.setInt(1, Integer.parseInt(id));
//                    System.out.println(id);
                    ResultSet detail = pstdetail.executeQuery();

                    request.setAttribute("detail", detail);

                    String sqlHDH = "SELECT * FROM orders JOIN statuses on orders.statusID = statuses.id where orders.id=? ";
                    PreparedStatement pstHDH = conn.prepareStatement(sqlHDH);
                    pstHDH.setInt(1, Integer.parseInt(id));
//                    System.out.println(id);
                    ResultSet hdh = pstHDH.executeQuery();

                    request.setAttribute("detail", detail);
                    request.setAttribute("hdh", hdh);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("route", "orderdetail");
        }
        else if (request.getServletPath().equals("/account/wishlist")) {
            request.setAttribute("wishlist", user.getWishlist().getWishlist());
            request.setAttribute("route", "wishlist");
        }
        request.getRequestDispatcher("/customer/account/my-account.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        Model.User userss = (Model.User) request.getSession().getAttribute("user");
        if (request.getServletPath().equals("/account/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String fullname = request.getParameter("fullname");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String dateofbirth = request.getParameter("dateofbirth");
                String is_change_pass = request.getParameter("is_change_pass");
                String oldPass = request.getParameter("old_password");
                String newPass = request.getParameter("new_password");
                String reNewPass = request.getParameter("re_new_password");
//                String dateofbirth = year + "-" + month + "-" + day;
                System.out.println(name + "\t" + email + "\t" + fullname + "\t" + gender + "\t" + address + phone + "\t" + dateofbirth);

                System.out.println(is_change_pass);
                System.out.println(dateofbirth);

                try {
                    Connection conn = ConnectionDB.getConnection();
                    String sqlUser = "SELECT * FROM users Where id=?";
                    PreparedStatement u = conn.prepareStatement(sqlUser);
                    u.setString(1, id);
                    ResultSet rs = u.executeQuery();
                    rs.next();
                    User user = new User();
                    if (is_change_pass != null) {


                        if (oldPass != null && !oldPass.equals("") && PasswordAuthentication.check(oldPass, rs.getString("password"))) {

                            if (newPass.length() < 8 || newPass.length() > 32) {
                                System.out.println("new pass");
                                HttpSession session = request.getSession();
                                session.setAttribute("edit-account-noti", "Password length must be between 8 and 32 character");
                                response.sendRedirect("/account/edit?id=" + id);
                                return;
                            }

                            if (newPass.equals(reNewPass)) {

                                String hashPass = PasswordAuthentication.getSaltedHash(newPass);
                                String sqlPass = "UPDATE users SET password=? WHERE id=?";
                                PreparedStatement pstPass = conn.prepareStatement(sqlPass);

                                pstPass.setString(1, hashPass);
                                pstPass.setString(2, id);
                                pstPass.execute();
//                                System.out.println("OK");
//                                user.setPassword();

                            } else {
                                System.out.println("re pass");
                                HttpSession session = request.getSession();
                                session.setAttribute("edit-account-noti", "Password not match");
                                response.sendRedirect("/account/edit?id=" + id);
                                return;
                            }


                        } else {
                            System.out.println("old pass");
                            HttpSession session = request.getSession();
                            session.setAttribute("edit-account-noti", "Old password not correct");
                            response.sendRedirect("/account/edit?id=" + id);
                            return;
                        }
                    }
                    String sqlCategory = "UPDATE users SET name=?,email=?,fullname=?,gender=?,address=?,phone=?,dateofbirth=? where id=?";

                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);

                    pstCate.setString(1, name);
                    pstCate.setString(2, email);
                    pstCate.setString(3, fullname);
                    pstCate.setString(4, gender);
                    pstCate.setString(5, address);
                    pstCate.setString(6, phone);
                    pstCate.setString(7, dateofbirth);
                    pstCate.setString(8, id);
                    pstCate.execute();

                    sqlUser = "SELECT * FROM users Where id=?";
                    u = conn.prepareStatement(sqlUser);
                    u.setString(1, id);
                    rs = u.executeQuery();
                    rs.next();

                    user.setId(rs.getInt("id"));
                    user.setUserName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setFullName(rs.getString("fullname"));
                    user.setGender(rs.getString("gender"));
//                    user.setAddress(rs.getString("address"));
                    user.setPhone(rs.getString("phone"));
                    user.setDateofbirth(rs.getString("dateofbirth"));
                    System.out.println("userdob: " + dateofbirth);
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    session.setAttribute("edit-account-noti", "Update successfully");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect("/account/edit?id=" + id);
        } else if (request.getServletPath().equals("/account/change-key")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String fullname = request.getParameter("fullname");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String dateofbirth = request.getParameter("dateofbirth");
                System.out.println(name + "\t" + email + "\t" + fullname + "\t" + gender + "\t" + address + phone + "\t" + dateofbirth);

                if (request.getParameter("download") != null) {
                    FileOutputStream f = new FileOutputStream(new File(request.getServletContext().getRealPath("\\public") + "\\data.txt"));
                    String data = "Name: " + name + "\n" + "Email: " + email + "\n" + "Giới tính: " + gender + "\n" + "Address: " + address + "\n" + "Phone number: " + phone + "\n" + dateofbirth;
                    System.out.println(data);
                    f.write(data.getBytes());
                    f.flush();
                    f.close();
                    String fullPath = request.getServletContext().getRealPath("\\public\\data.txt");
                    Path path = Paths.get(fullPath);
                    byte[] d = Files.readAllBytes(path);

                    response.setContentType("application/octet-stream");
                    response.setHeader("Content-disposition", "attachment; filename=" + userss.getEmail() + "_Data.txt");
                    response.setContentLength(d.length);
                    InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(d));
                    // Ghi file ra response outputstream.
                    OutputStream outStream = response.getOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outStream.write(buffer, 0, bytesRead);
                    }
                    inputStream.close();
                    outStream.close();
                }

                Connection conn = null;
                String hashMail = "";
                try {
                    conn = ConnectionDB.getConnection();
                    String sqlUser = "SELECT email_hashed FROM users Where id=" + userss.getId();
                    PreparedStatement u = conn.prepareStatement(sqlUser);
                    ResultSet rs = u.executeQuery();
                    rs.next();
                    hashMail = rs.getString("email_hashed");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                String ver = request.getParameter("ver");
                VerSign vs = new VerSign();
                if (vs.verify(request, ver.getBytes(), userss.getId())) {
                    SendingEmail sendingEmail = new SendingEmail("active-account", email, hashMail);
                    sendingEmail.start();
                } else {

                }
            }
        }
        else if (request.getServletPath().equals("/account/order-detail")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                Connection conn = null;
                try {
                    conn = ConnectionDB.getConnection();

                    String sqlhdh = "UPDATE orders SET statusID=? where id=?";

                    PreparedStatement psthdh = conn.prepareStatement(sqlhdh);
                    psthdh.setString(1, String.valueOf(4));
                    psthdh.setString(2, id);
                    psthdh.execute();

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect(Util.fullPath("account/order-detail?id="+ id));
        }
    }
}
