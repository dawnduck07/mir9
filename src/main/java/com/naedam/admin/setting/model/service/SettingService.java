package com.naedam.admin.setting.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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



public interface SettingService {

	Object paymentPGSelectProcess(Map<String, Object> map) throws Exception;
	
	void paymentPGProcess(Map<String, Object> map) throws Exception;
	
	void seoProcess(Map<String, Object> map) throws Exception;
	
	Map<String, Object> staffProcess(Map<String, Object> map);
	
	int infoProcess(Map<String, Object> map);
	
	List<DeliveryCompany> selectDeliveryCompanyList();

	List<Doseosangan> selectDoseosanganList();

	List<Maps> selectMapList();

	List<History> selectHistoryList();

	List<Banner> selectBannerList();

	List<Category> selectMenuCteList();

	List<Popup> selectPopupListByParam(Map<String, Object> param);

	Map<String, Object> selectCouponListByParam(Map<String, Object> param, HttpServletRequest request);

	Map<String, Object> selectPoint();

	PointUse selectPointUse();

	PointSave selectPointSave();

	List<AdminMenu> selectAdminMenuList();

	List<Locale> selectLocaleList();

	AdminSetting selectAdminSetting();

	DeliveryNotice selectOneDeliveryNotice(String locale);

	int updateAdminSetting(AdminSetting adminSetting);

	int updateDeliveryNotice(DeliveryNotice deliveryNotice);

	int updateAdminMenu(String menuNo);

	int updateAdminMenuAllN();

	int updateLocaleAllN();

	int updateLocaleChoosen(String localeCode);

	int updateLocaleDefault(String parameter);

	SeoSetting selectSeoSetting();

	int updateSeoSetting(SeoSetting seo);

	BillingPgSetting selectPgSetting();

	KgIniSetting selectKgIniSetting();

	EximbaySetting selectEximbaySetting();

	NaverShoppingSetting selectNaverShoppingSetting();

	NaverpaySetting selectNaverpaySetting();

	XpaySetting selectXpaySetting();

	KcpSetting selectKcpSetting();
	
	SnsSetting selectSnsSetting();
	
	int updateSnsSetting(SnsSetting snsSetting);

	Map<String, Object> selectStaffList();

	int selectStaffListCount();

	List<Staff> selectSearchStaffList(Map<String, Object> param);

	int selectsearchStaffListCount(Map<String, Object> param);

	int updateKgIniSetting(KgIniSetting kg);

	int updateXpaySetting(XpaySetting xpay);

	int updateKcpSetting(KcpSetting kcp);

	int updateBillingPgSetting(BillingPgSetting pg);

	int updateNaverpaySetting(NaverpaySetting naverpay);

	int updateNaverShoppingSetting(NaverShoppingSetting naverShopping);

	Staff selectOneStaffByStaffNo(int staffNo);

	Map<String, Object> selectOneimgUrlBystaffNo(int staffNo) throws Exception;

	Staff selectMaxOrder();

	int updateChangeOrderUp(Staff paramStaff);

	int updateChangeOrderUpNext(Staff paramStaff);

	Staff selectInputRowOrder(Staff paramStaff);

	Staff selectMinOrder();

	int updateChangeOrderDown(Staff paramStaff);

	int updateChangeOrderDownNext(Staff paramStaff);

	int updateChangeOrderUpNext(int input_row_order);
	
	int deleteStaffImg(int staffNo);

	DeliverySetting selectOneDeliverySetting();

	
}
