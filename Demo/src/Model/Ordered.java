package Model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;

public class Ordered {
    private int id;
    private Timestamp date;
    private ArrayList<Product> products;
    private int totalPrice;
    private String status;

    public Ordered(int id, Timestamp date, ArrayList<Product> products, int totalPrice, String status) {
        this.id = id;
        this.date = date;
        this.products = products;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getProducts() {
        String rs = "";
        for (Product product : products) {
            rs += product.toString2() + "<br>";
        }
        return rs.trim();
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Ordered{" +
                "id=" + id +
                ", date=" + date +
                ", products=" + Arrays.toString(products.toArray()) +
                ", totalPrice=" + totalPrice +
                '}';
    }
}



