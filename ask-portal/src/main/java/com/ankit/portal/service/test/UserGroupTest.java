/**
 * 
 */
package com.ankit.portal.service.test;

import com.ankit.portal.service.util.UserGroupUtil;

/**
 * @author Ankit
 * 
 */
public class UserGroupTest {

    /**
     * @param args
     */
    public static void main(String[] args) {
        for (int i = 0; i < 1; i++) {
            new Thread(new Runnable() {

                public void run() {
                    System.out.println(UserGroupUtil.getUsers(2L));

                }
            }).start();
        }

    }

}
