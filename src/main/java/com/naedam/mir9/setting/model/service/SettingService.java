package com.naedam.mir9.setting.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.banner.model.vo.Banner;
import com.naedam.mir9.category.model.vo.Category;
import com.naedam.mir9.delivery.model.vo.DeliveryCompany;
import com.naedam.mir9.delivery.model.vo.DeliverySetting;
import com.naedam.mir9.delivery.model.vo.Doseosangan;
import com.naedam.mir9.history.model.vo.History;
import com.naedam.mir9.map.model.vo.Maps;
import com.naedam.mir9.popup.model.vo.Popup;

public interface SettingService {

	List<DeliveryCompany> selectDeliveryCompanyList();

	DeliverySetting selectOneDeliverySetting();

	List<Doseosangan> selectDoseosanganList();

	List<Maps> selectMapList();

	List<History> selectHistoryList();

	List<Banner> selectBannerList();

	List<Category> selectMenuCteList();

	List<Popup> selectPopupListByParam(Map<String, Object> param);

}
