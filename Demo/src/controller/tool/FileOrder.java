package controller.tool;

import Model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileOrder {

    public String createFileOrder(HttpServletRequest request, HttpServletResponse response, User user, String contentFile) {
String name = "ThongTinOrder" + user.getEmail().split("@")[0] + ".txt";
        String pathFile = request.getServletContext().getRealPath("public") +"/"+ name;
        File file = new File(pathFile);


            try {
                file.createNewFile();
                FileOutputStream keyfos = new FileOutputStream(file);
                keyfos.write(contentFile.getBytes());
                keyfos.close();
//                System.out.println("PATH FILE: " + file.getPath());
//
                HttpSession session = request.getSession();
//                request.setAttribute("fileinfo", "Thong Tin Order " + user.getEmail().split("@")[0] + ".txt");
                session.setAttribute("fileinfo", name);



                return name;
            } catch (IOException e) {
                e.printStackTrace();

                return null;
            }

    }
}
