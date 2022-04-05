package com.naedam.mir9.product.model.dao;

import java.util.List;

import com.naedam.mir9.product.model.vo.Product;
import com.naedam.mir9.product.model.vo.ProductDetail;
import com.naedam.mir9.product.model.vo.ProductExcelForm;

public interface ProductDao {

	List<ProductDetail> selectAllProductList();

	List<ProductExcelForm> selectProductExcelForm();

	int deleteProductByProductNo(String productNo);

}
