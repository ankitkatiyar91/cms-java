/**
 * 
 */
package com.ankit.portal.web.action.cpanel;

import java.util.concurrent.Callable;
import java.util.concurrent.Executors;

import org.apache.shiro.SecurityUtils;

import com.ankit.portal.exception.PendingTaskException;
import com.ankit.portal.logger.Level;
import com.ankit.portal.logger.Logger;
import com.ankit.portal.service.util.SearchUtil;
import com.ankit.portal.web.action.PortalAction;

/**
 * @author Ankit
 * 
 */
public class SearchIndexAction extends PortalAction {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = new Logger(SearchIndexAction.class,
			Level.INFO);

	public String rebuildSearchIndex() {
/*		System.out.println("SearchIndexAction.rebuildSearchIndex()");
		Callable<Boolean> callable = new Callable<Boolean>() {

			@Override
			public Boolean call() {
				try {
					LOGGER.log("Search index start");
					return SearchUtil.rebuildSearchIndex();
				} catch (PendingTaskException e) {
					e.printStackTrace();
					LOGGER.log("Search Index failed due to pending task");
				} catch (Throwable e) {
					e.printStackTrace();
					LOGGER.log("Indexing failed", e);
				} finally {
					LOGGER.log("Search Index rebuild complete");
				}
				return false;
			}

		};
		SecurityUtils.getSubject().associateWith(callable);
		Executors.newFixedThreadPool(1).submit(callable);
		System.out.println("Execution Completed");
		LOGGER.log("Search Bulid callable invoked");*/
		LOGGER.log("Search index rebuilding is disables");
		return SUCCESS;
	}

}
