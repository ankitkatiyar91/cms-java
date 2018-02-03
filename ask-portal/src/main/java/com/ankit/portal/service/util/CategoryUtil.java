/**
 * 
 */
package com.ankit.portal.service.util;

import java.util.List;

import com.ankit.portal.exception.NoSuchElementException;
import com.ankit.portal.exception.ServiceException;
import com.ankit.portal.service.dao.CategoryDAO;
import com.ankit.portal.service.domain.Category;
import com.ankit.portal.service.impl.CategoryImpl;

/**
 * @author Ankit
 * 
 */
public class CategoryUtil {

    private static final CategoryDAO categoryDAO = new CategoryImpl();

    public static Category getCategory(Integer id)
            throws NoSuchElementException {
        return categoryDAO.getCategory(id);
    }

    public static Category addCategory(Category category) {
        return categoryDAO.addCategory(category);
    }

    public static Category updateCategory(Category category) {
        return categoryDAO.updateCategory(category);
    }

    public static List<Category> getCategories(Integer startIndex,
            Integer maxRecords) throws ServiceException {
        return categoryDAO.getCategories(startIndex, maxRecords);
    }

    public static Integer getMaxSequence() {
        return categoryDAO.getMaxSequence();
    }

    public static List<Category> getCategoriesByMenuId(Integer menuId,
            Integer startIndex, Integer maxRecords) throws ServiceException {
        return categoryDAO
                .getCategoriesByMenuId(menuId, startIndex, maxRecords);
    }

    public static List<Category> getCategoriesByMenuIdOrderedBySequenceNo(
            Integer menuId, Integer startIndex, Integer maxRecords)
            throws ServiceException {
        return categoryDAO.getCategoriesByMenuIdOrderedBySequenceNo(menuId,
                startIndex, maxRecords);
    }

    public static List<Category> getDisplayableCategoryByMenuId(Integer id) {
        return categoryDAO.getDisplayableCategoryByMenuId(id);
    }
}
