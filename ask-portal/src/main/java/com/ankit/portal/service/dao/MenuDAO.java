package com.ankit.portal.service.dao;

import java.util.List;

import com.ankit.portal.exception.ServiceException;
import com.ankit.portal.service.domain.Menu;

public interface MenuDAO {

    Integer addMenu(Menu menu)throws ServiceException;
    
    void updateMenu(Menu menu)throws ServiceException;
    
    List<Menu> getMenus(Integer startIndex,Integer maxRecords)throws ServiceException;
    
    List<Menu> getMenusOrderedBySequenceNo(Integer startIndex,Integer maxRecords)throws ServiceException;
    
    Integer getTotalMenu();
    
    Menu getMenuByLabel(String label);
    
    Integer updateSequenceAfter(Integer sequenceNo,Integer updateNumber);
    
    Integer updateSequenceBefore(Integer sequenceNo,Integer updateNumber);
    
    Integer maxSequenceNo();
    
    Menu getMenu(Integer menuId);
    
    List<Menu> getDispayableMenus();
}