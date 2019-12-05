package Model;

import java.util.Collection;
import java.util.HashMap;

public class Cart {
    HashMap<Integer, BookItem> data;

    public Cart() {
        this.data = new HashMap<>();
    }

    public BookItem get(int id) {
        return data.get(id);
    }

    public int put(BookItem item) {
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
        for (BookItem p : data.values())
            sum += (p.quantity * p.price);
        return sum;
    }

    public Collection<BookItem> list() {
        return data.values();
    }
}
