package com.naedam.mir9.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.option.model.vo.ProductOptionDetail;
import com.naedam.mir9.product.model.dao.ProductDao;
import com.naedam.mir9.product.model.vo.Product;
import com.naedam.mir9.product.model.vo.ProductDetail;
import com.naedam.mir9.product.model.vo.ProductDiscription;
import com.naedam.mir9.product.model.vo.ProductExcelForm;
import com.naedam.mir9.product.model.vo.ProductImg;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDao productDao;

	@Override
	public List<ProductDetail> selectAllProductList() {
		// TODO Auto-generated method stub
		return productDao.selectAllProductList();
	}

	@Override
	public List<ProductExcelForm> selectProductExcelForm() {
		// TODO Auto-generated method stub
		return productDao.selectProductExcelForm();
	}

	@Override
	public int deleteProductByProductNo(String productNo) {
		// TODO Auto-generated method stub
		return productDao.deleteProductByProductNo(productNo);
	}

	@Override
	public Product selectOneProductByProductNo(String productNo) {
		// TODO Auto-generated method stub
		return productDao.selectOneProductByProductNo(productNo);
	}

	@Override
	public List<ProductImg> selectProductImgsByProductNo(String productNo) {
		// TODO Auto-generated method stub
		return productDao.selectProductImgsByProductNo(productNo);
	}

	@Override
	public List<ProductOptionDetail> selectProductOptionDetailByOptionNo(int optionNo) {
		// TODO Auto-generated method stub
		return productDao.selectProductOptionDetailByOptionNo(optionNo);
	}

	@Override
	public List<ProductDiscription> selectProductDiscriptionByProductNo(String productNo) {
		// TODO Auto-generated method stub
		return productDao.selectProductDiscriptionByProductNo(productNo);
	}
	
	
	
	
}
