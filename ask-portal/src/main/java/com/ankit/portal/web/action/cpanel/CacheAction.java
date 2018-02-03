package com.ankit.portal.web.action.cpanel;

import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.logger.Level;
import com.ankit.portal.logger.Logger;
import com.ankit.portal.web.action.PortalAction;

/**
 * @author Ankit
 * 
 */
public class CacheAction extends PortalAction {
	private static final long serialVersionUID = 3476548826158884061L;

	private static final Logger LOGGER = new Logger(CacheAction.class, Level.INFO);

	public String clearCache() {
		try {
			HibernateUtil.clearCache();
			LOGGER.log("Cache Cleared");
		} catch (Throwable throwable) {
			LOGGER.log("Failed to clear Cache ", throwable);
			throwable.printStackTrace();
		}

		return SUCCESS;
	}

}
