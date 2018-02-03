/**
 * 
 */
package com.ankit.portal.web.action;

import com.ankit.portal.logger.Level;
import com.ankit.portal.logger.Logger;
import com.ankit.portal.util.SubjectUtil;

/**
 * @author Ankit
 * 
 */
public class LogoutAction extends PortalAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = new Logger(LogoutAction.class, Level.ERROR);

	public String logout() {
		LOGGER.log("Log out user " + SubjectUtil.getCurrentUserId());
		SubjectUtil.logout();
		return SUCCESS;
	}

}
