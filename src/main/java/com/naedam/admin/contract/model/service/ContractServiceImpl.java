package com.naedam.admin.contract.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.contract.model.dao.ContractDao;
import com.naedam.admin.contract.model.vo.Contract;

@Service
public class ContractServiceImpl implements ContractService {
	@Autowired
	private ContractDao contractDao;

	/**
	 * 약관 조회
	 */
	@Override
	public Contract selectOneContractByLocale(String locale) {
		return contractDao.selectOneContractByLocale(locale);
	}

	/**
	 * 약관 수정
	 */
	@Override
	public int updateContract(Contract contract) {
		return contractDao.updateContract(contract);
	}
	
	
}
