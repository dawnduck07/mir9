package com.naedam.mir9.category.model.service;

import java.util.List;

import com.naedam.mir9.category.model.vo.Category;

public interface CategoryService {

	List<Category> selectProductCategory(String type);

}
