package controller.tool;

import java.io.*;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

public class Sign {

    public byte[] signature(File privateKey, File data) throws NoSuchProviderException, NoSuchAlgorithmException, IOException, InvalidKeySpecException, InvalidKeyException, SignatureException {
        FileInputStream keyFis = new FileInputStream(privateKey);
        byte[] enckey = new byte[keyFis.available()];
        keyFis.read(enckey);
        keyFis.close();
        PKCS8EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(enckey);
        KeyFactory keyFactory = KeyFactory.getInstance("DSA", "SUN");
        PrivateKey priv = keyFactory.generatePrivate(privateKeySpec);
        java.security.Signature dsa = java.security.Signature.getInstance("SHA1withDSA", "SUN");
        dsa.initSign(priv);

        FileInputStream fis = new FileInputStream(data);
        BufferedInputStream bufin = new BufferedInputStream(fis);
        byte[] buffer = new byte[1024];
        int len;

        while ((len = bufin.read(buffer)) >= 0) {

            dsa.update(buffer, 0, len);

        }
        bufin.close();
        byte[] realSig = dsa.sign();
        System.out.println("KÝ THÀNH CÔNG");

//        FileOutputStream sigfos = new FileOutputStream(pathFileOut);
//        sigfos.write(realSig);
//        sigfos.close();

        VerSign ve = new VerSign();
       boolean res = ve.verify(realSig, 27);
        System.out.println("KET QUA: " + res);
        return realSig;
    }

    public static void main(String[] args)
            throws NoSuchAlgorithmException, NoSuchProviderException, InvalidKeyException, SignatureException {
        String nameFile = "1.jpg";
        String nameFileOut = "signature.txt";
        String nameFilePublicKey = "publickey.txt";
        try {
            KeyPairGenerator keyGen = KeyPairGenerator.getInstance("DSA", "SUN");
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG", "SUN");
            keyGen.initialize(1024, random);
            KeyPair pair = keyGen.generateKeyPair();
            PrivateKey priv = pair.getPrivate();
            PublicKey pub = pair.getPublic();

            java.security.Signature dsa = java.security.Signature.getInstance("SHA1withDSA", "SUN");
            dsa.initSign(priv);

            FileInputStream fis = new FileInputStream(nameFile);
            BufferedInputStream bufin = new BufferedInputStream(fis);
            byte[] buffer = new byte[1024];
            int len;

            while ((len = bufin.read(buffer)) >= 0) {

                dsa.update(buffer, 0, len);

            }
            bufin.close();
            byte[] realSig = dsa.sign();

            FileOutputStream sigfos = new FileOutputStream(nameFileOut);
            sigfos.write(realSig);
            sigfos.close();

            byte[] key = pub.getEncoded();
            FileOutputStream keyfos = new FileOutputStream(nameFilePublicKey);
            keyfos.write(key);
            keyfos.close();

        } catch (IOException e) {
            System.out.println("Caught exception" + e.toString());
        }

    }

}
