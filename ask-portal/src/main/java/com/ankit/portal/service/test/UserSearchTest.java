package com.ankit.portal.service.test;

import java.util.List;

import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.util.UserUtil;

public class UserSearchTest {

    public static void main(String[] args) {
        
        try {
            System.out.println("Building Index");
           // System.out.println("Build completed-"+SearchUtil.rebuildSearchIndex());
            String search="ankitlatiyar91*";
            int total=UserUtil.searchUserCount(search);
            System.out.println(total);
            List<User> users=UserUtil.searchUser(search, 0, total);
            for (User user : users) {
                System.out.println(user);
            }
            
             users=UserUtil.searchUser(search, 0, total);
            for (User user : users) {
                System.out.println(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
