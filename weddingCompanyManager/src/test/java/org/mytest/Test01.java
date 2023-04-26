package org.mytest;

import org.junit.Test;

public class Test01 {
    @Test
    public void m1(){
        String str = "abcde";
        String substring = str.substring(0,1);
        System.out.println(substring);
    }
}
