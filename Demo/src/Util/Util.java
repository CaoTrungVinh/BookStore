package Util;

import javax.servlet.http.HttpServletRequest;
import java.text.NumberFormat;
import java.util.Locale;

public class Util {
    static final String HOST = "http://localhost:8080/";

    public static String fullPath(String path) {
        return HOST + path;
    }

    public static <T> T getParameterGeneric(HttpServletRequest request, String param, T t) {
        return request.getParameter(param) == null ? t : (T) request.getParameter(param);
    }

    public static String shortOfTitle(String t) {
        return t.length() > 12 ? t.substring(0, 13) + "..." : t;
    }

    public static String showPrice(int price) {
        String pricestr = String.valueOf(price);
        if (price / 1000 == 0) return price + "";
        return showPrice(price / 1000) + "." + (pricestr.substring(pricestr.length() - 3));

    }

    public static void main(String[] args) {
        System.out.println(showPrice(2404000));
    }

    public static String formatCurrency(String money) {
        double m = 0;
        try {
            m = Double.parseDouble(money);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        return currencyVN.format(m);
    }
}
