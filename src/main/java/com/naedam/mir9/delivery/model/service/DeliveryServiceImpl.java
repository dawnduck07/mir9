package com.naedam.mir9.delivery.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.delivery.model.dao.DeliveryDao;

@Service
public class DeliveryServiceImpl implements DeliveryService {
	@Autowired
	private DeliveryDao deliveryDao;

	@Override
	public int selectDoseosanganFeeByZipcode(int zipcode) {
		// TODO Auto-generated method stub
		return deliveryDao.selectDoseosanganFeeByZipcode(zipcode);
	}

	@Override
	public int insertDeliveryCompanyByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return deliveryDao.insertDeliveryCompanyByParam(param);
	}

	@Override
	public int deleteDeliveryCompanyByComNo(String comNo) {
		// TODO Auto-generated method stub
		return deliveryDao.deleteDeliveryCompanyByComNo(comNo);
	}
	
	
	
	
}
