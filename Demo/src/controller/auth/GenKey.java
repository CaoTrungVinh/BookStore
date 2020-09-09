package controller.auth;

import controller.tool.SendingEmail;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.*;

public class GenKey {

    byte[] keyPub;

    public byte[] getKeyPub() {
        return keyPub;
    }

    public void generateKey( String pathFilePrivate, String pathFilePublic) throws NoSuchProviderException, NoSuchAlgorithmException, IOException {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("DSA", "SUN");
        SecureRandom random = SecureRandom.getInstance("SHA1PRNG", "SUN");
        keyGen.initialize(1024, random);
        KeyPair pair = keyGen.generateKeyPair();
        PrivateKey priv = pair.getPrivate();
        PublicKey pubKey = pair.getPublic();

//                    Sen

        byte[] keyPrivate = priv.getEncoded();

        File filePriv = new File(pathFilePrivate);
        if (!filePriv.exists()) {

            filePriv.createNewFile();
        }
        FileOutputStream keyfos = new FileOutputStream(filePriv);
        keyfos.write(keyPrivate);
        keyfos.close();

        keyPub = pubKey.getEncoded();
        File filePub = new File(pathFilePublic);
        if (!filePub.exists()) {

            filePub.createNewFile();
        }
        FileOutputStream keyfosP = new FileOutputStream(filePub);
        keyfosP.write(keyPub);
        keyfosP.close();


    }

}
