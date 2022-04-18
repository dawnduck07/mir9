package com.naedam.mir9.setting.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.banner.model.vo.Banner;
import com.naedam.mir9.category.model.vo.Category;
import com.naedam.mir9.delivery.model.vo.DeliveryCompany;
import com.naedam.mir9.delivery.model.vo.DeliverySetting;
import com.naedam.mir9.delivery.model.vo.Doseosangan;
import com.naedam.mir9.history.model.vo.History;
import com.naedam.mir9.map.model.vo.Maps;
import com.naedam.mir9.popup.model.vo.Popup;

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

	@Override
	public List<Maps> selectMapList() {
		// TODO Auto-generated method stub
		return session.selectList("setting.selectMapList");
	}

	@Override
	public List<History> selectHistoryList() {
		// TODO Auto-generated method stub
		return session.selectList("setting.selectHistoryList");
	}

	@Override
	public List<Banner> selectBannerList() {
		// TODO Auto-generated method stub
		return session.selectList("setting.selectBannerList");
	}

	@Override
	public List<Category> selectMenuCteList() {
		// TODO Auto-generated method stub
		return session.selectList("setting.selectMenuCteList");
	}

	@Override
	public List<Popup> selectPopupList() {
		// TODO Auto-generated method stub
		return session.selectList("setting.selectPopupList");
	}
	
	
	
}
