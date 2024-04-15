package com.aj.connection;

import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class AES {
    private static final String ALGO = "AES";
    // Update the key to a more secure one
    private static final byte[] keyValue = 
        new byte[] { 'T', 'h', 'e', 'B', 'e', 's', 't','S', 'e', 'c', 'r','e', 't', 'K', 'e', 'y' };

    public static String encrypt(String data) throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(ALGO);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedValue = cipher.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encryptedValue);
    }

    public static String decrypt(String encryptedData) throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(ALGO);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decodedValue = Base64.getDecoder().decode(encryptedData);
        byte[] decryptedValue = cipher.doFinal(decodedValue);
        return new String(decryptedValue);
    }

    private static Key generateKey() {
        return new SecretKeySpec(keyValue, ALGO); // Use keyValue instead of SECRET_KEY
    }

    public static void main(String[] args) {
        try {
            String password = "My name is Ajay";
            String passwordEnc = AES.encrypt(password);
            String passwordDec = AES.decrypt(passwordEnc);

            System.out.println("Plain Text : " + password);
            System.out.println("Encrypted Text : " + passwordEnc);
            System.out.println("Decrypted Text : " + passwordDec);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
