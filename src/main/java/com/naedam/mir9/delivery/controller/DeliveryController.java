package com.naedam.mir9.delivery.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naedam.mir9.common.Mir9Utils;
import com.naedam.mir9.delivery.model.service.DeliveryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/delivery")
@Slf4j
public class DeliveryController {
	@Autowired
	private DeliveryService deliveryService;
	
	@GetMapping("/doseosangan")
	@ResponseBody
	public int doseosangan(int zipcode) {
		int result = deliveryService.selectDoseosanganFeeByZipcode(zipcode);
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/insertCompany")
	public int insertCompany(String jsonStr){
		Map<String,Object> param = Mir9Utils.parseJsonStr(jsonStr);
		
		int result = deliveryService.insertDeliveryCompanyByParam(param);
		
		
		return result;
	}
	
	@PostMapping("/deleteCompany")
	public String deleteCompany(HttpServletRequest request) {
		String[] companyNoList = request.getParameterValues("companyNoList");
		
		log.debug("companyNoList = {}", companyNoList);
		
		
		
				
		return "redirect:/setting/delivery_company";
	}
}
