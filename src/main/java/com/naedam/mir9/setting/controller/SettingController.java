package com.naedam.mir9.setting.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naedam.mir9.banner.model.vo.Banner;
import com.naedam.mir9.category.model.vo.Category;
import com.naedam.mir9.coupon.model.vo.Coupon;
import com.naedam.mir9.delivery.model.vo.DeliveryCompany;
import com.naedam.mir9.delivery.model.vo.DeliverySetting;
import com.naedam.mir9.delivery.model.vo.Doseosangan;
import com.naedam.mir9.history.model.vo.History;
import com.naedam.mir9.map.model.service.MapService;
import com.naedam.mir9.map.model.vo.MapApi;
import com.naedam.mir9.map.model.vo.Maps;
import com.naedam.mir9.point.model.vo.Point;
import com.naedam.mir9.point.model.vo.PointSave;
import com.naedam.mir9.point.model.vo.PointUse;
import com.naedam.mir9.popup.model.vo.Popup;
import com.naedam.mir9.setting.model.service.SettingService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/setting")
@Slf4j
public class SettingController {
	@Autowired
	private SettingService settingService;
	@Autowired
	private MapService mapService;
	
	@GetMapping("/point")
	public void point(Model model) {
		Point point = settingService.selectPoint();
		PointUse pointUse = settingService.selectPointUse();
		PointSave pointSave = settingService.selectPointSave();
		
		model.addAttribute("point", point);
		model.addAttribute("pointUse", pointUse);
		model.addAttribute("pointSave", pointSave);
	}
	
	@GetMapping("/coupon")
	public void coupon(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<Coupon> couponList = settingService.selectCouponListByParam(param);
		
		model.addAttribute("couponList",couponList);
	}
	
	@PostMapping("/coupon")
	@SuppressWarnings("rawtypes")
	public void coupon(HttpServletRequest request, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();

		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    param.put(name, request.getParameter(name));
		}
		
		List<Coupon> couponList = settingService.selectCouponListByParam(param);
		
		model.addAttribute("couponList",couponList);
		model.addAttribute("param",param);
	}
	
	@GetMapping("/popup")
	public void popup(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
 		List<Popup> popupList = settingService.selectPopupListByParam(param);
		
		model.addAttribute("popupList",popupList);
	}
	
	@PostMapping("/popup")
	public String popup(HttpServletRequest request, Model model) {
		Map<String, Object> param = new HashMap<String, Object>(); 
		param.put("start_date", request.getParameter("start_date"));
		param.put("end_date", request.getParameter("end_date"));
		param.put("field", request.getParameter("field"));
		param.put("keyword", request.getParameter("keyword"));
		
		log.debug("param = {}", param);
		
		List<Popup> popupList = settingService.selectPopupListByParam(param);
		
		model.addAttribute("param", param);
		model.addAttribute("popupList", popupList);
		
		
		return "/setting/popup";
	}
	
	
	@GetMapping("/map")
	public void map(Model model) {
		List<Maps> mapList = settingService.selectMapList();
		List<MapApi> apiList = mapService.selectAllMapApiList();
		model.addAttribute("mapList",mapList);
		model.addAttribute("apiList",apiList);
		model.addAttribute("apiKey", "D914287C-19AA-31AD-B187-1532CEF93E7F");
	}
	
	@GetMapping("/staff")
	public void staff() {
		
	}
	
	@GetMapping("/history")
	public void history(Model model) {
		List<History> historyList = settingService.selectHistoryList();
		
		model.addAttribute("historyList",historyList);
	}
	
	@GetMapping("/banner")
	public void banner(Model model) {
		List<Banner> bannerList = settingService.selectBannerList();
		List<Category> menuCteList = settingService.selectMenuCteList();
		model.addAttribute("bannerList",bannerList);
		model.addAttribute("menuCteList",menuCteList);
	}
	
	@GetMapping("/contract")
	public void contract() {}
	
	@GetMapping("/delivery_setting")
	public String deliverySertting(Model model) {
		DeliverySetting deliverySetting = settingService.selectOneDeliverySetting();
		List<Doseosangan> doseosanganList = settingService.selectDoseosanganList();
		
		model.addAttribute("deliverySetting",deliverySetting);
		model.addAttribute("doseosanganList",doseosanganList);
		
		return "setting/deliverySetting";
	}
	
	@GetMapping("/delivery_company")
	public String deliveryCompany(Model model) {
		
		List<DeliveryCompany> deliveryCompanyList = settingService.selectDeliveryCompanyList();
		model.addAttribute("deliveryCompanyList",deliveryCompanyList);
		model.addAttribute("companyListCnt",deliveryCompanyList.size());
		
		
		return "setting/deliveryCompany";
	}
	
	@GetMapping("/info")
	public void info() {}
	
	@GetMapping("/seo")
	public void seo() {}
	
	@GetMapping("/paymentpg")
	public void paymentpg() {}
	
	@GetMapping("/snslogin")
	public void snsLogin() {}
	
	@GetMapping("/locale")
	public void locale() {}
	
	@GetMapping("/version")
	public void version() {}
	
	@GetMapping("/test")
	public void test() {}
}
