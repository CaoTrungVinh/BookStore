package controller.tool;

import db.ConnectionDB;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VerSign {

    public boolean verify(HttpServletRequest request, byte[] data, int idUser) {

        try {
            Connection con = ConnectionDB.getConnection();
            String sl = "SELECT publickey FROM users where id=?";
            PreparedStatement pre = con.prepareStatement(sl);
            pre.setInt(1, idUser);
            ResultSet re = pre.executeQuery();
            re.next();
            byte[] pub = re.getBytes("publickey");

            X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(pub);
            KeyFactory keyFactory = KeyFactory.getInstance("DSA", "SUN");
            PublicKey publicKey = keyFactory.generatePublic(pubKeySpec);


            Signature sig = Signature.getInstance("SHA1withDSA", "SUN");
            sig.initVerify(publicKey);

            String pathFOrder = request.getServletContext().getRealPath("public") +"/"+  (String) request.getSession().getAttribute("fileinfo");

            System.out.println("PATH SESSONl " + pathFOrder);
            FileInputStream datafis = new FileInputStream(pathFOrder);
            BufferedInputStream bufin = new BufferedInputStream(datafis);
            byte[] buffer = new byte[1024];
            int len;
            while (bufin.available() != 0) {
                len = bufin.read(buffer);
                sig.update(buffer, 0, len);
            }
            bufin.close();

            boolean verifies = sig.verify(data);
            System.out.println("Signature verifile " + verifies);

            return verifies;

        } catch (SQLException | NoSuchAlgorithmException | NoSuchProviderException | InvalidKeySpecException | InvalidKeyException | FileNotFoundException throwables) {
            throwables.printStackTrace();
        } catch (SignatureException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


        return false;
    }

    public static void main(String[] args) {
        try {
            FileInputStream keyFis = new FileInputStream("publickey.txt");
            byte[] enckey = new byte[keyFis.available()];
            keyFis.read(enckey);
            keyFis.close();
            X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(enckey);
            KeyFactory keyFactory = KeyFactory.getInstance("DSA", "SUN");
            PublicKey publicKey = keyFactory.generatePublic(pubKeySpec);

            FileInputStream sigfis = new FileInputStream("signature.txt");
            byte[] sigToVerify = new byte[sigfis.available()];
            sigfis.read(sigToVerify);
            sigfis.close();

            Signature sig = Signature.getInstance("SHA1withDSA", "SUN");
            sig.initVerify(publicKey);

            FileInputStream datafis = new FileInputStream("1.jpg");
            BufferedInputStream bufin = new BufferedInputStream(datafis);
            byte[] buffer = new byte[1024];
            int len;
            while (bufin.available() != 0) {
                len = bufin.read(buffer);
                sig.update(buffer, 0, len);
            }
            bufin.close();

            boolean verifies = sig.verify(sigToVerify);
            System.out.println("Signature verifile " + verifies);
        } catch (Exception e) {
            System.err.print("Caught exception" + e.toString());
        }
    }

}
