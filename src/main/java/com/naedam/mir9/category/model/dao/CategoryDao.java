package com.naedam.mir9.category.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.category.model.vo.Category;

public interface CategoryDao {

	List<Category> selectProductCategory(String type);

	List<Category> selectProductCategoryChildByParentNo(int cteNo);

	List<Category> selectProductCategoryByLevel(int level);

	Category selectOneProductCategoryByCteNo(String cteNo);

	int updateProductCategoryByParam(Map<String, Object> param);

	int insertProductCategoryByParam(Map<String, Object> param);

	int deleteCategoryByCteNo(String cteNo);

}
