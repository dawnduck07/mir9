package com.naedam.admin.category.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.naedam.admin.category.model.vo.Category;

public interface CategoryService {

	List<Category> selectProductCategory(String type);

	List<Category> selectProductCategoryChildByParentNo(int cteNo);

	List<Category> selectProductCategoryByLevel(int level);

	Category selectOneProductCategoryByCteNo(String cteNo);

	int updateProductCategoryByParam(Map<String, Object> param);

	int insertProductCategoryByParam(Map<String, Object> param);

	int deleteCategoryByCteNo(HttpServletRequest request);

	List<Category> selectCategoryNamesByCteLv(int level);

	List<Category> selectRelatedCtegoryByCteNo(String cteNo);

	Map<String, Object> getCategory(String cteNo);
	
}
