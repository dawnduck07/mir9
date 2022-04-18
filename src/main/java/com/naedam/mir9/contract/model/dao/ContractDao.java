package com.naedam.mir9.contract.model.dao;

import com.naedam.mir9.contract.model.vo.Contract;

public interface ContractDao {

	Contract selectOneContractByLocale(String locale);

	int updateContract(Contract contract);

}
