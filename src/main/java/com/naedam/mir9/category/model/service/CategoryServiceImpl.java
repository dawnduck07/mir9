package com.naedam.mir9.category.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.category.model.dao.CategoryDao;
import com.naedam.mir9.category.model.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<Category> selectProductCategory(String type) {
		// TODO Auto-generated method stub
		return categoryDao.selectProductCategory(type);
	}
	
	
}
