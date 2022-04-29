package com.naedam.mir9.setting.model.service;

import java.util.List;
import java.util.Map;

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
import com.naedam.mir9.setting.model.vo.AdminMenu;
import com.naedam.mir9.setting.model.vo.AdminSetting;
import com.naedam.mir9.setting.model.vo.Locale;
import com.naedam.mir9.setting.model.vo.SeoSetting;
import com.naedam.mir9.setting.model.vo.PGs.BillingPgSetting;
import com.naedam.mir9.setting.model.vo.PGs.EximbaySetting;
import com.naedam.mir9.setting.model.vo.PGs.KcpSetting;
import com.naedam.mir9.setting.model.vo.PGs.KgIniSetting;
import com.naedam.mir9.setting.model.vo.PGs.NaverShoppingSetting;
import com.naedam.mir9.setting.model.vo.PGs.NaverpaySetting;
import com.naedam.mir9.setting.model.vo.PGs.XpaySetting;

public interface SettingService {

	List<DeliveryCompany> selectDeliveryCompanyList();

	DeliverySetting selectOneDeliverySetting();

	List<Doseosangan> selectDoseosanganList();

	List<Maps> selectMapList();

	List<History> selectHistoryList();

	List<Banner> selectBannerList();

	List<Category> selectMenuCteList();

	List<Popup> selectPopupListByParam(Map<String, Object> param);

	List<Coupon> selectCouponListByParam(Map<String, Object> param);

	Point selectPoint();

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


}
