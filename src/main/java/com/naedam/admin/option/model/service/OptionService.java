package com.naedam.admin.option.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.admin.option.model.vo.Option;
import com.naedam.admin.product.model.vo.ProductDetail;

public interface OptionService {

	Map<String, Object> orderList(String optionNo);
	
	int insertOption(Map<String, Object> map);
	
	int updateOption(Map<String, Object> map);

	Map<String, Object> option_manager(int optionNo);
	
	List<Option> selectOptionList();
	
	List<ProductDetail> selectProductDetailList();

	
	// int insertOptionValue(Map<String, Object> param);

	// int updateOptionValue(OptionValue ov);

	// int updateProductOption(ProductOption pOption);

}
