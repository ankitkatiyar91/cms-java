package com.ankit.portal.service.dao;

import java.util.List;

import com.ankit.portal.exception.NoSuchElementException;
import com.ankit.portal.exception.ServiceException;
import com.ankit.portal.service.domain.Category;

public interface CategoryDAO {

    Category getCategory(Integer id) throws NoSuchElementException;
    
    Category addCategory(Category category);
    
    Category updateCategory(Category category);
    
    List<Category> getCategories(Integer startIndex,Integer maxRecords)throws ServiceException;
    
    Integer getMaxSequence();
    
    List<Category> getCategoriesByMenuId(Integer menuId,Integer startIndex,Integer maxRecords)throws ServiceException;
    
    List<Category> getCategoriesByMenuIdOrderedBySequenceNo(Integer menuId,Integer startIndex,Integer maxRecords)throws ServiceException;
    
    List<Category> getDisplayableCategoryByMenuId(Integer id);
}
