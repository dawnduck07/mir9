package com.naedam.mir9.product.model.service;

import java.util.List;

import com.naedam.mir9.product.model.vo.Product;
import com.naedam.mir9.product.model.vo.ProductDetail;
import com.naedam.mir9.product.model.vo.ProductExcelForm;

public interface ProductService {

	List<ProductDetail> selectAllProductList();

	List<ProductExcelForm> selectProductExcelForm();

}
