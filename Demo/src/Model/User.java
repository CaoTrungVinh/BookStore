package Model;

import java.sql.*;

import db.ConnectionDB;

import java.sql.SQLException;
import java.util.ArrayList;

public class User {
    private int id;
    private String email;
    private String userName;
    private String fullName;
    private String gender;
    private String address;
    private String phone;
    private String avt;
    private int idgroup; // 1 is user, 2 is admin
    private int active; //0 is not active, 1 is active
    ArrayList<BookItem> shoppingCart;
    int id_order;

    public User() {
        shoppingCart = new ArrayList<BookItem>();
        id_order = -1;

    }

    public double getTotalPrice() {
        double rs = 0;
        for (int i = 0; i < shoppingCart.size(); i++) {
            rs += shoppingCart.get(i).getPrice();
        }
        return rs;
    }

    public boolean addToCart(int bookID, boolean isLogin) throws SQLException, ClassNotFoundException {

        Connection conn = null;
        String sql;
        Statement statement = ConnectionDB.connect();
        conn = statement.getConnection();
        ResultSet rs;

        if (isLogin) {
            sql = "SELECT id FROM orders WHERE id_customer = '" + this.id + "' AND statusID = 1";
            rs = statement.executeQuery(sql);

            if (rs.next()) {
                id_order = rs.getInt("id");
            }
        } else {
            sql = "INSERT INTO orders(statusID) VALUES (1)";
            statement.executeUpdate(sql);

        }


        sql = "SELECT * FROM orderdetails WHERE orderdetails.id_order = '" + id_order + "' AND id_book = '" + bookID + "'";

        rs = statement.executeQuery(sql);

        int quantity = 1;

        if (rs.next()) {
            int currentQuantity = rs.getInt("quantity");
            rs.updateInt("quantity", currentQuantity + 1);
            rs.updateRow();
            currentQuantity = rs.getInt("quantity");
            quantity = currentQuantity;
        } else {
            sql = "INSERT INTO orderdetails (id_book,quantity) VALUES(?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setInt(1, bookID);
            preparedStatement.setInt(2, 1);
        }

        sql = "SELECT * FROM books JOIN img ON books.id = img.id_book WHERE books.id = '" + bookID + "'";
        rs = statement.executeQuery(sql);
        BookItem bookItem = null;
        if (rs.next()) {
            bookItem = new BookItem(bookID, rs.getString("title"), quantity, rs.getDouble("price"));
            bookItem.setImg(rs.getString("img"));
        }
        addToShoppingCard(bookItem);

        return true;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        User user = new User();
        user.setId(1);
        user.addToCart(1, true);
    }


    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvt() {
        return avt;
    }

    public void setAvt(String avt) {
        this.avt = avt;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getIdgroup() {
        return idgroup;
    }

    public void setIdgroup(int idgroup) {
        this.idgroup = idgroup;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public ArrayList<BookItem> getShoppingCart() {
        return shoppingCart;
    }

    public void addToShoppingCard(BookItem bookItem) {
        this.shoppingCart.add(bookItem);
    }

    public void setShoppingCart(ArrayList<BookItem> shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", avt='" + avt + '\'' +
                ", idgroup=" + idgroup +
                ", active=" + active +
                '}';
    }

}
