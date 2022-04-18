package com.naedam.mir9.contract.model.service;

import com.naedam.mir9.contract.model.vo.Contract;

public interface ContractService {

	Contract selectOneContractByLocale(String locale);

	int updateContract(Contract contract);

}
