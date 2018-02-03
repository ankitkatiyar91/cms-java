package com.ankit.portal.service.test;

import java.util.List;

import org.hibernate.Session;

import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.service.domain.Menu;
import com.ankit.portal.service.util.MenuUtil;

class MenuTest {

    public static void main(String[] args) {/*
                                             * try { Session
                                             * session=com.ankit.portal
                                             * .hibernate
                                             * .util.HibernateUtil.getSession();
                                             * 
                                             * session.beginTransaction(); Menu
                                             * menu = new Menu();
                                             * menu.setLabel("label");
                                             * menu.setSequenceNo(1);
                                             * menu.setStatus(StatusType.SAVE);
                                             * 
                                             * session.save(menu); //
                                             * menu.setStaus(Status.SAVE);
                                             * session
                                             * .getTransaction().commit();
                                             * //menu = (Menu)
                                             * session.load(Menu.class, 1);
                                             * 
                                             * HibernateUtil.closeSession();
                                             * System.out.println(menu); try {
                                             * Thread.sleep(1000); } catch
                                             * (InterruptedException e) { //
                                             * TODO Auto-generated catch block
                                             * e.printStackTrace(); }
                                             * 
                                             * // Check update
                                             * 
                                             * session=HibernateUtil.getSession()
                                             * ; session.beginTransaction();
                                             * menu = (Menu)
                                             * session.load(Menu.class, 1);
                                             * menu.setLabel("updated label");
                                             * menu.setSequenceNo(2);
                                             * menu.setStatus
                                             * (StatusType.PUBLISHED);
                                             * session.saveOrUpdate(menu);
                                             * session
                                             * .getTransaction().commit();
                                             * session.close();
                                             * System.out.println(menu);
                                             * 
                                             * } catch (HibernateException e) {
                                             * // TODO Auto-generated catch
                                             * block e.printStackTrace(); }
                                             * 
                                             * 
                                             * //
                                             * MenuUtil.updateSequenceAfter(Integer
                                             * .MIN_VALUE, 1);
                                             */
        //displayableMenu();
        getMenu();
    }

    @SuppressWarnings("unchecked")
    public static void displayableMenu() {
        Session session = HibernateUtil.getSession();
        List<Menu> menus = session.getNamedQuery("GetDisplayableMenu").list();
        for (Menu menu : menus) {
            System.out.println("Menu->" + menu.getId() + "  "
                    + menu.getStatus() + "  " + menu.getCategories());
        }
        HibernateUtil.closeSession();
    }

    public static void getMenu() {
        Menu menu = MenuUtil.getMenu(1);
        System.out.println("Menu----" + menu);
        System.out.println("Article----"+menu.getContent());
    }
}
