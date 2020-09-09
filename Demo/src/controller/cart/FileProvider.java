package controller.cart;

import Model.Ordered;
import Model.User;
import controller.tool.FileOrder;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/file")
public class FileProvider extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = (User) request.getSession().getAttribute("user");
//        request.setAttribute("name", user.getFullName());
//        request.setAttribute("phone", user.getPhone());
//        request.setAttribute("address", user.getAddress());
       String fileName = request.getParameter("fileName");
        Path path = Paths.get(request.getServletContext().getRealPath("public") +"/"+fileName);
        byte[] d = Files.readAllBytes(path);
        response.setContentType("application/octet-stream");
        response.setHeader("Content-disposition", "attachment; filename=" +fileName);
        response.setContentLength(d.length);
        InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(d));
        // Ghi file ra response outputstream.
        OutputStream outStream = response.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
        inputStream.close();
        outStream.close();

    }

   }
