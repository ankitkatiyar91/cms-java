package com.ankit.portal.service.test;

import org.hibernate.Session;

import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.util.UserUtil;
import com.ankit.portal.support.GenderType;

public class UserTest {

    public static void main(String[] args) {

       // Session session=HibernateUtil.getSession();
        User user=new User();
        user.setEmail("ankitkatiyar%");
       System.out.println(UserUtil.getUsersLike(user, 0, 10));
      // addUsers();
//        System.out.println(UserUtil.getUsers());;
    }
    
    public static void addUsers(){

        Session session=HibernateUtil.getSession();
        session.beginTransaction();
        
        User user=new User();
        user.setEmail("asdjkasdkashk@gmail.com");
        user.setGender(GenderType.MALE);
        user.setFirstName("firstName");
        user.setLastName("lastName");
        user.setPassword("c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec");
       // user.setScreenName("jldkasdasda");
        
        session.save(user);
        
        /*User user2=new User();
        user2.setEmail("sdasdasda@yahoo.com");
        user2.setGender(GenderType.MALE);
        user2.setFirstName("firstName");
        user2.setLastName("lastName");
        user2.setPassword("c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec");
        
        
        session.save(user2);*/
        session.getTransaction().commit();
        HibernateUtil.closeSession();
        //System.out.println("User Added->"+user2);
        System.out.println("By email->"+UserUtil.findByEmail("asdjkasdkashk@gmail.com"));
        UserUtil.getRolesByUserId(1L);
    }

}
