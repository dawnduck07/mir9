package com.naedam.mir9.contract.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.contract.model.dao.ContractDao;
import com.naedam.mir9.contract.model.vo.Contract;

@Service
public class ContractServiceImpl implements ContractService {
	@Autowired
	private ContractDao contractDao;

	@Override
	public Contract selectOneContractByLocale(String locale) {
		// TODO Auto-generated method stub
		return contractDao.selectOneContractByLocale(locale);
	}
	
	
}
