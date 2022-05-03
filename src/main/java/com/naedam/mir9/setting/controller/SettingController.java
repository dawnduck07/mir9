package com.naedam.mir9.setting.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.mir9.banner.model.vo.Banner;
import com.naedam.mir9.category.model.vo.Category;
import com.naedam.mir9.coupon.model.vo.Coupon;
import com.naedam.mir9.delivery.model.vo.DeliveryCompany;
import com.naedam.mir9.delivery.model.vo.DeliveryNotice;
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
import com.naedam.mir9.setting.model.vo.AdminMenu;
import com.naedam.mir9.setting.model.vo.AdminSetting;
import com.naedam.mir9.setting.model.vo.Locale;
import com.naedam.mir9.setting.model.vo.SeoSetting;
import com.naedam.mir9.setting.model.vo.SnsSetting;
import com.naedam.mir9.setting.model.vo.Staff;
import com.naedam.mir9.setting.model.vo.PGs.BillingPgSetting;
import com.naedam.mir9.setting.model.vo.PGs.EximbaySetting;
import com.naedam.mir9.setting.model.vo.PGs.KcpSetting;
import com.naedam.mir9.setting.model.vo.PGs.KgIniSetting;
import com.naedam.mir9.setting.model.vo.PGs.NaverShoppingSetting;
import com.naedam.mir9.setting.model.vo.PGs.NaverpaySetting;
import com.naedam.mir9.setting.model.vo.PGs.XpaySetting;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/setting")
@Slf4j
public class SettingController {
	@Autowired
	private SettingService settingService;
	@Autowired
	private MapService mapService;
	// (설정-임원관리) : 첨부파일 업로드 
	@Autowired
	ServletContext application;
	
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
	
	@GetMapping("/staff.do")
	public void staffList(Model model) {
		List<Staff> resultStaffList = settingService.selectStaffList();
		log.debug("resultStaffList = {}", resultStaffList);
		model.addAttribute("resultStaffList", resultStaffList);
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
	public void info(Model model) {
		List<AdminMenu> adminMenuList = settingService.selectAdminMenuList();
		List<Locale> localeList = settingService.selectLocaleList();
		AdminSetting adminSetting = settingService.selectAdminSetting();
		
		model.addAttribute("adminSetting", adminSetting);
		model.addAttribute("adminMenuList", adminMenuList);
		model.addAttribute("localeList", localeList);
		
	}
	
	@GetMapping("/img_view")
	public void img_view(String type, Model model) {
		AdminSetting adminSetting = settingService.selectAdminSetting();
		String url = null;
		if(type.equals("thumb")) {
			url = adminSetting.getThumbnailImg();
		}else if(type.equals("favicon")) {
			url = adminSetting.getFaviconImg();
		}
		
		model.addAttribute("url",url);
	}
	
	@PostMapping("/getDeliveryNotice.do")
	@ResponseBody
	public DeliveryNotice getDeliveryNotice(String locale) {
		DeliveryNotice deliveryNotice = settingService.selectOneDeliveryNotice(locale);
		
		return deliveryNotice;
	}
	
	@PostMapping("/process.do")
	public String process(HttpServletRequest request, AdminSetting adminSetting, DeliveryNotice deliveryNotice, AdminMenu adminMenu) {
		int result = 0;
		String mode = request.getParameter("mode");
		if(mode.equals("info")) {
			String phone = request.getParameter("mobile1") + request.getParameter("mobile2") + request.getParameter("mobile3");
			String callerId = request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3");
			adminSetting.setPhone(phone);
			adminSetting.setCallerId(callerId);
			if(adminSetting.getIsDiscount() == null) adminSetting.setIsDiscount("N");
			
			List<String> menuList = Arrays.asList(request.getParameterValues("admin_menu_list[]"));
			result = settingService.updateAdminMenuAllN();
			for(String menuNo : menuList) {
				result = settingService.updateAdminMenu(menuNo);
			}
			List<String> localeList = Arrays.asList(request.getParameterValues("locale_list[]"));
			result = settingService.updateLocaleAllN();
			for(String localeCode : localeList) {
				result = settingService.updateLocaleChoosen(localeCode);
			}
			
			result = settingService.updateLocaleDefault(request.getParameter("default_locale"));
			result = settingService.updateAdminSetting(adminSetting);
			
			
			
			
		}else if(mode.equals("updateGuide")) {
			result = settingService.updateDeliveryNotice(deliveryNotice);
		}
		
		
		return "redirect:/setting/info";
	}
	
	@GetMapping("/seo")
	public void seo(Model model) throws Exception {
		SeoSetting seo = settingService.selectSeoSetting();
		model.addAttribute("seo", seo);
	}
	
	@PostMapping("/seo_process")
	public String seo_process(HttpServletRequest request, SeoSetting seo,
							  @RequestParam("webmaster_naver") MultipartFile naverFileName,
							  @RequestParam("webmaster_google") MultipartFile googleFileName,
							  @RequestParam("webmaster_bing") MultipartFile bingFileName) throws Exception {
		SeoSetting seoSetting = settingService.selectSeoSetting();
		
		String filePath = request.getServletContext().getRealPath("/");
		if(seoSetting.getNaverFileName() == null && naverFileName.getOriginalFilename() != "") {
			System.out.println("확인 ::: "+naverFileName);
			File naver = new File(filePath+naverFileName.getOriginalFilename());
			naverFileName.transferTo(naver);
			seo.setNaverFileName(naverFileName.getOriginalFilename());
		}
		if(seoSetting.getGoogleFileName() == null && googleFileName.getOriginalFilename() != "") {
			File google = new File(filePath+googleFileName.getOriginalFilename());
			googleFileName.transferTo(google);
			seo.setGoogleFileName(googleFileName.getOriginalFilename());
		}		
		if(seoSetting.getBingFileName() == null && bingFileName.getOriginalFilename() != "") {
			File bing = new File(filePath+bingFileName.getOriginalFilename());
			bingFileName.transferTo(bing);
			seo.setBingFileName(bingFileName.getOriginalFilename());
		}				
			
		
		int result = settingService.updateSeoSetting(seo);
		System.out.println("여기 확인 ::: "+seo);
		String imagePath = request.getServletContext().getRealPath("robots.txt");
		BufferedWriter bw = new BufferedWriter(new FileWriter(imagePath));
		bw.write(seo.getRobots());
		bw.close();
		return "redirect:/setting/seo";
	}
	
	@GetMapping("/paymentpg")
	public void paymentpg(Model model) {
		BillingPgSetting pg = settingService.selectPgSetting();
		NaverShoppingSetting naverShopping = settingService.selectNaverShoppingSetting();
		
		if(pg.getIsDomestic().equals("Y")) {
			KgIniSetting kgIni = settingService.selectKgIniSetting();
			model.addAttribute("kgIni",kgIni);
		}
		
		if(pg.getIsForeigne().equals("Y")) {
			EximbaySetting eximbay = settingService.selectEximbaySetting();
			model.addAttribute("eximbay", eximbay);
		}
		
		if(pg.getNaverpayUse().equals("Y")) {
			NaverpaySetting naverpay = settingService.selectNaverpaySetting();
			model.addAttribute("naverpay", naverpay);
		}
		
		model.addAttribute("pg",pg);
		model.addAttribute("naverShopping",naverShopping);
	}
	
	@PostMapping("/pg_process")
	@ResponseBody
	public Object pg_process(String method, HttpServletRequest request){
		Map<String, String> result = new HashMap<String, String>();
		log.debug("method = {}", method);
		
		if(method.equals("billing_pg_info")) {
			BillingPgSetting pgSetting = settingService.selectPgSetting();
			
			return pgSetting;
		}else if(method.equals("getCardPgInfo")) {
			String type = request.getParameter("type");
			log.debug("type = {}", type);
			if(type.equals("ini")) {
				KgIniSetting kg = settingService.selectKgIniSetting();
				return kg;
			}else if(type.equals("xpay")) {
				XpaySetting xpay = settingService.selectXpaySetting();
				return xpay;
			}else if(type.equals("kcp")) {
				KcpSetting kcp = settingService.selectKcpSetting();
				return kcp;
			}
		}
		
		
		return result;
	}
	
	
	
	@GetMapping("/snslogin")
	public String snsLogin(Model model, SnsSetting snsSetting) {
		System.out.println("settingController/snsSetting 시작");
		
		snsSetting = settingService.selectSnsSetting();
		model.addAttribute("snsSetting",snsSetting);
		
		return "setting/sns";
	}
	
	@PostMapping("/updateSnsSetting")
	public String updateSnsSetting(SnsSetting snsSetting) {
		System.out.println("settingController/updateSnsSetting 시작");
		settingService.updateSnsSetting(snsSetting);
		return "redirect:/setting/snslogin";
	}
	
	@GetMapping("/locale")
	public void locale() {}
	
	@GetMapping("/version")
	public void version() {}
	
	@GetMapping("/test")
	public void test() {}
	
	
	@PostMapping("/staffEnroll.do")
	public String staffEnroll(Staff staff, 
							  RedirectAttributes redirectAttribute,
							  HttpServletRequest request) {
		log.debug("{}", "staffEnroll.do 실행!");
		log.debug("staff = {}", staff);
		
		int result = 0;
		String msg = null;
		String mode = request.getParameter("mode");
		
		if(mode.equals("insert")) {
			int resultInsertStaff = settingService.insertStaff(staff);
			log.debug("resultInsertStaff = {}", resultInsertStaff);
		}
	
	return "redirect:/setting/staff.do";
	}


}

