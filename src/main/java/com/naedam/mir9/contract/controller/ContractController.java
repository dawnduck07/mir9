package com.naedam.mir9.contract.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naedam.mir9.common.Mir9Utils;
import com.naedam.mir9.contract.model.service.ContractService;
import com.naedam.mir9.contract.model.vo.Contract;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/contract")
@Slf4j
public class ContractController {
	
	@Autowired
	private ContractService contractService;
	
	@PostMapping("/getContract")
	@ResponseBody
	public Contract getContract(String locale) {
		Contract contract = contractService.selectOneContractByLocale(locale);
		return contract;
	}
	
	@PostMapping("/updateContract")
	@ResponseBody
	public int updateContract(HttpServletRequest request) {
		int result = 0;
		
		return result;
	}
}
