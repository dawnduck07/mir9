package com.naedam.admin.option.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.option.model.dao.OptionDao;
import com.naedam.admin.option.model.vo.Option;
import com.naedam.admin.option.model.vo.OptionValue;
import com.naedam.admin.option.model.vo.ProductOption;
import com.naedam.admin.product.model.vo.ProductDetail;

@Service

public class OptionServiceImpl implements OptionService {
	@Autowired
	private OptionDao optionDao;

	/**
	 * 옵션 목록 조회
	 */
	@Override
	public Map<String, Object> orderList(String optionNo) {
		ProductOption pOption = optionDao.selectOneProductOptionByoptionNo(Integer.parseInt(optionNo));
		List<OptionValue> optionValueList = optionDao.selectOptionValueListByOptionNo(Integer.parseInt(optionNo));
		
		Map<String, Object> result = new HashMap<String, Object>(); 
		result.put("pOption", pOption);
		result.put("optionValueList", optionValueList);
		
		return result;
	}	
	
	/**
	 * 옵션 등록
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int insertOption(Map<String, Object> map) {
		int result = optionDao.insertOption(map);
		
		ArrayList<String> valueList = (ArrayList<String>) map.get("option_value");
		ArrayList<String> valueCostList = (ArrayList<String>) map.get("option_value_cost");
		
		try {
			for(int i = 0; i < valueList.size(); i++) {
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("optionValue", valueList.get(i));
				param.put("optionValueCost", Integer.parseInt(valueCostList.get(i).replace(",", "")));
				result = optionDao.insertOptionValue(param);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	/**
	 * 옵션 수정
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int updateOption(Map<String, Object> map) {
		int result = 0;
		OptionValue ov = new OptionValue();
		ProductOption pOption = new ProductOption();
		ArrayList<String> valueList = (ArrayList<String>) map.get("option_value");
		ArrayList<String> valueCostList = (ArrayList<String>) map.get("option_value_cost");
		ArrayList<String> valueNoList = (ArrayList<String>) map.get("option_value_no");
		List<OptionValue> optionValueList = optionDao.selectOptionValueListByOptionNo((Integer)map.get("optionNo"));
		
		for(int i = 0; i < valueNoList.size(); i++) {
			ov.setOptionValueNo(Integer.parseInt(valueNoList.get(i)));
		}
		for(int i = 0; i < valueList.size(); i++) {
			if(i >= optionValueList.size()) { // 등록되지 않은 옵션일 경우 추가
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("optionValue", valueList.get(i));
				param.put("optionValueCost", Integer.parseInt(valueCostList.get(i).replace(",", "")));
				param.put("optionNo", (Integer)map.get("optionNo"));
				result = optionDao.insertOptionValue(param);
			}
			else {
				try {
					ov.setOptionNo((Integer) map.get("optionNo"));
				} catch (Exception e) {
					ov.setOptionNo(Integer.parseInt((String) map.get("optionNo")));
				}
				ov.setOptionValue(valueList.get(i));
				ov.setOptionValueCost(Integer.parseInt(valueCostList.get(i).replace(",", "")));
				result = optionDao.updateOptionValue(ov);
			}
		}
		
		try {
			pOption.setOptionNo((Integer) map.get("optionNo"));
		} catch (Exception e) {
			pOption.setOptionNo(Integer.parseInt((String) map.get("optionNo")));
		}
		pOption.setOptionName((String)map.get("option_name"));
		result = optionDao.updateProductOption(pOption);
		
		return result;
	}		
	
	@Override
	public Map<String, Object> option_manager(int optionNo) {
		ProductOption pOption = optionDao.selectOneProductOptionByoptionNo(optionNo);
		List<OptionValue> optionValueList = optionDao.selectOptionValueListByOptionNo(optionNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("optionValueList", optionValueList);
		map.put("pOption", pOption);
		
		return map;
	}
	
	@Override
	public List<Option> selectOptionList() {
		return optionDao.selectOptionList();
	}

	@Override
	public List<ProductDetail> selectProductDetailList() {
		return optionDao.selectProductDetailList();
	}

	/*
	@Override
	public int insertOptionValue(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return optionDao.insertOptionValue(param);
	}
	
	@Override
	public int updateOptionValue(OptionValue ov) {
		// TODO Auto-generated method stub
		return optionDao.updateOptionValue(ov);
	}

	@Override
	public int updateProductOption(ProductOption pOption) {
		// TODO Auto-generated method stub
		return optionDao.updateProductOption(pOption);
	}
	*/
}
