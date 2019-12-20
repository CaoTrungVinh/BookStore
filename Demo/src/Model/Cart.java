package Model;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    public HashMap<Integer, Product> data;
    int quantity;
    int id_order;

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public Cart() {
        this.data = new HashMap<>();
        id_order = -1;
        quantity = 0;
    }

    public Product get(int id) {
        return data.get(id);
    }

    public int put(Product item) {
        if (data.containsKey(item.getId()))
            data.get(item.getId()).quantityUp();
        else data.put(item.getId(), item);
        return data.get(item.getId()).getQuantity();
    }

    public int put(int id, int quantity) {
        if (data.containsKey(id)) data.get(id).quantityUp(quantity);
        return data.get(id).getQuantity();
    }

    public boolean remove(int id) {
        return data.remove(id) == null;
    }

    public double total() {
        double sum = 0;
        for (Product p : data.values())
            sum += (p.getQuantity() * p.getPrice());
        return sum;
    }


    public Collection<Product> list() {
        return data.values();
    }

    public int getTotalPrice() {
        int rs = 0;
        for (Map.Entry<Integer, Product> entry : data.entrySet()) {
            rs += entry.getValue().getTotalPrice();
        }
        return rs;
    }

    public int getQuantity() {
        int rs = 0;
        for (Map.Entry<Integer, Product> entry : data.entrySet()) {
            rs += entry.getValue().getQuantity();
        }
        return rs;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "data=" + data +
                ", id_order=" + id_order +
                '}';
    }

    public HashMap<Integer, Product> getData() {
        return data;
    }


    public void changeQuantityProduct(int flag, int bookID) {
        Product item = data.get(bookID);
        item.setQuantity(item.getQuantity() + flag);
        if (item.getQuantity() <= 0) remove(bookID);
    }
}
