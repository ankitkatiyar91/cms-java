package com.ankit.portal.service.util;

import java.util.List;

import com.ankit.portal.exception.ServiceException;
import com.ankit.portal.service.dao.MenuDAO;
import com.ankit.portal.service.domain.Menu;
import com.ankit.portal.service.impl.MenuImpl;

public class MenuUtil {

    private static final MenuDAO DAO = new MenuImpl();

    public static Integer addMenu(Menu menu) throws ServiceException {
        return DAO.addMenu(menu);
    }

    public static void updateMenu(Menu menu) throws ServiceException {
        DAO.updateMenu(menu);
    }

    public static List<Menu> getMenus(Integer startIndex, Integer maxRecords)
            throws ServiceException {
        return DAO.getMenus(startIndex, maxRecords);
    }

    public static List<Menu> getMenus() throws ServiceException {
        return DAO.getMenus(0, 0);
    }

    public static Integer getTotalMenu() {
        return DAO.getTotalMenu();
    }

    public static Menu getMenuByLabel(String label) {
        return DAO.getMenuByLabel(label);
    }

    public static Integer updateSequenceBefore(Integer menuId,
            Integer updateNumber) {
        return DAO.updateSequenceBefore(menuId, updateNumber);
    }

    public static Integer updateSequenceAfter(Integer menuId,
            Integer updateNumber) {
        return DAO.updateSequenceAfter(menuId, updateNumber);
    }

    public static Integer maxSequenceNo() {
        return DAO.maxSequenceNo();
    }

    public static Menu getMenu(Integer menuId) {
        return DAO.getMenu(menuId);
    }

    public static List<Menu> getMenusOrderedBySequenceNo(Integer startIndex,
            Integer maxRecords) throws ServiceException {
        return DAO.getMenusOrderedBySequenceNo(startIndex, maxRecords);
    }

    public static List<Menu> getMenusOrderedBySequenceNo()
            throws ServiceException {
        return DAO.getMenusOrderedBySequenceNo(0, 0);
    }

    public static List<Menu> getDispayableMenus() {
        return DAO.getDispayableMenus();
    }
}
