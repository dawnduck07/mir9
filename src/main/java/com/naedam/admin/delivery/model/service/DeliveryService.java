package com.naedam.admin.delivery.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.admin.delivery.model.vo.DeliveryCompany;
import com.naedam.admin.delivery.model.vo.DeliverySetting;
import com.naedam.admin.delivery.model.vo.Doseosangan;

public interface DeliveryService {
	
	int deliveryCompanyProcess(Map<String, Object> map);
	
	int selectDoseosanganFeeByZipcode(int zipcode);

	int insertDeliveryCompanyByParam(Map<String, Object> param);

	DeliveryCompany selectOneDeliveryCompanyByComNo(String comNo);

	int updateDeliveryCompanyByParam(Map<String, Object> param);

	List<DeliveryCompany> selectDeliveryCompanyListByParam(Map<String, Object> param);

	int updateDeliverySettingByVo(Map<String, Object> map) throws Exception;

	int updateDoseosanganByVo(Doseosangan doseo);

	

}
