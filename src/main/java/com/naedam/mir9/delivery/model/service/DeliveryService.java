package com.naedam.mir9.delivery.model.service;

import java.util.Map;

public interface DeliveryService {

	int selectDoseosanganFeeByZipcode(int zipcode);

	int insertDeliveryCompanyByParam(Map<String, Object> param);

}
