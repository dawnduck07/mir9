package com.naedam.mir9.setting.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.delivery.model.vo.DeliveryCompany;
import com.naedam.mir9.delivery.model.vo.DeliverySetting;
import com.naedam.mir9.delivery.model.vo.Doseosangan;

@Repository
public class SettingDaoImpl implements SettingDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<DeliveryCompany> selectDeliveryCompanyList() {
		// TODO Auto-generated method stub
		return session.selectList("setting.selectDeliveryCompanyList");
	}

	@Override
	public DeliverySetting selectOneDeliverySetting() {
		// TODO Auto-generated method stub
		return session.selectOne("setting.selectOneDeliverySetting");
	}

	@Override
	public List<Doseosangan> selectDoseosanganList() {
		// TODO Auto-generated method stub
		return session.selectList("setting.selectDoseosanganList");
	}
	
	
	
}
