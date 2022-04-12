package com.naedam.mir9.product.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.option.model.vo.ProductOptionDetail;
import com.naedam.mir9.product.model.vo.Product;
import com.naedam.mir9.product.model.vo.ProductDetail;
import com.naedam.mir9.product.model.vo.ProductDiscription;
import com.naedam.mir9.product.model.vo.ProductExcelForm;
import com.naedam.mir9.product.model.vo.ProductImg;

public interface ProductDao {

	List<ProductDetail> selectAllProductList();

	List<ProductExcelForm> selectProductExcelForm();

	int deleteProductByProductNo(String productNo);

	Product selectOneProductByProductNo(String productNo);

	List<ProductImg> selectProductImgsByProductNo(String productNo);

	List<ProductOptionDetail> selectProductOptionDetailByOptionNo(int optionNo);

	List<ProductDiscription> selectProductDiscriptionByProductNo(String productNo);

	List<ProductDetail> selectProductListByCteNo(String cteNo);

	int updateProduct(Product product);

	int updateProductImg(ProductImg img);

	int updateProductDiscription(ProductDiscription pd);

	int insertProduct(Product product);

	int insertProductImg(ProductImg img);

	int insertProductDiscription(ProductDiscription pd);

	List<ProductDetail> selectProductListByParam(Map<String, String> param);

}
