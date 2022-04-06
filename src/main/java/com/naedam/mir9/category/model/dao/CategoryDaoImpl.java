package com.naedam.mir9.category.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.category.model.vo.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<Category> selectProductCategory(String type) {
		// TODO Auto-generated method stub
		return session.selectList("category.selectProductCategory", type);
	}

	@Override
	public List<Category> selectProductCategoryChildByParentNo(int cteNo) {
		// TODO Auto-generated method stub
		return session.selectList("category.selectProductCategoryChildByParentNo", cteNo);
	}

	@Override
	public List<Category> selectProductCategoryByLevel(int level) {
		// TODO Auto-generated method stub
		return session.selectList("category.selectProductCategoryByLevel", level);
	}
	
	
}
