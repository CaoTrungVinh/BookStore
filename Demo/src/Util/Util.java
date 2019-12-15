package Util;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
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
