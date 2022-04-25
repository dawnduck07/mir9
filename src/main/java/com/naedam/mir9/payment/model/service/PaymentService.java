package com.naedam.mir9.payment.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.payment.model.vo.PaymentInfo;


public interface PaymentService {

	int insertPaymentInfo(Map<String, Object> param);

	List<PaymentInfo> selectPaymentInfoList();
	
}

