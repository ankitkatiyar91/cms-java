/**
 * 
 */
package com.ankit.portal.service.util;

import java.util.List;

import com.ankit.portal.exception.NoSuchElementException;
import com.ankit.portal.exception.ServiceException;
import com.ankit.portal.service.dao.SubCategoryDAO;
import com.ankit.portal.service.domain.SubCategory;
import com.ankit.portal.service.impl.SubCategoryImpl;

/**
 * @author Ankit
 * 
 */
public class SubCategoryUtil {

    private static final SubCategoryDAO DAO = new SubCategoryImpl();

    public static SubCategory getSubCategory(Long id)
            throws NoSuchElementException {
        return DAO.getSubCategory(id);
    }

    public static SubCategory addSubCategory(SubCategory category) {
        return DAO.addSubCategory(category);
    }

    public static SubCategory updateSubCategory(SubCategory subCategory) {
        return DAO.updateSubCategory(subCategory);
    }

    public static List<SubCategory> getSubCategories(Integer startIndex,
            Integer maxRecords) throws ServiceException {
        return DAO.getSubCategories(startIndex, maxRecords);
    }

    public static Integer getMaxSequence() {
        return DAO.getMaxSequence();
    }

    public static List<SubCategory> getSubCategoriesByCategoryId(
            Integer categoryId, Integer startIndex, Integer maxRecords)
            throws ServiceException {
        return DAO.getSubCategoriesByCategoryId(categoryId, startIndex,
                maxRecords);
    }

    public static List<SubCategory> getSubCategoriesByCategoryIdOrderedBySequenceNo(
            Integer categoryId, Integer startIndex, Integer maxRecords)
            throws ServiceException {
        return DAO.getSubCategoriesByCategoryIdOrderedBySequenceNo(categoryId,
                startIndex, maxRecords);
    }

    public static void deleteSubCategory(Long id) {
        DAO.deleteSubCategory(id);
    }

    public static List<SubCategory> getDisplayableSubCategoryByCategoryId(Integer id) {
        return DAO.getDisplayableSubCategoryByCategoryId(id);
    }
}
