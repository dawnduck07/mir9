package com.naedam.mir9.contract.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.contract.model.vo.Contract;

@Repository
public class ContractDaoImpl implements ContractDao {
	@Autowired
	private SqlSession session;

	@Override
	public Contract selectOneContractByLocale(String locale) {
		// TODO Auto-generated method stub
		return session.selectOne("contract.selectOneContractByLocale", locale);
	}
	
	
}
