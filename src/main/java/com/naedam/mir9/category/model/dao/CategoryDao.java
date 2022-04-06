package com.naedam.mir9.category.model.dao;

import java.util.List;

import com.naedam.mir9.category.model.vo.Category;

public interface CategoryDao {

	List<Category> selectProductCategory(String type);

	List<Category> selectProductCategoryChildByParentNo(int cteNo);

	List<Category> selectProductCategoryByLevel(int level);

}
