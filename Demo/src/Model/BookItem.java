package Model;


import db.ConnectionDB;

import java.sql.*;

public class BookItem {
    int id;
    String name;
    int quantity;
    String img;
    public double price;

    public BookItem() {

    }

    public BookItem(int id, String name, int quantity, double price) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    public static BookItem find(int id) {
        try {
            Statement s = ConnectionDB.connect();
            Connection conn = s.getConnection();
            String sql = "SELECT books.id, books.title, books.price, img.img, img.id FROM img inner JOIN books ON img.id_book = books.id WHERE books.id=? and active = 1";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                BookItem p = new BookItem();
                p.id = rs.getInt(1);
                p.name = rs.getString(2);
                p.price = rs.getDouble(3);
                p.img = rs.getString(4);
                p.quantity = 1;
                return p;
            }
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void quantityUp() {
        this.quantity++;
    }

    public void quantityUp(int quantity) {
        setQuantity(this.quantity + quantity);
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        if (quantity < 1) quantity = 1;
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getTotalPrice() {
        return (int) price * quantity;
    }


}
