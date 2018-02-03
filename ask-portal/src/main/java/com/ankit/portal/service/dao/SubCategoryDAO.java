package com.ankit.portal.service.dao;

import java.util.List;

import com.ankit.portal.service.domain.Category;
import com.ankit.portal.service.domain.SubCategory;

public interface SubCategoryDAO {

    SubCategory addSubCategory(SubCategory subCategory);

    SubCategory updateSubCategory(SubCategory subCategory);

    SubCategory getSubCategory(Long id);

    Integer getMaxSequence();

    List<SubCategory> getSubCategoriesByCategoryId(Integer menuId,
            Integer startIndex, Integer maxRecords);

    List<SubCategory> getSubCategoriesByCategoryIdOrderedBySequenceNo(
            Integer menuId, Integer startIndex, Integer maxRecords);

    List<SubCategory> getSubCategories(Integer startIndex, Integer maxRecords);
    
    void deleteSubCategory(Long id);
    
    List<SubCategory> getDisplayableSubCategoryByCategoryId(Integer id);
}
