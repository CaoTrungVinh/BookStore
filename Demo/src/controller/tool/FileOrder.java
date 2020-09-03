package controller.tool;

import Model.User;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileOrder {

    public String createFileOrder(HttpServletRequest request, User user, String contentFile) {

        String pathFile = request.getServletContext().getRealPath("public") + "./ThongTinOrder" + user.getEmail().split("@")[0] + ".txt";
        File file = new File(pathFile);
        if (!file.exists()) {

            try {
                file.createNewFile();
                FileOutputStream keyfos = new FileOutputStream(file);
                keyfos.write(contentFile.getBytes());
                keyfos.close();
                System.out.println("PATH FILE: " + file.getPath());
                request.setAttribute("fileinfo", "public/ThongTinOrder" + user.getEmail().split("@")[0] + ".txt");
                return "public/ThongTinOrder" + user.getEmail().split("@")[0] + ".txt";
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
