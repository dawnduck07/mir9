package com.naedam.mir9.payment.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.naedam.mir9.common.Mir9Utils;
import com.naedam.mir9.order.model.vo.OrderInfo;
import com.naedam.mir9.payment.model.service.PaymentService;
import com.naedam.mir9.payment.model.vo.PaymentInfo;
import com.naedam.mir9.payment.model.vo.TempPayInfo;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/payment")
@Slf4j
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	
	@PostMapping("/insert")
	@ResponseBody
	public int insert(String jsonStr) {
		Map<String, Object> param = Mir9Utils.parseJsonStr(jsonStr);
		int result = paymentService.insertPaymentInfo(param);
		
		return result;
	}

}
