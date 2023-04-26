package com.easthome.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
    /*public static String digest(String content){
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("md5");
            byte[] digest = md5.digest(content.getBytes());
            return new String(digest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }*/
    public static  String digest(String content){
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("md5");
            byte[] digest = md5.digest(content.getBytes());
            return new String(digest);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

    }
}
