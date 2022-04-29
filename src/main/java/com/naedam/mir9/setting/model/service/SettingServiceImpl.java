package com.naedam.mir9.setting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.banner.model.vo.Banner;
import com.naedam.mir9.category.model.vo.Category;
import com.naedam.mir9.coupon.model.vo.Coupon;
import com.naedam.mir9.delivery.model.vo.DeliveryCompany;
import com.naedam.mir9.delivery.model.vo.DeliveryNotice;
import com.naedam.mir9.delivery.model.vo.DeliverySetting;
import com.naedam.mir9.delivery.model.vo.Doseosangan;
import com.naedam.mir9.history.model.vo.History;
import com.naedam.mir9.map.model.vo.Maps;
import com.naedam.mir9.point.model.vo.Point;
import com.naedam.mir9.point.model.vo.PointSave;
import com.naedam.mir9.point.model.vo.PointUse;
import com.naedam.mir9.popup.model.vo.Popup;
import com.naedam.mir9.setting.model.dao.SettingDao;
import com.naedam.mir9.setting.model.vo.AdminMenu;
import com.naedam.mir9.setting.model.vo.AdminSetting;
import com.naedam.mir9.setting.model.vo.BillingPgSetting;
import com.naedam.mir9.setting.model.vo.Locale;
import com.naedam.mir9.setting.model.vo.SeoSetting;

@Service
public class SettingServiceImpl implements SettingService {
	@Autowired
	public SettingDao settingDao;

	@Override
	public List<DeliveryCompany> selectDeliveryCompanyList() {
		// TODO Auto-generated method stub
		return settingDao.selectDeliveryCompanyList();
	}

	@Override
	public DeliverySetting selectOneDeliverySetting() {
		// TODO Auto-generated method stub
		return settingDao.selectOneDeliverySetting();
	}

	@Override
	public List<Doseosangan> selectDoseosanganList() {
		// TODO Auto-generated method stub
		return settingDao.selectDoseosanganList();
	}

	@Override
	public List<Maps> selectMapList() {
		// TODO Auto-generated method stub
		return settingDao.selectMapList();
	}

	@Override
	public List<History> selectHistoryList() {
		// TODO Auto-generated method stub
		return settingDao.selectHistoryList();
	}

	@Override
	public List<Banner> selectBannerList() {
		// TODO Auto-generated method stub
		return settingDao.selectBannerList();
	}

	@Override
	public List<Category> selectMenuCteList() {
		// TODO Auto-generated method stub
		return settingDao.selectMenuCteList();
	}

	@Override
	public List<Popup> selectPopupListByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return settingDao.selectPopupListByParam(param);
	}

	@Override
	public List<Coupon> selectCouponListByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return settingDao.selectCouponListByParam(param);
	}

	@Override
	public Point selectPoint() {
		// TODO Auto-generated method stub
		return settingDao.selectPoint();
	}

	@Override
	public PointUse selectPointUse() {
		// TODO Auto-generated method stub
		return settingDao.selectPointUse();
	}

	@Override
	public PointSave selectPointSave() {
		// TODO Auto-generated method stub
		return settingDao.selectPointSave();
	}

	@Override
	public List<AdminMenu> selectAdminMenuList() {
		// TODO Auto-generated method stub
		return settingDao.selectAdminMenuList();
	}

	@Override
	public List<Locale> selectLocaleList() {
		// TODO Auto-generated method stub
		return settingDao.selectLocaleList();
	}

	@Override
	public AdminSetting selectAdminSetting() {
		// TODO Auto-generated method stub
		return settingDao.selectAdminSetting();
	}

	@Override
	public DeliveryNotice selectOneDeliveryNotice(String locale) {
		// TODO Auto-generated method stub
		return settingDao.selectOneDeliveryNotice(locale);
	}

	@Override
	public int updateAdminSetting(AdminSetting adminSetting) {
		// TODO Auto-generated method stub
		return settingDao.updateAdminSetting(adminSetting);
	}

	@Override
	public int updateDeliveryNotice(DeliveryNotice deliveryNotice) {
		// TODO Auto-generated method stub
		return settingDao.updateDeliveryNotice(deliveryNotice);
	}

	@Override
	public int updateAdminMenu(String menuNo) {
		// TODO Auto-generated method stub
		return settingDao.updateAdminMenu(menuNo);
	}

	@Override
	public int updateAdminMenuAllN() {
		// TODO Auto-generated method stub
		return settingDao.updateAdminMenuAllN();
	}

	@Override
	public int updateLocaleAllN() {
		// TODO Auto-generated method stub
		return settingDao.updateLocaleAllN();
	}

	@Override
	public int updateLocaleChoosen(String localeCode) {
		// TODO Auto-generated method stub
		return settingDao.updateLocaleChoosen(localeCode);
	}

	@Override
	public int updateLocaleDefault(String localeCode) {
		// TODO Auto-generated method stub
		return settingDao.updateLocaleDefault(localeCode);
	}

	@Override
	public SeoSetting selectSeoSetting() {
		// TODO Auto-generated method stub
		return settingDao.selectSeoSetting();
	}

	@Override
	public int updateSeoSetting(SeoSetting seo) {
		// TODO Auto-generated method stub
		return settingDao.updateSeoSetting(seo);
	}

	@Override
	public BillingPgSetting selectPgSetting() {
		// TODO Auto-generated method stub
		return settingDao.selectPgSetting();
	}

	
	
	
	
	
}
