package com.naedam.mir9.payment.model.service;

import java.io.IOException;

import com.naedam.mir9.payment.model.vo.TempPayInfo;

public interface PaymentService {
	
	String getToken() throws IOException;
	
	TempPayInfo paymentInfo(String imp_uid, String access_token) throws IOException;
	
	public void payMentCancle(String access_token, String imp_uid, String amount, String reason);
	
}

