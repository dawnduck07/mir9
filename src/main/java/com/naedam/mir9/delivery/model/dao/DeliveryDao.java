package com.naedam.mir9.delivery.model.dao;

import java.util.Map;

public interface DeliveryDao {

	int selectDoseosanganFeeByZipcode(int zipcode);

	int insertDeliveryCompanyByParam(Map<String, Object> param);
	

}
