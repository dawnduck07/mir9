package com.naedam.admin.category.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.category.model.dao.CategoryDao;
import com.naedam.admin.category.model.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<Category> selectProductCategory(String type) {
		return categoryDao.selectProductCategory(type);
	}

	@Override
	public List<Category> selectProductCategoryChildByParentNo(int cteNo) {
		return categoryDao.selectProductCategoryChildByParentNo(cteNo);
	}

	@Override
	public List<Category> selectProductCategoryByLevel(int level) {
		return categoryDao.selectProductCategoryByLevel(level);
	}

	@Override
	public Category selectOneProductCategoryByCteNo(String cteNo) {
		return categoryDao.selectOneProductCategoryByCteNo(cteNo);
	}

	@Override
	public int updateProductCategoryByParam(Map<String, Object> param) {
		return categoryDao.updateProductCategoryByParam(param);
	}

	@Override
	public int insertProductCategoryByParam(Map<String, Object> param) {
		return categoryDao.insertProductCategoryByParam(param);
	}

	@Override
	public int deleteCategoryByCteNo(HttpServletRequest request) {
		int result = 0;
		List<String> cteNoList = Arrays.asList(request.getParameterValues("list[]"));
		for(String cteNo : cteNoList) {
			result = categoryDao.deleteCategoryByCteNo(cteNo);
		}
		return result;
	}
	
	@Override
	public Map<String, Object> getCategory(String cteNo) {
		int depth = 0;
		List<Category> cteList = categoryDao.selectRelatedCtegoryByCteNo(cteNo);
		List<Category> lv1NameList = new ArrayList<Category>();
		List<Category> lv2NameList = new ArrayList<Category>();
		List<Category> lv3NameList = new ArrayList<Category>();
	
		for(Category c : cteList) {
			if(c.getLevel() > depth) {
				depth = c.getLevel();
			}
			switch(c.getLevel()) {
				case 1 : lv1NameList = categoryDao.selectCategoryNamesByCteLv(c.getLevel()); break;
				case 2 : lv2NameList = categoryDao.selectCategoryNamesByCteLv(c.getLevel()); break;
				case 3 : lv3NameList = categoryDao.selectCategoryNamesByCteLv(c.getLevel()); break;
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("lv1NameList", lv1NameList);
		map.put("lv2NameList", lv2NameList);
		map.put("lv3NameList", lv3NameList);
		map.put("depth", depth);
		if(depth == 3) {
			map.put("cteList", cteList);			
		}
		
		return map;
	}
	
	@Override
	public List<Category> selectCategoryNamesByCteLv(int level) {
		return categoryDao.selectCategoryNamesByCteLv(level);
	}

	@Override
	public List<Category> selectRelatedCtegoryByCteNo(String cteNo) {
		return categoryDao.selectRelatedCtegoryByCteNo(cteNo);
	}

}
