package com.naedam.mir9.payment.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.payment.model.dao.PaymentDao;
import com.naedam.mir9.payment.model.vo.PaymentInfo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDao paymentDao;
	
	
	
	@Override
	public int insertPaymentInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return paymentDao.insertPaymentInfo(param);
	}



	@Override
	public List<PaymentInfo> selectPaymentInfoList() {
		// TODO Auto-generated method stub
		return paymentDao.selectPaymentInfoList();
	}
	
	

}

