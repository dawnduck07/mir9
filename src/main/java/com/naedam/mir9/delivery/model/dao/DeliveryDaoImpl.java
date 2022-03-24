package com.naedam.mir9.delivery.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDaoImpl implements DeliveryDao {
	@Autowired
	private SqlSession session;

	@Override
	public int selectDoseosanganFeeByZipcode(int zipcode) {
		// TODO Auto-generated method stub
		return session.selectOne("delivery.selectDoseosanganFeeByZipcode",zipcode);
	}

	@Override
	public int insertDeliveryCompanyByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("delivery.insertDeliveryCompanyByParam", param);
	}

	@Override
	public int deleteDeliveryCompanyByComNo(String comNo) {
		// TODO Auto-generated method stub
		return session.delete("delivery.deleteDeliveryCompanyByComNo", comNo);
	}
	
	
	
	
}
