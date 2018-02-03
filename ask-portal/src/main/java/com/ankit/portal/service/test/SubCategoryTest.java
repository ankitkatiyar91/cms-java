package com.ankit.portal.service.test;

import org.hibernate.Session;

import com.ankit.portal.exception.ServiceException;
import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.service.domain.Category;
import com.ankit.portal.service.domain.Menu;
import com.ankit.portal.service.domain.SubCategory;
import com.ankit.portal.service.util.SubCategoryUtil;
import com.ankit.portal.support.StatusType;

class SubCategoryTest {

    public static void main(String[] args) {/*
      
        Session session=HibernateUtil.getSession();
        session.beginTransaction();
        
        SubCategory subCategory=new SubCategory();
        subCategory.setLabel("sub category Label");
        subCategory.setSequenceNo(1);
        subCategory.setStatus(StatusType.SAVE);
        
        Menu menu = new Menu();
        menu.setLabel("label");
        menu.setSequenceNo(1);
        menu.setStatus(StatusType.SAVE);
        
        Category category=new Category();
        category.setLabel("Category Label");
        category.setSequenceNo(1);
        category.setStatus(StatusType.SAVE);
        category.setMenu(menu);
        
        subCategory.setCategory(category);
        
        session.save(menu);
        session.save(category);
        session.save(subCategory);
        session.getTransaction().commit();
        HibernateUtil.closeSession();
        
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        session=HibernateUtil.getSession();
        session.beginTransaction();
        subCategory=(SubCategory)session.get(SubCategory.class, 1L);
        subCategory.setLabel("Yo finally updated");
        
        session.save(subCategory);
        session.getTransaction().commit();
        HibernateUtil.closeSession();
        System.out.println(subCategory);
        
        
         * Deleting menu
         
        session=HibernateUtil.getSession();
        session.beginTransaction();
        menu=(Menu)session.get(Menu.class, 1);
        
        session.delete(menu);
        session.getTransaction().commit();
        HibernateUtil.closeSession();
        System.out.println("menu deleted");
    */
        try {
			System.out.println(SubCategoryUtil.getSubCategories(0, 0));
			System.out.println("Hit-"+HibernateUtil.getSessionFactory().getStatistics().getSecondLevelCacheHitCount());
			System.out.println("Mis-"+HibernateUtil.getSessionFactory().getStatistics().getSecondLevelCacheMissCount());
			System.out.println("Put-"+HibernateUtil.getSessionFactory().getStatistics().getSecondLevelCachePutCount());
			System.out.println("################## clean #################");
			System.out.println(SubCategoryUtil.getSubCategories(0, 0));
			System.out.println("Hit-"+HibernateUtil.getSessionFactory().getStatistics().getSecondLevelCacheHitCount());
			System.out.println("Mis-"+HibernateUtil.getSessionFactory().getStatistics().getSecondLevelCacheMissCount());
			System.out.println("Put-"+HibernateUtil.getSessionFactory().getStatistics().getSecondLevelCachePutCount());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        }

}
