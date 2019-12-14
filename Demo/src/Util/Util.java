package Util;
import javax.servlet.http.HttpServletRequest;

public class Util {
    static final String HOST = "http://localhost:8080/";

    public static String fullPath(String path) {
        return HOST + path;
    }

    public static <T> T getParameterGeneric(HttpServletRequest request, String param, T t) {
        return request.getParameter(param) == null ? t : (T)request.getParameter(param);
    }
}
