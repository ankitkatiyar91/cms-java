package com.ankit.portal.web.action;

import java.util.List;

import org.omg.PortableInterceptor.SUCCESSFUL;

import com.ankit.portal.service.domain.Menu;
import com.ankit.portal.service.util.MenuUtil;

public class ErrorPageAction extends PortalAction {

	private List<Menu> menus;

	public String render() {
		/*
		 * Load Menu
		 */
		try {
			menus = MenuUtil.getDispayableMenus();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

}
