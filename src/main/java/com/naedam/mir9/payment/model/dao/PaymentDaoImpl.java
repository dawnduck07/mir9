package com.naedam.mir9.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.payment.model.vo.PaymentInfo;

@Repository
public class PaymentDaoImpl implements PaymentDao {
	@Autowired
	private SqlSession session;

	@Override
	public int insertPaymentInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("payment.insertPaymentInfo", param);
	}

	@Override
	public List<PaymentInfo> selectPaymentInfoList() {
		// TODO Auto-generated method stub
		return session.selectList("payment.selectPaymentInfoList");
	}
	
	
}
