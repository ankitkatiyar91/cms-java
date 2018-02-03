package com.ankit.portal.web.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.ankit.portal.logger.PathResolver;

/**
 * Application Lifecycle Listener implementation class PortalContextListener
 *
 */
@WebListener
public class PortalContextListener implements ServletContextListener, ServletContextAttributeListener {

    /**
     * Default constructor. 
     */
	private static String realPath;
	private static ServletContext context;
    public PortalContextListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    @Override
	public void contextInitialized(ServletContextEvent arg0) {
		context=arg0.getServletContext();
		realPath=context.getRealPath("/");
		PathResolver.setPath(realPath);
    }

	/**
     * @see ServletContextAttributeListener#attributeAdded(ServletContextAttributeEvent)
     */
    @Override
	public void attributeAdded(ServletContextAttributeEvent arg0) {
        // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextAttributeListener#attributeReplaced(ServletContextAttributeEvent)
     */
    @Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
        // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextAttributeListener#attributeRemoved(ServletContextAttributeEvent)
     */
    @Override
	public void attributeRemoved(ServletContextAttributeEvent arg0) {
        // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    @Override
	public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }

	public static String getRealPath() {
		return realPath;
	}

	public static ServletContext getContext() {
		return context;
	}
    
    
	
}
