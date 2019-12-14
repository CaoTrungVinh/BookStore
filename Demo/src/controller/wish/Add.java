//package controller.wish;
//
//import Model.Cart;
//import Model.Product;
//import Model.Wish;
//import Util.Util;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//
//@WebServlet("/AddWish")
//public class Add extends HttpServlet {
//
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        try {
//            HttpSession session = request.getSession();
//            int id = Integer.parseInt(request.getParameter("id"));
//            Product p = Product.find(id);
//            Wish c = (Wish)session.getAttribute("Wish");
//            if (c == null) c = new Wish();
//            if (c!= null)
//                c.put(p);
//            session.setAttribute("Wish", c);
//        }catch (NumberFormatException e){
//        }
//        response.sendRedirect(Util.fullPath("list-book"));
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//}