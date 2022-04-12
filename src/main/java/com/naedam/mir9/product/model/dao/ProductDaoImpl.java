package com.naedam.mir9.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.option.model.vo.ProductOptionDetail;
import com.naedam.mir9.product.model.vo.Product;
import com.naedam.mir9.product.model.vo.ProductDetail;
import com.naedam.mir9.product.model.vo.ProductDiscription;
import com.naedam.mir9.product.model.vo.ProductExcelForm;
import com.naedam.mir9.product.model.vo.ProductImg;

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

	@Override
	public Product selectOneProductByProductNo(String productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("product.selectOneProductByProductNo",productNo);
	}

	@Override
	public List<ProductImg> selectProductImgsByProductNo(String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectProductImgsByProductNo", productNo);
	}

	@Override
	public List<ProductOptionDetail> selectProductOptionDetailByOptionNo(int optionNo) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectProductOptionDetailByOptionNo", optionNo);
	}

	@Override
	public List<ProductDiscription> selectProductDiscriptionByProductNo(String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectProductDiscriptionByProductNo",productNo);
	}

	@Override
	public List<ProductDetail> selectProductListByCteNo(String cteNo) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectProductListByCteNo", cteNo);
	}

	@Override
	public int updateProduct(Product product) {
		// TODO Auto-generated method stub
		return session.update("product.updateProduct", product);
	}

	@Override
	public int updateProductImg(ProductImg img) {
		// TODO Auto-generated method stub
		return session.update("product.updateProductImg", img);
	}

	@Override
	public int updateProductDiscription(ProductDiscription pd) {
		// TODO Auto-generated method stub
		return session.update("product.updateProductDiscription", pd);
	}
	
	
}
