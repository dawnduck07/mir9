package com.naedam.mir9.delivery.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.delivery.model.vo.DeliveryCompany;

public interface DeliveryService {

	int selectDoseosanganFeeByZipcode(int zipcode);

	int insertDeliveryCompanyByParam(Map<String, Object> param);

	int deleteDeliveryCompanyByComNo(String comNo);

	DeliveryCompany selectOneDeliveryCompanyByComNo(String comNo);

	int updateDeliveryCompanyByParam(Map<String, Object> param);

	List<DeliveryCompany> selectDeliveryCompanyListByParam(Map<String, Object> param);

	

}
