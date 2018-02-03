package com.ankit.portal.service.test;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.service.domain.Category;
import com.ankit.portal.service.domain.Menu;
import com.ankit.portal.service.domain.SubCategory;
import com.ankit.portal.support.StatusType;

public class CategoryTest {

    public static void main(String[] args) {
        try {
            Session session=com.ankit.portal.hibernate.util.HibernateUtil.getSession();
            
            session.beginTransaction();
            Menu menu = new Menu();
            menu.setLabel("label");
            menu.setSequenceNo(1);
            menu.setStatus(StatusType.SAVE);
            
            Category category=new Category();
            category.setLabel("Category Label");
            category.setSequenceNo(1);
            category.setStatus(StatusType.SAVE);
            category.setMenu(menu);
            
            
            SubCategory subCategory=new SubCategory();
            subCategory.setLabel("sub category Label");
            subCategory.setSequenceNo(1);
            subCategory.setStatus(StatusType.SAVE);
            subCategory.setCategory(category);
            
            session.save(menu);
            session.save(category);
            session.save(subCategory);
            // menu.setStaus(Status.SAVE);
            session.getTransaction().commit();
            menu = (Menu) session.load(Menu.class, 1);

            HibernateUtil.closeSession();
            System.out.println(category);
          
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            session=HibernateUtil.getSession();
            session.beginTransaction();
            category=(Category)session.get(Category.class, 1);
            category.setLabel("updated category");
            category.setSequenceNo(2);
            category.setStatus(StatusType.PUBLISHED);
            
            session.save(category);
            
            /*
             * Add one more category
             */
            category=new Category();
            category.setLabel("Label 2");
            category.setSequenceNo(3);
            category.setStatus(StatusType.UPDATED);
            category.setMenu(menu);
            
            session.saveOrUpdate(category);
            session.getTransaction().commit();
            session.close();
            System.out.println(category);
            
            session=HibernateUtil.getSession();
            menu=(Menu)session.get(Menu.class, 1);
            System.out.println("\n\n\n"+menu+"  "+menu.getCategories());
            HibernateUtil.closeSession();
        } catch (HibernateException e) {
            e.printStackTrace();
        }

    }

}
