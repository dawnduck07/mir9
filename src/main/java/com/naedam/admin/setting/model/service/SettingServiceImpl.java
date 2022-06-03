package com.naedam.admin.setting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.banner.model.vo.Banner;
import com.naedam.admin.category.model.vo.Category;
import com.naedam.admin.coupon.model.vo.Coupon;
import com.naedam.admin.delivery.model.vo.DeliveryCompany;
import com.naedam.admin.delivery.model.vo.DeliveryNotice;
import com.naedam.admin.delivery.model.vo.DeliverySetting;
import com.naedam.admin.delivery.model.vo.Doseosangan;
import com.naedam.admin.history.model.vo.History;
import com.naedam.admin.map.model.vo.Maps;
import com.naedam.admin.point.model.vo.Point;
import com.naedam.admin.point.model.vo.PointSave;
import com.naedam.admin.point.model.vo.PointUse;
import com.naedam.admin.popup.model.vo.Popup;
import com.naedam.admin.setting.model.dao.SettingDao;
import com.naedam.admin.setting.model.vo.AdminMenu;
import com.naedam.admin.setting.model.vo.AdminSetting;
import com.naedam.admin.setting.model.vo.Locale;
import com.naedam.admin.setting.model.vo.SeoSetting;
import com.naedam.admin.setting.model.vo.SnsSetting;
import com.naedam.admin.setting.model.vo.Staff;
import com.naedam.admin.setting.model.vo.PGs.BillingPgSetting;
import com.naedam.admin.setting.model.vo.PGs.EximbaySetting;
import com.naedam.admin.setting.model.vo.PGs.KcpSetting;
import com.naedam.admin.setting.model.vo.PGs.KgIniSetting;
import com.naedam.admin.setting.model.vo.PGs.NaverShoppingSetting;
import com.naedam.admin.setting.model.vo.PGs.NaverpaySetting;
import com.naedam.admin.setting.model.vo.PGs.XpaySetting;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	public BillingPgSetting selectPgSetting() {
		// TODO Auto-generated method stub
		return settingDao.selectPgSetting();
	}

	@Override
	public KgIniSetting selectKgIniSetting() {
		// TODO Auto-generated method stub
		return settingDao.selectKgIniSetting();
	}

	@Override
	public EximbaySetting selectEximbaySetting() {
		// TODO Auto-generated method stub
		return settingDao.selectEximbaySetting();
	}

	@Override
	public NaverShoppingSetting selectNaverShoppingSetting() {
		// TODO Auto-generated method stub
		return settingDao.selectNaverShoppingSetting();
	}

	@Override
	public NaverpaySetting selectNaverpaySetting() {
		// TODO Auto-generated method stub
		return settingDao.selectNaverpaySetting();
	}

	@Override
	public XpaySetting selectXpaySetting() {
		// TODO Auto-generated method stub
		return settingDao.selectXpaySetting();
	}

	@Override
	public KcpSetting selectKcpSetting() {
		// TODO Auto-generated method stub
		return settingDao.selectKcpSetting();
	}

	@Override
	public int updateKgIniSetting(KgIniSetting kg) {
		// TODO Auto-generated method stub
		return settingDao.updateKgIniSetting(kg);
	}

	@Override
	public int updateXpaySetting(XpaySetting xpay) {
		// TODO Auto-generated method stub
		return settingDao.updateXpaySetting(xpay);
	}

	@Override
	public int updateKcpSetting(KcpSetting kcp) {
		// TODO Auto-generated method stub
		return settingDao.updateKcpSetting(kcp);
	}

	@Override
	public int updateBillingPgSetting(BillingPgSetting pg) {
		// TODO Auto-generated method stub
		return settingDao.updateBillingPgSetting(pg);
	}

	@Override
	public int updateNaverpaySetting(NaverpaySetting naverpay) {
		// TODO Auto-generated method stub
		return settingDao.updateNaverpaySetting(naverpay);
	}

	@Override
	public int updateNaverShoppingSetting(NaverShoppingSetting naverShopping) {
		// TODO Auto-generated method stub
		return settingDao.updateNaverShoppingSetting(naverShopping);
	}

	@Override
	public SnsSetting selectSnsSetting() {
		// TODO Auto-generated method stub
		return settingDao.selectSnsSetting();
	}

	@Override
	public int updateSnsSetting(SnsSetting snsSetting) {
		// TODO Auto-generated method stub
		return settingDao.updateSnsSetting(snsSetting);
	}
	
	@Override
	public int insertStaff(Staff staff) {
		return settingDao.insertStaff(staff);
	}

	@Override 
	public List<Staff> selectStaffList() { 
		return settingDao.selectStaffList(); 
	}

	@Override
	public int selectStaffListCount() {
		return settingDao.totalStaffListCount();
	}

	@Override
	public int deleteStaff(int[] staffNo) {
		return settingDao.deleteStaff(staffNo);
	}

	@Override
	public List<Staff> selectSearchStaffList(Map<String, Object> param) {
		return settingDao.searchStaffList(param);
	}

	@Override
	public int selectsearchStaffListCount(Map<String, Object> param) {
		return settingDao.selectsearchStaffListCount(param);
	}

	@Override
	public Staff selectOneStaffByStaffNo(int staffNo) {
		return settingDao.selectOneStaffByStaffNo(staffNo);
	}

	@Override
	public Staff selectOneimgUrlBystaffNo(int staffNo) {
		return settingDao.selectOneimgUrlBystaffNo(staffNo);
	}

	@Override
	public int deleteStaffImg(int staffNo) {
		return settingDao.deleteStaffImg(staffNo);
	}

	@Override
	public int updateStaff(Staff staff) {
		return settingDao.updateStaff(staff);
	}

	@Override
	public Staff selectMaxOrder() {
		return settingDao.selectMaxOrder();
	}

	@Override
	public int updateChangeOrderUp(Staff paramStaff) {
		return settingDao.updateChangeOrderUp(paramStaff);
	}

	@Override
	public int updateChangeOrderUpNext(Staff paramStaff) {
		return settingDao.updateChangeOrderUpNext(paramStaff);
	}

	@Override
	public Staff selectInputRowOrder(Staff paramStaff) {
		return settingDao.selectInputRowOrder(paramStaff);
	}

	@Override
	public Staff selectMinOrder() {
		return settingDao.selectMinOrder();
	}

	@Override
	public int updateChangeOrderDown(Staff paramStaff) {
		return settingDao.updateChangeOrderDown(paramStaff);
	}

	@Override
	public int updateChangeOrderDownNext(Staff paramStaff) {
		return settingDao.updateChangeOrderDownNext(paramStaff);
	}

	@Override
	public int updateChangeOrderUpNext(int input_row_order) {
		return settingDao.updateChangeOrderUpNext(input_row_order);
	}

	
}
