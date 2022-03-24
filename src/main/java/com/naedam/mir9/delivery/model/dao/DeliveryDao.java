package com.naedam.mir9.delivery.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.delivery.model.vo.DeliveryCompany;

public interface DeliveryDao {

	int selectDoseosanganFeeByZipcode(int zipcode);

	int insertDeliveryCompanyByParam(Map<String, Object> param);

	int deleteDeliveryCompanyByComNo(String comNo);

	DeliveryCompany selectOneDeliveryCompanyByComNo(String comNo);

	int updateDeliveryCompanyByParam(Map<String, Object> param);

	List<DeliveryCompany> selectDeliveryCompanyListByParam(Map<String, Object> param);
	

}
