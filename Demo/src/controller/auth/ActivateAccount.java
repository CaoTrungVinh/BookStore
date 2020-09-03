package controller.auth;

import controller.tool.SendingEmail;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("./active-account")
public class ActivateAccount extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("key1");
        String hash = request.getParameter("key2");

        try {

            //generate pub-priv Key
            GenKey gen = new GenKey();
            String pathFilePub = request.getServletContext().getRealPath("public") + "./pubLicKey" + email.split("@")[0] + ".txt";
            String pathFilePriv = request.getServletContext().getRealPath("public") + "./privateKey" + email.split("@")[0] + ".txt";
/// generate key and send mail
            gen.generateKey(pathFilePriv, pathFilePub);
//            KeyPairGenerator keyGen = KeyPairGenerator.getInstance("DSA", "SUN");
//            SecureRandom random = SecureRandom.getInstance("SHA1PRNG", "SUN");
//            keyGen.initialize(1024, random);
//            KeyPair pair = keyGen.generateKeyPair();
//            PrivateKey priv = pair.getPrivate();
//            PublicKey pubKey = pair.getPublic();
//
////                    Sen
//
//            byte[] key = priv.getEncoded();
//
//            File file = new File(request.getServletContext().getRealPath("public") + "./privateKey" + email.split("@")[0] + ".txt");
//            if (!file.exists()) {
//
//                file.createNewFile();
//                System.out.println("CREATE FILE SUCCESSFULLY");
//            }
//            FileOutputStream keyfos = new FileOutputStream(file);
//            keyfos.write(key);
//            keyfos.close();
//
//            byte[] keyPub = pubKey.getEncoded();
//            File filePub = new File(request.getServletContext().getRealPath("public") + "./pubLicKey" + email.split("@")[0] + ".txt");
//            if (!filePub.exists()) {
//
//                filePub.createNewFile();
//                System.out.println("CREATE FILE SUCCESSFULLY");
//            }
//            FileOutputStream keyfosP = new FileOutputStream(filePub);
//            keyfosP.write(keyPub);
//            keyfosP.close();
//


            Connection conn = ConnectionDB.getConnection();
            PreparedStatement pst = conn.prepareStatement("select email, email_hashed, is_active from users where email=? and email_hashed=? and is_active='0'");
            pst.setString(1, email);
            pst.setString(2, hash);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                PreparedStatement pst1 = conn.prepareStatement("update users set is_active='1', publickey=? where email=? and email_hashed=?");
                pst1.setBytes(1, gen.getKeyPub());
                pst1.setString(2, email);
                pst1.setString(3, hash);
                int i = pst1.executeUpdate();
                if (i == 1) {
                    request.setAttribute("verify200", "Account Successfully Verified.");

                    //send mail
                    SendingEmail senMail = new SendingEmail();
                    senMail.sendMailKey(email, pathFilePriv, pathFilePub);
                    request.getRequestDispatcher("./customer/view/login.jsp").forward(request, response);
                } else {
                    response.sendRedirect("");
                }
            }
        } catch (Exception var10) {
            System.out.println("Error at ActivateAccount.java: " + var10);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
