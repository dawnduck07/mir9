package com.naedam.mir9.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.product.model.vo.ProductDetail;
import com.naedam.mir9.product.model.vo.ProductExcelForm;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<ProductDetail> selectAllProductList() {
		// TODO Auto-generated method stub
		return session.selectList("product.selectAllProductList");
	}

	@Override
	public List<ProductExcelForm> selectProductExcelForm() {
		// TODO Auto-generated method stub
		return session.selectList("product.selectProductExcelForm");
	}

	@Override
	public int deleteProductByProductNo(String productNo) {
		// TODO Auto-generated method stub
		return session.delete("product.deleteProductByProductNo",productNo);
	}
	
}
