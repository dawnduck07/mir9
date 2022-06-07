package com.naedam.admin.product.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.naedam.admin.option.model.vo.ProductOptionDetail;
import com.naedam.admin.product.model.vo.Product;
import com.naedam.admin.product.model.vo.ProductDetail;
import com.naedam.admin.product.model.vo.ProductDiscription;
import com.naedam.admin.product.model.vo.ProductExcelForm;
import com.naedam.admin.product.model.vo.ProductImg;

public interface ProductService {

	List<ProductDetail> selectAllProductList();

	List<ProductExcelForm> selectProductExcelForm();

	List<ProductDetail> selectProductListByCteNo(String cteNo);

	int updateProductImg(ProductImg img);

	int updateProductDiscription(ProductDiscription pd);

	int insertProductImg(ProductImg img);

	int insertProductDiscription(ProductDiscription brief);

	Map<String, Object> listSub(Map<String, String> param);

	String treeModel(String stp, HttpServletRequest request);

	int productDelete(HttpServletRequest request);

	List<Object> fillForm(String productNo);

	Map<String, Object> productCategorySub(int cteNo);

	int copyProduct(HttpServletRequest request);
	
	int insertProduct(HttpServletRequest request);

	int updateProduct(HttpServletRequest request);
}
