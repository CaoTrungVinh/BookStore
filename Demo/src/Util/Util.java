package Util;

import java.net.http.HttpRequest;

public class Util {
    static final String HOST = "http://localhost:8080/";

    public static String fullPath(String path) {
        return HOST + path;
    }

//    public static <T> T getParameterGeneric(HttpRequest request, String param) {
//        return request.getParameter(param) == null ? "" : request.getParameter(param);
//    }
}
