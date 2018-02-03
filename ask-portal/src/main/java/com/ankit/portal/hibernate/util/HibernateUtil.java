package com.ankit.portal.hibernate.util;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

@SuppressWarnings("deprecation")
public class HibernateUtil {

    private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();
    private static SessionFactory sessionFactory;

    static {
        try {
            /*Configuration configuration=new Configuration();
            sessionFactory = configuration.configure("hibernate.cfg.xml").buildSessionFactory(new ServiceRegistryBuilder().build());*/
            sessionFactory=new Configuration().configure().buildSessionFactory();
            
            Configuration configuration=new Configuration();
			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().
            		 applySettings(configuration.getProperties()).build(); 
        } catch (Exception e) {
            System.err.println("%%%% Error Creating SessionFactory %%%%");
            e.printStackTrace();
        }
    }

    public static Session getSession() throws HibernateException {
        Session session = (Session) threadLocal.get();

        if (session == null || !session.isOpen()) {
            if (sessionFactory == null) {
                rebuildSessionFactory();
            }
            session = (sessionFactory != null) ? sessionFactory.openSession()
                    : null;
            threadLocal.set(session);
        }
        return session;
    }
    
    public static Session getSessionWithTrasaction() throws HibernateException {
        Session session = (Session) threadLocal.get();

        if (session == null || !session.isOpen()) {
            if (sessionFactory == null) {
                rebuildSessionFactory();
            }
            session = (sessionFactory != null) ? sessionFactory.openSession()
                    : null;
            threadLocal.set(session);
        }
        
        session.beginTransaction();
        return session;
    }
    

    public static void rebuildSessionFactory() {
        try {
            sessionFactory = new Configuration().configure()
                    .buildSessionFactory();
        } catch (Exception e) {
            System.err.println("%%%% Error Creating SessionFactory %%%%");
            e.printStackTrace();
        }

    }

    public static void closeSession() throws HibernateException {
        Session session = (Session) threadLocal.get();
        threadLocal.set(null);

        if (session != null) {
            session.clear();
            if (session.isOpen()) {
                session.close();
            }
        }
    }
    
    public static void closeSessionWithTransaction() throws HibernateException {
        Session session = (Session) threadLocal.get();
        session.getTransaction().commit();
        threadLocal.set(null);

        if (session != null) {
            session.clear();
            if (session.isOpen()) {
                session.close();
            }
        }
    }

    public static SessionFactory getSessionFactory(){
    	return sessionFactory;
    }
    public static void clearCache() {
        if (sessionFactory != null) {
            sessionFactory.getCache().evictAllRegions();
        }
    }

}
